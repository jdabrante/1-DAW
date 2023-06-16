# *******************
# CREANDO OPERACIONES
# *******************

def make_oper(oper):
    def operation(num1: int, num2: int):
        match oper: 
            case 'add':
                return num1 + num2
            case 'sub':
                return num1 - num2
            case 'mul':
                return num1 * num2
            case 'div':
                return num1 / num2
            case _:
                return False
    return operation


def run(oper, num1, num2):
    operation = make_oper(oper)
    result = operation(num1, num2)
    return result
    


