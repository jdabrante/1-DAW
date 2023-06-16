# *************************
# MOVIMIENTOS DE INVENTARIO
# *************************


def run(imoves: str) -> dict:
    inventory = {}
    imoves = imoves.strip().split(",")
    for move in imoves: 
        if move[0] not in inventory:
            inventory[move[0]] = int(move[1:])
        else: 
            inventory[move[0]] += int(move[1:])
    return inventory


if __name__ == '__main__':
    run('A1,B4,A-2,A7,B1,C4')