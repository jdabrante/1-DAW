import re

def check_valid_url(url: str) -> bool:
    regex = r'^https?://(\w+\.)+(org|es){1}(/\w+)+[A-Za-z\-]*/?$'
    return True if re.match(regex, url) else False


print(check_valid_url('https://www.freecodecamp.org/new/check-if-a-javascript-string-is-a-url/'))