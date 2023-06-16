# Escriba un programa en Python que indique si un determinado número es o no un flotante válido en Python.
import re

with open("text.dat") as f:
    text = f.read()

regex = r"\d+(_\d+)?\d*(.|e){1}\d*(_\d+)*[^ ,]*"
matches = []
while True:
    limit = 0
    find_match = re.search(regex, text, re.I)
    matches.append(find_match.group())
    limit = find_match.span()[1]
    text = text[limit:]
    if len(text) == 0:
        break


print(matches)
