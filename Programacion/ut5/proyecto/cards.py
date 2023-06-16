import helpers


class Card:
    CARDS = {
        "♣": "🃑🃒🃓🃔🃕🃖🃗🃘🃙🃚🃛🃝🃞",
        "◆": "🃁🃂🃃🃄🃅🃆🃇🃈🃉🃊🃋🃍🃎",
        "❤": "🂱🂲🂳🂴🂵🂶🂷🂸🂹🂺🂻🂽🂾",
        "♠": "🂡🂢🂣🂤🂥🂦🂧🂨🂩🂪🂫🂭🂮",
    }
    CLUBS = "♣"
    DIAMONDS = "◆"
    HEARTS = "❤"
    SPADES = "♠"
    SYMBOLS = ("A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K")

    def __init__(self, suit: str, value: int):
        self.suit = suit
        if isinstance(value, str):
            self.value = Card.SYMBOLS.index(value) + 1
        else:
            self.value = value

    @property
    def cmp_value(self) -> int:
        return 14 if self.value == 1 else self.value

    def __repr__(self):
        return Card.CARDS[self.suit][self.value - 1]

    def __lt__(self, other):
        return self.cmp_value < other.cmp_value

    def __gt__(self, other):
        return self.cmp_value > other.cmp_value

    def __eq__(self, other):
        return  self.cmp == other.cmp


class Deck:
    def __init__(self):
        self.cards = self.generate_deck()

    def generate_deck(self):
        return [
            Card(suit, i + 1)
            for suit, cards in Card.CARDS.items()
            for i in range(len(cards))
        ]

    def give_random_card(self):
        return self.cards.pop(helpers.randint(len(self.cards) - 1))

    def give_top_card(self):
        return self.cards.pop(0)

    def give_bottom_card(self):
        return self.cards.pop(-1)

    def shuflle(self):
        helpers.shuffle(self.cards)

    def view_random_card(self):
        return self.cards[helpers.randint(len(self.cards) - 1)]

    def view_top_card(self):
        return self.cards[0]

    def view_bottom_card(self):
        return self.cards[-1]

    def __len__(self):
        return len(self.cards)
    
class Hands:
    def __init__(self, cards, common_cards):
        self.all_cards = cards + common_cards
        self.all_combinations = list(helpers.combinations(self.all_cards, n=5))






