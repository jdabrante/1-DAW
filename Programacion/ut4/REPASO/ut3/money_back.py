# ********************
# AQU� TIENE SU VUELTA
# ********************


def run(to_give_back: float, available_currencies: list) -> dict:
    money_back = {}
    available_currencies = sorted(available_currencies, reverse=True)
    for money in available_currencies:
        if to_give_back > 0:
            money_back[money] = to_give_back//money
            to_give_back -= money * money_back[money]
    if to_give_back > 0:
        return None
    return money_back

if __name__ == '__main__':
    run(7, [2, 1, 0.5])