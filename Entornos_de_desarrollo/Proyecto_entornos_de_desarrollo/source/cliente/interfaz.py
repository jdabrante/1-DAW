import filecmp
from pathlib import Path
from datetime import datetime


db_path = "/home/dimas/GitHub/proyecto_ets/source/cliente/data/odds.dat"


class Round:
    def __init__(self, hand: str):
        self.hand = hand
        self.outcome = "unknown"

    def update_outcome(self, outcome: str):
        self.outcome = outcome

    def generate_number(self, current_game):
        self.number = current_game.next_available_round_id

    def __str__(self):
        return f"Ronda nº: {self.number}\nMano: {self.hand}\nResultado: {self.outcome}"


class Game:
    def __init__(self, name: str):
        self.start_datetime = datetime.now()
        self.name = name
        self.rounds = []
        self.next_available_round_id = 0
        self.hands_odds = self.init_hands_odds()

    def init_hands_odds(self):
        hands_odds = {}
        with open(db_path) as f:
            for line in f:
                clean_line = line.strip().split(":")
                user_hand, rival_hand, odds = clean_line
                if user_hand in hands_odds:
                    hands_odds[user_hand][rival_hand] = odds
                else:
                    hands_odds[user_hand] = {rival_hand: odds}
        return hands_odds

    def calc_duration(self):
        self.duration = datetime.now() - self.start_datetime

    def add_round(self, round):
        round.generate_number(self)
        self.rounds.append(round)
        self.next_available_round_id += 1


class Map:
    def __init__(self, round, game):
        self.odds = self.get_odds(round, game)

    def get_odds(self, round, game):
        return game.hands_odds[round.hand]

    def __str__(self):
        return f"{self.odds}"


my_game = Game("My game")
current_round = Round("AHAS")
my_game.add_round(current_round)
loaded_map = Map(current_round, my_game)
print(loaded_map)
