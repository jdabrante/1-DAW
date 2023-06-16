import helpers
import cards

class Dealer:
    def __init__(self, deck: list):
        self.deck = deck 
        
    def give_cards(self, amount: int = 0):
        if amount:
            cards = []
            for _ in range(1, amount + 1):
                cards.append(self.deck.give_random_card())
            return cards
        return self.deck.give_random_card()
            
    
class Player: 
    def __init__(self, player_id: int):
        self.id =  player_id
        self.cards = []
        self.common_cards = []
        self.best_hand = []
        
    @property
    def possible_hands(self):
        return cards.Hands(self.cards, self.common_cards).all_combinations
        
    def __repr__(self):
        return f'player: {self.id}'
    
    def recive_cards(self, card):
        self.cards.append(card)
    
    def recive_common_cards(self, cards: list):
        self.common_cards = cards
        
    def sort_cards(self):
        categories = {'royal_flush': [], 'straight_flush': [], 'four_of_a_kind': [], 
                      'full_house': [], 'flush': [], 'straight': [], 'three_of_a_kind': [],
                      'two_pair': [], 'pair': [], 'high_card': []}
        for combination in self.possible_hands:
            sort_combination = sorted(combination, key=lambda c: c.cmp_value)
            yield sort_combination
            
    def equal_suit(self, cards: list):
        count = 0
        first_suit = cards[0].suit
        for card in cards: 
            if card.suit == first_suit:
                count += 1
        return count
    
    def consecutive(self, cards: list):
        count = 0
        first_card = cards[0].cmp_value
        for card in cards[1:]:
            if card.cmp_value == first_card.cmp_value + 1:
                count += 1
        return count
    
    def equal_value(self, cards: list):
        count = 0
        first_card = cards[0].cmp_value
        for card in cards:
            if card.cmp_value == first_card:
                count += 1
        return count
    
    
            
    




        

