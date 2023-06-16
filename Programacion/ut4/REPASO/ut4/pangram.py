# ********
# PANGRAMA
# ********

ABC = "abcdefghijklmnopqrstuvwxyz"

def is_pangram(text: str, abc: str = ABC):
    clean_text = text.replace(" ","").lower()
    if len(set(clean_text)) == len(abc):
        return True
    return False

