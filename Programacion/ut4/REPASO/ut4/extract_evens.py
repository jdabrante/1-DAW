# *******************
# EXTRACCI�N DE PARES
# *******************


def run(values: list)-> list:
    if len(values) == 0:
        return values
    if values[0]%2 == 0:
        return [values[0]] + run(values[1:])
    else: 
        return run(values[1:])
    

