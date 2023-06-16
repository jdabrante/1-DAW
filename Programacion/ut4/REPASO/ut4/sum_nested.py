# ***********************
# SUMANDO CON ANIDAMIENTO
# ***********************


def sum_nested(items: list, _sum: int = 0):
    if len(items) == 0:
        _sum += 0
        return _sum
    if isinstance(items[0],list):
        _sum += sum_nested(items[0],_sum)
        return sum_nested(items[1:],_sum)
    else: 
        _sum += items[0]
        return sum_nested(items[1:],_sum)

print(sum_nested([1, [2, 4], 5, [6, [7, 8]]]))