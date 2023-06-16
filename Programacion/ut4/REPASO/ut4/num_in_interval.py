# *******************
# N�MERO EN INTERVALO
# *******************


def in_range(value: int, lower_limit: int, upper_limit: int, /)-> bool:
    num_range = list(range(lower_limit,upper_limit+1))
    if value in num_range:
        return True
    return False
    # TU C�DIGO AQU�

