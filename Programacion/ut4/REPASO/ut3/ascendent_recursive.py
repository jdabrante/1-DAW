def ascend(x,y):
    if x == y:
        return [y*y]
    return [x*x] + ascend(x+1,y)

print(ascend(3,7))