import helpers


class Card:
    SPADES = "♠"
    HEARTS = "❤"
    DIAMONDS = "◆"
    CLUBS = "♣"
    SYMBOLS = ("A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K")

    def __init__(self, suit_value: str):
        self.suit_value = suit_value
        self.suit = self.suit_value[-1]
        self.value_symbol = self.suit_value[:-1]

    @property
    def value(self) -> int:
        rank = Card.SYMBOLS.index(self.value_symbol) + 1
        return 14 if rank == 1 else rank

    @property
    def __repr__(self) -> str:
        return self.suit_value

    def __gt__(self, other) -> bool:
        return self.value > other.value

    def __lt_(self, other) -> bool:
        return self.value < other.value

    def __eq__(self, other) -> bool:
        if isinstance(other, Card):
            return self.value == other.value
        return self.value == Card.SYMBOLS.index(other[:-1]) + 1


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
        self.combination = sorted(combination)
        self.cat = self.get_cat()
        self.cat_rank = self.get_cat_rank()

    def is_straight_flush(
        self, values: list[int], len_set_values: int, len_set_suits: int
    ) -> bool:
        return (
            len_set_suits == 1 and len_set_values == 5 and values[-1] - values[0] == 4
        )

    def is_four_of_a_kind(self, values: list[int], len_set_values: int) -> bool:
        return len_set_values == 2 and values[0] == values[3]

    def is_full_house(self, values: list[int], len_set_values: int) -> bool:
        return len_set_values == 2 and values[0] != values[3]

    def is_flush(slef, len_set_suits: int) -> bool:
        return len_set_suits == 1

    def is_straight(self, values: list[int], len_set_values: int) -> bool:
        return len_set_values == 5 and values[-1] - values[0] == 4

    def is_three_of_a_kind(self, values: list[int], len_set_values: int) -> bool:
        return len_set_values == 3 and values[0] == values[2]

    def is_two_pair(self, values: list[int], len_set_values: int) -> bool:
        return len_set_values == 3 and values[1] != values[2]

    def is_one_pair(self, len_set_values: int) -> bool:
        return len_set_values == 4

    def get_cat(self) -> int:
        values = sorted(
            [card.value for card in self.combination],
            key=lambda x: (-values.count(x), x),
        )
        suits = [card.suit for card in self.combination]
        len_set_values = len(set(values))
        len_set_suits = len(set(suits))
        if self.is_straight_flush(values, len_set_values, len_set_suits):
            return Hand.STRAIGHT_FLUSH
        if self.is_four_of_a_kind(values, len_set_values):
            return Hand.FOUR_OF_A_KIND
        if self.is_full_house(values, len_set_values):
            return Hand.FULL_HOUSE
        if self.is_flush(len_set_suits):
            return Hand.FLUSH
        if self.is_straight(values, len_set_values):
            return Hand.STRAIGHT
        if self.is_three_of_a_kind(values, len_set_values):
            return Hand.THREE_OF_A_KIND
        if self.is_two_pair(values, len_set_values):
            return Hand.TWO_PAIR
        if self.is_one_pair(len_set_values):
            return Hand.ONE_PAIR
        return Hand.HIGH_CARD

    def get_cat_rank(self):
        if self.cat == Hand.FOUR_OF_A_KIND:
            for card in self.combination:
                if self.combination.count(card) == 4:
                    return card.value_symbol
        if self.cat == Hand.THREE_OF_A_KIND:
            pass
