# *************************
# PALABRAS EN ORDEN INVERSO
# *************************


def run(text: str) -> str:
    text = text.lower()
    reversing = " ".join(reversed(text.strip().split()))
    return reversing


if __name__ == '__main__':
    run('Hello World')