from __future__ import annotations

def read_file(path: str) -> list:
    with open(path) as f: 
        for line in f: 
            operation = line.


class VendingMachine:
    def __init__(self, money: int=0):
        self.money = money
        self.products = 