import re

with open("text.dat") as f:
    text = f.read()

regex = r"\bhttps?://\S*[^ ,\s]"
matches = re.findall(regex, text, re.I)
print(matches)
