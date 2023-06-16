import roles
import cards

def get_winner(players: list[roles.Player], common_cards: list[cards.Card], private_cards: list[list[cards.Card]]) -> tuple[roles.Player | None, cards.Hand]:
    
