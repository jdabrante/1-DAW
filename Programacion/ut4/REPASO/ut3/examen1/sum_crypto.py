# ******************
# SUMA CRIPTOGRÁFICA
# ******************
from pathlib import Path


def run(crypto_path: Path) -> float:
    code = {"sd":"-","vo":".","ax":"0","gh":"1","hj":"2","uv":"3","ws":"4","pk":"5","et":"6","mc":"7","rh":"8","wb":"9"}
    code_list = []
    with open(crypto_path) as f: 
        for line in f:
            clean_line = line.strip()
            code_list.append(clean_line)
    sum_cr = 0
    for _code in code_list:
        code_number = ""
        for i in range(len(_code)-1): 
            if i%2 == 0 and _code[i:i+2] in code:
                code_number += code[_code[i:i+2]]
        if code_number:
            number = float(code_number)
            sum_cr += number
    return sum_cr


if __name__ == '__main__':
    run('data/sum_crypto/data1.crypto')