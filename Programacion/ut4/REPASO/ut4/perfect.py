# *****************
# N�MEROS PERFECTOS
# *****************

def prop_div (n: int)-> list:
    _sum = []
    for i in range(1,n):
        if n%i == 0:
            _sum.append(i)
    return _sum

def is_perfect(n: int):
    if sum(prop_div(n)) == n:
        return True
    else: 
        return False

