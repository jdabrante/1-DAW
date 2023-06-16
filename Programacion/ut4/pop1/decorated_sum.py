# ****************************
# DECORANDO LA SUMA DE VALORES
# ****************************
def data2dict(func):
    def wrapper(*args, **kwargs):
        func_result = func(*args, **kwargs)
        status, result = func_result
        return {"status": status, "result": result}

    return wrapper


@data2dict
def run(values: list, result: int = 0) -> dict:
    for value in values:
        if isinstance(value, int):
            status = True
            result += value
        else:
            status = False
            result = "Not int value found"
            break
    return status, result

