# *****************
# SUMA DE COCIENTES
# *****************


def sum_quot(n: int) -> float:
    if n == 0:
        return 0
    _sum = 1 / n + sum_quot(n - 1)
    return _sum
