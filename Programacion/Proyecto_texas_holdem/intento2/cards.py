import helpers

SUITS = '♣❤♠◆'

class Card:
    SYMBOLS = ('A','2','3','4','5','6','7','8','9','10','J','Q','K')
    def __init__(self, card: str):
        self.card = card
    
    @property
    def suit(self):
        return self.card[-1]
    
    @property
    def value(self):
        real_value = Card.SYMBOLS.index(self.card[:-1]) + 1
        if real_value == 1: 
            return 14
        return real_value
    
    def __repr__(self) -> str:
        return f'{self.value}{self.suit}'

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

    def __init__(self, combination: list[Card]):
        self.combination = sorted(combination, key = lambda c: c.value)

    @property
    def cat(self):
        values = sorted(card.value for card in self.combination)
        suits = [card.suit for card in self.combination]
        set_values = sorted(set(values))
        set_suits = list(set(suits))
        if len(set_suits) == 1 and (values[-1] - values[0]) == 4:
            cat = Hand.STRAIGHT_FLUSH
        elif len(set_values) == 2:
            if max(values.count(set_values[0]), values.count(set_values[1])) == 4:
                cat = Hand.FOUR_OF_A_KIND
            else:
                cat = Hand.FULL_HOUSE
        elif len(set_suits) == 1:
            cat = Hand.FLUSH
        elif (values[-1] - values[0]) == 4 and len(set_values) == 5:
            cat = Hand.STRAIGHT
        elif len(set_values) == 3:
            max_number_of_cards = max(values.count(set_values[0]), values.count(set_values[1]), values.count(set_values[2]))
            if max_number_of_cards == 3:
                cat = Hand.THREE_OF_A_KIND
            else: 
                cat = Hand.TWO_PAIR
        elif len(set_values) == 4: 
            cat = Hand.ONE_PAIR
        else: 
            cat = Hand.HIGH_CARD
        return cat
    
    @property
    def cat_rank(self):
        values = sorted(card.value for card in self.combination)
        if self.cat == self.FULL_HOUSE:
            for value in values:
                if values.count(value) == 3:
                    three = value
                else: 
                    pair = value
            rank = (str(three), str(pair))
        elif self.cat == self.TWO_PAIR:
            rank = tuple(sorted(set(str(value) for value in values if values.count(value) == 2)))
        else: 
            rank = str(values[-1])
        return rank
    

    def __gt__(self, other):
        if self.cat_rank == other.cat_rank and self.cat == other.cat:
            hands = [self.combination, other.combination]
            if sorted(card.value for card in hands[0]) > sorted(card.value for card in hands[1]) :
                return True
        if self.cat > other.cat: 
            return True
        if self.cat == other.cat and self.cat_rank > other.cat_rank:
            return True
        return False
    

    def __lt__(self, other):
        if self.cat_rank == other.cat_rank and self.cat == other.cat:
            hands = [self.combination, other.combination]
            if sorted(card.value for card in hands[0]) < sorted(card.value for card in hands[1]):
                return True
        if self.cat < other.cat: 
            return True
        if self.cat == other.cat and self.cat_rank < other.cat_rank:
            return True
        return False


    def __eq__(self, other):
        if self.cat_rank == other.cat_rank and self.cat == other.cat:
            hands = [self.combination, other.combination]
            if sorted(card.value for card in hands[0]) == sorted(card.value for card in hands[1]):
                return True
        return False

    def __repr__(self) -> str:
        return f'{self.combination}'
    
    def __iter__(self):
        return IterableHand(self)
    
    def __contains__(self, card: Card):
        return f'{card}' in [f'{card}' for card in self.combination]
    
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

    




