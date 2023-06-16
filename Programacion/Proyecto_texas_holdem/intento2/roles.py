import cards
import helpers

class Player:
    def __init__(self, name: str, private_cards: list[cards.Card] = [], common_cards: list[cards.Card] = []):
        self.name = name
        self.private_cards = private_cards
        self.common_cards = common_cards

    
    @property
    def combinations(self):
        table_combination = cards.Hand(self.common_cards)
        combinations_dict = {tuple(table_combination.combination): {'cat': table_combination.cat, 'rank': table_combination.cat_rank} }
        for combination in set(helpers.combinations((self.private_cards + self.common_cards), n=5)):
            if combination not in combinations_dict:
                new_combination = cards.Hand(combination)
                combinations_dict[tuple(new_combination.combination)] = {'cat': new_combination.cat, 'rank': new_combination.cat_rank}
        
        return combinations_dict
    
    @property
    def best_cat(self):
        cat = max(data['cat'] for data in self.combinations.values())
        return cat
    
    @property
    def best_rank(self):
         rank = max(data['rank'] for data in self.combinations.values() if data['cat'] == self.best_cat)
         if isinstance(rank, tuple):
             return rank
         return int(rank)
    
    @property
    def best_hand(self):
        hands = []
        for hand, data in self.combinations.items():
            rank = data['rank'] if isinstance(data['rank'], tuple) else int(data['rank'])
            if data['cat'] == self.best_cat and rank == self.best_rank:
                hands.append(hand)
        if len(hands) > 1:
            best_hand = 0
            for i, hand in enumerate(hands):
                if sorted(card.value for card in hand) > sorted(card.value for card in hands[best_hand]):
                    best_hand = i
            return cards.Hand(hands[best_hand])
        print(hands)
        return cards.Hand(hands[0])
    
    def __repr__(self) -> str:
        return self.name
                 







