# *************************
# BUSCANDO PALABRAS COMUNES
# *************************
import filecmp
from pathlib import Path


def run(input_path: Path) -> bool:
    output_path = 'data/common_words/output.txt'
    setences = []
    coin_sentences = []
    with open(input_path) as f:
        for line in f:
            clean_line = line.lower().strip().split()
            setences.append(clean_line)
    for setence1 in setences:
        for setence2 in setences:
            coin_sentences.append(len(set(setence1) & set(setence2)))
            
    with open(output_path,"w") as f:
        for number in coin_sentences:
            f.write(f'{number}\n')
    return filecmp.cmp(output_path, 'data/common_words/.expected', shallow=False)


if __name__ == '__main__':
    run('data/common_words/minizen.txt')