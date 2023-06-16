# **********
# PAL�NDROMO
# **********


def is_palindrome(text: str)-> bool:
    clean_text1 = text.replace(" ","").lower()
    clean_text2 = clean_text1[::-1]
    if clean_text1 == clean_text2: 
        return True
    return False
