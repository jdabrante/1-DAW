import re

def eval_str_op(oper: str):
    try:
        regex = '^\s*(\d+_?)+\s*(\+|-|\*|/)\s*(\d+_?)\s*$'
        num1, oper, num2 = re.match(regex, oper).groups()
    except AttributeError:
         return 'No coincide la expresión regular'
    num1 = int(num1)
    num2 = int(num2)
    match oper: 
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
        

print(eval_str_op('2            efefef     * 2'))
        


    
    
