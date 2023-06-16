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

    def __init__(self, private_cards: list[Card], common_cards: list[Card]):
        self.private_cards = private_cards
        self.common_cards = common_cards
        self.cat = 0
        self.rank = 0
        self.full_cards = private_cards + common_cards
        self.combinations = helpers.combinations(values=self.full_cards, n=5)
        self.best_combination = 0


    def best_hand(self):
        for combination in self.combinations:
            values = sorted(card.value for card in combination)
            suits = [card.suit for card in combination]
            set_values = sorted(set(values))
            set_suits = sorted(set(suits))
            if len(set_suits) == 1 and (values[-1] - values[0]) == 4 and self.cat <= Hand.STRAIGHT_FLUSH:
                print(combination)
                self.cat, self.rank  =  self.compare_with_actual_hand(Hand.STRAIGHT_FLUSH, values[-1], combination)
            elif len(set_values) == 2 and self.cat <= Hand.FOUR_OF_A_KIND :
                first_value = values.count(set_values[0])
                second_value = values.count(set_values[1])
                if max(first_value, second_value) == 3:
                    print(combination)
                    three, pair = (set_values[0], set_values[1]) if values.count(set_values[0]) == 3 else (set_values[1], set_values[0])
                    self.cat, self.rank = self.compare_with_actual_hand(Hand.FULL_HOUSE, (three, pair), combination)
                else:
                    print(combination)
                    self.cat, self.rank = self.compare_with_actual_hand(Hand.FOUR_OF_A_KIND, set_values[-1], combination)
            elif len(set_suits) == 1 and self.cat <= Hand.FLUSH:
                print(combination)
                self.cat, self.rank = self.compare_with_actual_hand(Hand.FLUSH, set_values[-1], combination)
            elif (values[-1] - values[0]) == 4 and set_values == 5 and self.cat <= Hand.STRAIGHT:
                print(combination)
                self.cat, self.rank = self.compare_with_actual_hand(Hand.STRAIGHT, set_values[-1], combination)
            elif len(set_values) == 3 and self.cat <= Hand.THREE_OF_A_KIND:
                print(combination)
                max_number_of_cards = max(values.count(set_values[0]), values.count(set_values[1]), values.count(set_values[2]))
                if max_number_of_cards == 3:
                    for value in set_values:
                        if values.count(value) == 3:
                            self.cat, self.rank = self.compare_with_actual_hand(Hand.THREE_OF_A_KIND, set_values[-1], combination)
                            break
                else:
                    self.cat, self.rank = self.compare_with_actual_hand(Hand.TWO_PAIR, (set_values[-1], set_values[-2]), combination)
            elif len(set_values) == 4 and self.cat <= Hand.ONE_PAIR:
                self.cat, self.rank = self.compare_with_actual_hand(Hand.ONE_PAIR, set_values[-1], combination)
            elif self.cat <= Hand.HIGH_CARD:
                self.cat, self.rank = self.compare_with_actual_hand(Hand.HIGH_CARD, set_values[-1], combination)

    # def is_equal_cat_rank(self, other):
    #     return self.cat == other.cat and self.rank == other.rank
    
    # def is_equal_values(self, other):
    #     first_player_values = sorted(card.value for card in self.best_combination)
    #     second_player_values = sorted(card.value for card in other.best_combination)
    #     if first_player_values == second_player_values:
    #         return True
    #     return self.best_combination if max(first_player_values, second_player_values) == first_player_values else other.best_combination
    
    # def __eq__(self, other):
    #     if self.is_equal_cat_rank(other):
    #         return self.is_equal_values(other)
    #     return False
        

    def compare_with_actual_hand(self,new_cat: int, new_rank: int, combination):
        if new_cat > self.cat:
            self.best_combination = combination
            return new_cat, new_rank
        if new_cat == self.cat and new_rank > self.rank:
            self.best_combination = combination
            return new_cat, new_rank
        return self.cat, self.rank


straight_flush1 = Hand([Card('5◆'), Card('9♣')],[Card('4❤'),Card('7♣'),Card('3◆'),Card('5♣'),Card('J♠')])

straight_flush2 = Hand([Card('5◆'), Card('9♣')],[Card('3❤'),Card('7♣'),Card('3◆'),Card('5♣'),Card('J♠')])
straight_flush1.best_hand()
straight_flush2.best_hand()
print(straight_flush1 == straight_flush2)