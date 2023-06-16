import re

# Escriba un programa en Python que encuentre todas las
# palabras que comiencen por vocal en un texto dado.

with open("text.dat") as f:
    text = f.read()

regex = r"\b[aeiou]\S*\b"
matches = re.findall(regex, text, re.I)
print(matches)
