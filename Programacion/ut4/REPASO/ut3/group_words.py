# ******************
# AGRUPANDO PALABRAS
# ******************


def run(words: list) -> dict:
    group_words = {}
    for word in words: 
        if word[0] not in group_words:
            group_words[word[0]] = [word]
        else: 
            group_words[word[0]].append(word)
    return group_words


if __name__ == '__main__':
    run(['mesa', 'm�vil', 'barco', 'coche', 'avi�n', 'bandeja', 'casa', 'monitor', 'carretera', 'arco'])