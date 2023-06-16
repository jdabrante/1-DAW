# ******************
# POTENCIA RECURSIVA
# ******************


def power(x: int, n: int):
    if n == 0: 
        return 1
    result = x*power(x,n-1)
    return result
    
print(power(3,4))

