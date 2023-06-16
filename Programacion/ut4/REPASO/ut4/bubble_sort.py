# **********************
# ORDENANDO CON BURBUJAS
# **********************


def bubble(items: list)-> list:
    messy = True
    while messy:
        messy = False
        for i in range(len(items)-1): 
            if items[i] > items[i+1]:
                items[i], items[i+1] = items[i+1], items[i]
                messy = True
    return items
    

