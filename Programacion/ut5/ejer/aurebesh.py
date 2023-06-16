aurebesh_alphabet = {
    "aurek": "a",
    "besh": "b",
    "cresh": "c",
    "dorn": "d",
    "esk": "e",
    "forn": "f",
    "grek": "g",
    "herf": "h",
    "isk": "i",
    "jenth": "j",
    "krill": "k",
    "leth": "l",
    "merm": "m",
    "nern": "n",
    "osk": "o",
    "peth": "p",
    "qek": "q",
    "resh": "r",
    "senth": "s",
    "trill": "t", 
    "usk": "u",
    "vev": "v",
    "wesk": "w",
    "xesh": "x",
    "yirt": "y",
    "zerek": "z",
    "cherek": "ch",
    "enth": "ae",
    "onith": "eo",
    "krenth": "kh",
    "nen": "ng",
    "orenth": "oo",
    "shen": "sh",
    "thesh": "th",
}

PATH = r'C:\Users\19jda\Desktop\GitHub\PRO\UT5\ejer\texto.txt'

with open(PATH) as f: 
    for line in f: 
        clean_line = line.strip().split()
        print(clean_line)

        
