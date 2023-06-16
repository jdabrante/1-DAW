# **************************
# AQU� TIENE SU VUELTA (MAX)
# **************************


def run(to_give_back: float, available_currencies: dict) -> dict:
    money_back = {}
    available_currencies = dict(sorted([(key,value) for key,value in available_currencies.items()],reverse=True))
    for money,qty in available_currencies.items():
        if to_give_back > 0:
            teorical_change = to_give_back//money
            real_change = min(qty,teorical_change)
            money_back[money] = real_change
            to_give_back -= money * real_change
    if to_give_back != 0:
        return None
    return money_back


if __name__ == '__main__':
    run(20, {5: 3, 2: 7, 1: 3})