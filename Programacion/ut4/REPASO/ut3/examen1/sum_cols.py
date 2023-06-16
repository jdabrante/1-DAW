# ****************
# SUMANDO COLUMNAS
# ****************
from pathlib import Path


def run(data_path: Path) -> tuple:
    csum = []
    columns = []
    with open(data_path) as f:
        for line in f: 
            clean_line = line.strip().split()
            columns.append(clean_line)
    for i in range(len(columns)-1):
        _sum = 0
        for value in columns:
            _sum += int(value[i])
        csum.append(_sum)
    return tuple(csum)


if __name__ == '__main__':
    run('data/sum_cols/data1.txt')