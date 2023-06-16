# ********************
# DESCUBRIENDO IMPARES
# ********************
def run(values: list) -> list:
    values = sorted(list(set(values)))
    if len(values) == 0:
        return values
    if values[0]%2 != 0:
        return [values[0]] + run(values[1:])
    else: 
        return run(values[1:])


if __name__ == '__main__':
    run([1, 2, 3, 4, 5])