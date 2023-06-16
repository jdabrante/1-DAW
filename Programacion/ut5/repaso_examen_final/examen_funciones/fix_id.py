# ***********************************
# ARREGLANDO IDS EN UNA BASE DE DATOS
# ***********************************


def fix_id(db: list)-> list:
    fixed_db = db.copy()
    for i, matter in enumerate(fixed_db):
        matter['id'] = i + 1
    return fixed_db
        
    

