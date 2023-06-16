import re

# Escriba un programa en Python que determine si un email dado tiene el formato correcto: valid_email.py
regex = r"\w+@[a-z]*\.[a-z]*"
email = "dimas@gmail.com,juan@yahoo.com,32323@gmail.com, Paco, Luis@, @.,      KEvin@@yahoo.es"
find_match = re.findall(regex, email, re.I)
print(find_match)
