import helpers
import cards
import roles

class Game:
    def __init__(self):
        self.deck = cards.Deck()
        self.players = self.generate_players()
        self.dealer = roles.Dealer(self.deck)
        
    @staticmethod
    def generate_players(number_of_players: int = 2):
        return [roles.Player(i) for i in range(1,number_of_players + 1)]
    
    def dealing_cards_to_players(self, card_per_player: int = 2):
        number_of_players = len(self.players)
        number_of_cards_to_deal = card_per_player * number_of_players
        for i in range(1,number_of_cards_to_deal + 1):
            player = i % number_of_players
            self.players[player].recive_cards(self.dealer.give_cards())
    
    def dealing_common_cards(self, card_in_board: int=5):
        cards = self.dealer.give_cards(card_in_board)
        for player in self.players:
            player.recive_common_cards(cards)
            
    
    
    
    
game1 = Game()
print(game1.dealer)
print(game1.deck)
print(game1.players)
game1.dealing_common_cards()
game1.dealing_cards_to_players()
print(game1.players[0].cards, game1.players[0].common_cards)
print(game1.players[1].cards, game1.players[1].common_cards)
print(len(game1.deck))
print(game1.players[0].possible_hands)
for cards in game1.players[0].sort_cards():
    print(cards)
