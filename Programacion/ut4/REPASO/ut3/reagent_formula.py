# ************
# ELLA QU�MICA
# ************
def not_mix (f1,f2,form):
    if (f1 in form and 2 not in form) or (f2 in form and f1 not in form) or (f2 not in form and f1 not in form):
        return True
    return False

def run(formula: list) -> bool:
    rule1 = not_mix(1,2,formula)
    rule2 = not_mix(3,4,formula)
    rule3 = True if (5 in formula and 6 in formula) or (5 not in formula and 6 not in formula) else False
    rule4 = True if 7 in formula or 8 in formula else False
    valid = True if all([rule1,rule2,rule3,rule4]) else False
    return valid


if __name__ == '__main__':
    run([1, 3, 7])