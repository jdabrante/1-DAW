# **************************
# BARICENTRO DE UN TRI�NGULO
# **************************

def run(A: list, B: list, C: list) -> tuple:
    big_list = [A,B,C]
    x0 = round((big_list[0][0] + big_list[1][0] + big_list[2][0])/3,4)
    y0 = round((big_list[0][1] + big_list[1][1] + big_list[2][1])/3,4)
    return x0, y0
if __name__ == '__main__':
    run([4, 6], [12, 4], [10, 10])