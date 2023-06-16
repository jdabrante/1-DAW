# *************
# SUMANDO FILAS
# *************
from pathlib import Path


def run(data_path: Path) -> tuple:
    rsum = []
    with open(data_path) as f:
        for line in f: 
            clean_line = line.strip().split()
            _sum = sum([int(number) for number in clean_line])
            rsum.append(_sum)
    return tuple(rsum)


if __name__ == '__main__':
    run('data/sum_rows/data1.txt')