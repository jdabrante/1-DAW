# *****************
# SUMA DE COCIENTES
# *****************


def sum_quot(n):
    return 1 if n == 1 else (1/n + sum_quot(n - 1))


