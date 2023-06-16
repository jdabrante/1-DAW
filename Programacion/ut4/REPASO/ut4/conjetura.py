def collatz(value: int)->list:
    if value == 1:
        return [value]
    if value%2 == 0:
        return [value] + collatz(value//2)
    else: 
        return [value] + collatz((value*3)+1)
    

print(collatz(11))











# 6 -> [6,3,10,5,16,8,4,2,1]