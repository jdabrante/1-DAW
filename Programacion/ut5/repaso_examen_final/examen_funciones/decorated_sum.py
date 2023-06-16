# ****************************
# DECORANDO LA SUMA DE VALORES
# ****************************

def result_as_status(func):
    def wrapper(values: list):
        status, result = func(values)
        return {'status': status, 'result': result}
    return wrapper


@result_as_status
def run(values: list) -> tuple:
    for value in values: 
        if not isinstance(value, int):
            return False, 'Not int value found'
    return True, sum(values)
    
    

