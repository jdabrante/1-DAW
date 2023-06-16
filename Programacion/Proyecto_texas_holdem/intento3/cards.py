import helpers

class Card:
    SPADES = '♠'
    HEARTS = '❤'
    DIAMONDS = '◆'
    CLUBS = '♣'
    SYMBOLS = ('A','2','3','4','5','6','7','8','9','10','J','Q','K')
    def __init__(self, suit_value: str):
        self.suit_value = suit_value
        self.suit = self.suit_value[-1]

# Devuelve el valor de la carta individual como entero mirando la variable de clase SYMBOLS
    @property
    def value(self):
        rank = self.suit_value[:-1]
        rank_value = Card.SYMBOLS.index(rank) + 1
        return 14 if rank_value == 1 else rank_value

# Devuelve la carta con el símbolo del valor y el palo (K♣)
    def __repr__(self) -> str:
        return self.suit_value

# Se podri implementar para que reconociera si se está comparando con un objeto de tipo card o no

    def __gt__(self, other) -> bool:
        return self.value > other.value
    
    def __lt__(self, other) -> bool:
        return self.value < other.value

# El igual solo tienen cuenta el valor, no el palo, ya que no pueden haber cartas con valores y palos iguales
    def __eq__(self, other) -> bool:
        if isinstance(other, Card):
            return self.value == other.value    
        return self.value == Card.SYMBOLS.index(other[:-1]) + 1

# Hand va a ser la encargada de clasificar la mano y dar el valor del rank y categoria. Hay que tener en cuenta que la categoria se da como entero y el rank como str
class Hand:
    HIGH_CARD = 1
    ONE_PAIR = 2
    TWO_PAIR = 3
    THREE_OF_A_KIND = 4
    STRAIGHT = 5
    FLUSH = 6
    FULL_HOUSE = 7
    FOUR_OF_A_KIND = 8
    STRAIGHT_FLUSH = 9

# En el sorted no hace falta especificar que es por el value, ya que en el método mágico de las cartas se ha señalado como se debe de comportar

    def __init__(self, combination: list[Card]):
        self.combination = sorted(combination)

    @property
    def cat(self):
# Estos valores de las cartas son enteros. El resultado de la categoria también devolerá un entero
# La categoria es quien en gran medida va a determinar cual es la mejor carta dentro de las combinaciones y contra otras cartas
        card_values = sorted(card.value for card in self.combination)
        card_suits = [card.suit for card in self.combination]
        set_values = sorted(set(card_values))
        set_suits = list(set(card_suits))
        if len(set_suits) == 1 and (card_values[-1] - card_values[0]) == 4:
            return Hand.STRAIGHT_FLUSH
        if len(set_values) == 2:
            if max(card_values.count(set_values[0]), card_values.count(set_values[1])) == 4:
                return Hand.FOUR_OF_A_KIND
            return Hand.FULL_HOUSE
        if len(set_suits) == 1:
            return Hand.FLUSH
        if len(set_values) == 5 and (card_values[-1] - card_values[0]) == 4:
            return Hand.STRAIGHT
        if len(set_values) == 3:
            is_three_of_a_kind = False
            for value in card_values:
                if card_values.count(value) == 3:
                    is_three_of_a_kind = True
                    break
            if is_three_of_a_kind:
                return Hand.THREE_OF_A_KIND
            return Hand.TWO_PAIR
        if len(set_values) == 4:
            return Hand.ONE_PAIR
        return Hand.HIGH_CARD

    @property
    def cat_rank(self):
# Aquí hay que devolver un str, por lo que se complica a la hora de utilizar esto para comparar los empates.
# self.combination ya está ordenado por valor
# Se puede hacer un count por card ya que especificamos que el eq serie solo si el valor es igual
# El one pair se lleva el valor de la pareja
        if self.cat == Hand.FULL_HOUSE:
            first_card = self.combination[0].suit_value
            last_card = self.combination[-1].suit_value
            three, pair = (first_card[:-1], last_card[:-1]) if self.combination.count(first_card) == 3 else (last_card[:-1], first_card[:-1])
            return three, pair
        if self.cat == Hand.TWO_PAIR:
            pairs = []
            for card in self.combination:
                if self.combination.count(card) == 2 and card not in pairs:
                    pairs.append(card)
            highest_pair = max(pairs)
            lowest_pair = min(pairs)
            return highest_pair.suit_value[:-1], lowest_pair.suit_value[:-1]
        if self.cat == Hand.ONE_PAIR:
            for card in self.combination:
                if self.combination.count(card) == 2:
                    return card.suit_value[:-1]
        if self.cat == Hand.THREE_OF_A_KIND:
            for card in self.combination:
                if self.combination.count(card) == 3:
                    return card.suit_value[:-1]
        if self.cat == Hand.FOUR_OF_A_KIND:
            for card in self.combination:
                if self.combination.count(card) == 4:
                    return card.suit_value[:-1]
        return self.combination[-1].suit_value[:-1]
    
    CAT_VALUES = {'A': 14, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7, '8': 8, '9': 9 , '10': 10, 'J': 11, 'Q': 12, 'K': 13}

    def __gt__(self, other):
        if self.cat > other.cat:
            return True
        if self == other:
            player1_hand = sorted(self, reverse=True)
            player2_hand = sorted(other, reverse=True)
            for card_player1, card_player2 in zip(player1_hand, player2_hand):
                if card_player1 > card_player2:
                    return True
                if card_player2 > card_player1:
                    return False
        if self.cat == other.cat:
            if self.cat == Hand.TWO_PAIR or self.cat == Hand.FULL_HOUSE:
                player1_rank = [Hand.CAT_VALUES[rank] for rank in self.cat_rank]
                player2_rank = [Hand.CAT_VALUES[rank] for rank in other.cat_rank]
# Hay que tener en cuenta si tanto el cat como el rank son iguales
                return player1_rank > player2_rank
            return Hand.CAT_VALUES[self.cat_rank] > Hand.CAT_VALUES[other.cat_rank]
        return False
    
#     def __lt__(self, other):
# # Esto está mal, cuando el cat y rank son iguales y se quiere comprobar los otros números, si son exactamente iguales las manos da Verdadero
#         if not self > other:
#             return True
#         return False
    
    def __eq__(self, other):
        return self.cat == other.cat and self.cat_rank == other.cat_rank


    def __iter__(self):
        return IterableHand(self)
    
    def __repr__(self) -> str:
        return f'{self.combination}'
    
    def __contains__(self, card: Card):
        return card in self.combination
    
class IterableHand:
    def __init__(self, hand: Hand):
        self.hand = hand
        self.pointer = 0

    def __next__(self):
        if self.pointer >= len(self.hand.combination):
            raise StopIteration
        result = self.hand.combination[self.pointer]
        self.pointer += 1
        return result
        


# hand1 = Hand([Card('K❤'), Card('K◆'), Card('3❤'), Card('3◆'), Card('A◆')])
# hand2 = Hand([Card('K♣'), Card('K♠'), Card('3♣'), Card('3♠'), Card('A♠')])
# print(hand1.cat, hand1.cat_rank)
# print(hand2.cat, hand2.cat_rank)
# print(hand2 < hand1)
