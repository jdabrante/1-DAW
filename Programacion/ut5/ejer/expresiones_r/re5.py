import re
# Escriba un programa en Python que obtenga el resultado de una operación entre números enteros positivos.
# Las operación puede ser suma, resta, multiplicación o
# división, y puede haber espacios (o no) entre los operandos y el operador: eval_str_op.py

def resolve_operation(operation):
    regexp  = r'(?P<num1>\d+) *(?P<symbol>\+|-|\*|/){1} *(?P<num2>\d+)'
    m = re.search(regexp, operation)
    num1 = int(m['num1'])
    symbol = m['symbol']
    num2 = int(m['num2'])

    match symbol:
        case '+':
            return num1 + num2
        case '-': 
            return num1 - num2
        case '*':
            return num1 * num2
        case '/':
            return num1 / num2
        case _: 
            return False
        

print(resolve_operation('2 /                                    5'))

