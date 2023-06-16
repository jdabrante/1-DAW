# **************************************************
# IDENTIFICANDO SECUENCIAS CONSECUTIVAS DE UN TAMA�O
# **************************************************


def consecutive_seq(items: list, tager_count: int, count: int = 1):
    if count == tager_count:
        return items[0]
    if len(items) == 1:
        return 0
    if items[0] == items[1]:
        count += 1 
        return consecutive_seq(items[1:],tager_count,count)
    else: 
        count = 1
        return consecutive_seq(items[1:],tager_count,count)


print(consecutive_seq([1, 74, 56, 56, 56, 332, 8, 8, 8],3))