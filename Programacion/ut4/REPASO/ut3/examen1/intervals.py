# ********************
# INTERVALO DESPLEGADO
# ********************


def run(interval: str) -> list:
    irange = ""
    clean_interval = interval.strip("[()]").split(",")
    if interval.startswith("[") and interval.endswith("]"):
        irange = list(range(int(clean_interval[0]),int(clean_interval[1])+1))
    if interval.startswith("(") and interval.endswith(")"):
        irange = list(range(int(clean_interval[0])+1,int(clean_interval[1])))
    if interval.startswith("(") and interval.endswith("]"):
        irange = list(range(int(clean_interval[0])+1,int(clean_interval[1])+1))
    if interval.startswith("[") and interval.endswith(")"):
        irange = list(range(int(clean_interval[0]),int(clean_interval[1])))
    return irange


if __name__ == '__main__':
    run('[3,10]')