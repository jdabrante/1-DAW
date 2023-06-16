# *****************
# ALFABETO CIRCULAR
# *****************

ALPHABET = "abcdefghijklmnopqrstuvwxyz"

def g_fun (max_letters: int, alphabet: str= ALPHABET):
    while True:
        for i in range(max_letters):
            yield alphabet[i%len(ALPHABET)]
        break


def run(max_letters: int) -> str:
    text = ""
    for char in g_fun(max_letters):
        text += char
    return text


if __name__ == '__main__':
    run(0)