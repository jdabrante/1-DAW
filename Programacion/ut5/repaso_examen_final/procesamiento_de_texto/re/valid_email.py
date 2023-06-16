import re

def valid_email(email: str) -> bool:
    regex = r'^\w+@(gmail|yahoo|outlook|hootmail)\.(org|es|com)$'
    return True if re.match(regex, email) else False

print(valid_email('juandimasabrantehernandez@gmail.com'))