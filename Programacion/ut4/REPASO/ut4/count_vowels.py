# *******************************
# CONTANDO VOCALES (EN RECURSIVO)
# *******************************
VOWELS = "aeiou"

def count_vowels(text: str, vowels: str=VOWELS):
    _sum = 0
    for char in text: 
        if char in vowels:
            _sum += 1
    return _sum
