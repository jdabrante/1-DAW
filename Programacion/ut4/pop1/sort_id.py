# **********************************
# ORDENANDO IDS EN UNA BASE DE DATOS
# **********************************


def sort_id(db: list) -> list:
    sorted_db = db.copy()
    for i, data in enumerate(sorted_db):
        data["id"] = i + 1
    return sorted_db
