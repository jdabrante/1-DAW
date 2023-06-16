# ***********************
# PARTICI�N POR EL N�MERO
# ***********************


def run(values: list, ref_value: int) -> list:
    max_values = [value for value in values if value >= ref_value]
    min_values = [value for value in values if value < ref_value]
    return [min_values,max_values]


if __name__ == '__main__':
    run([4, 3, 2, 9, 8, 5], 4)