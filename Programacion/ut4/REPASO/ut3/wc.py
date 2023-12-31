# ****************
# CONTANDO COMO WC
# ****************
from pathlib import Path


def run(input_path: Path) -> tuple:
    num_lines = 0
    num_words = 0
    num_bytes = 0
    with open(input_path) as f: 
        for line in f: 
            num_lines += 1
            num_bytes += len(line.strip().encode('utf-8'))
            clean_line = line.split()
            for word in clean_line:
                num_words += 1
                num_bytes += len(word.encode('utf-8'))
    return num_lines, num_words, num_bytes


if __name__ == '__main__':
    run('data/wc/emojis.txt')