# *********************
# PALABRAS CON LONGITUD
# *********************


def run(text: str) -> list:
    words = text.strip().split()
    words_length = [f'{word} {len(word)}' for word in words]
    return words_length


if __name__ == '__main__':
    run('todo se transforma')