import re

def valid_float(number: int|float|str) -> bool:
    regex = r'^(\d+_?)+\.(\d+_?)*[^_]$'
    return True if re.match(regex,str(number)) else False

print(valid_float('4.00'))

