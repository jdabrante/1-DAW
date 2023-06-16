# *********************************
# SEPARANDO MAY�SCULAS Y MIN�SCULAS
# *********************************


def split_case(words: list)-> list:
    lower_words = []
    upper_words = []
    for word in words: 
        if word.isupper():
            upper_words.append(word)
        elif word.islower():
            lower_words.append(word)
    return lower_words,upper_words



print(split_case(['AZUL', 'blanco', 'NEGRO', 'amarillo']))