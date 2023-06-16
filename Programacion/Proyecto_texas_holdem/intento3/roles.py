import cards
import helpers

# SPADES = '♠'
# HEARTS = '❤'
# DIAMONDS = '◆'
# CLUBS = '♣'
# SYMBOLS = ('A','2','3','4','5','6','7','8','9','10','J','Q','K')

class Player:
    def __init__(self, name: str, private_cards: list[cards.Card] = [], common_cards: list[cards.Card] = []):
        self.name = name
        self.private_cards = private_cards
        self.common_cards = common_cards

    @property
    def hands(self):
        combinations = list(helpers.combinations((self.private_cards + self.common_cards), n=5)) 
        combinations.append(tuple(self.common_cards))
        print(combinations)
        return [cards.Hand(combination) for combination in combinations]
    
    @property
    def best_hand(self):
        best_hand = self.hands[0]
        for hand in self.hands:
            if hand > best_hand:
                best_hand = hand
        return best_hand

    def __repr__(self): 
        return self.name

# player1 = Player('Dimas',[cards.Card('A♣'), cards.Card('2♣')], [cards.Card('A♠'), cards.Card('7♣'), cards.Card('4◆'), cards.Card('2❤'), cards.Card('3❤')])
# print(player1.name)
# print(player1.private_cards)
# print(player1.common_cards)
# print(player1.choose_best_hand())