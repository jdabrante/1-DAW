import re

def find_start_with_vowels(text: str) -> str:
    regex = r'\b[aeiou]+[a-z]+\b'
    return ",".join(re.findall(regex, text, re.I))


result = find_start_with_vowels('Hola Alberto')
print(result)