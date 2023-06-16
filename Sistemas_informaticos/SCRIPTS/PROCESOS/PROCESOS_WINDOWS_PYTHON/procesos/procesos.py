import re

memo_capacity = 0

with open("memo.txt") as f: 
    for line in f: 
        line = line.replace("\x00", "").strip()
        if line.isnumeric():    
            memo_capacity += int(line)/1048576

with open("procesos.txt") as f:
    datas = {}
    for data in f: 
        data = re.split("\s{2,}",data.strip())
        process = data[0]
        values = data[-1].split()
        if len(values) > 0:
            if len(values) > 2: 
                value = values[1].replace(".","_")
            else: 
                value = values[0].replace(".","_")
            if process not in datas: 
                datas[process] = int(value)/1024
            else: 
                datas[process] += int(value)/1024


green = memo_capacity * 0.03
orange = memo_capacity * 0.065
red = memo_capacity

total = 0

print('''<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <title>Procesos del sistema</title>
</head>
<body>
<table style="border: solid 1px black">
<tr>
    <th>Proceso</th>
    <th>Uso</th>
</tr>
''')

for process, memo in datas.items():
    total += memo
    if memo <= green: 
        print(f'<tr><td>{process}</td><td>&#128994; {memo:.4f}</td>')
    elif memo > green and memo <= orange:
        print(f'<tr><td> {process}</td><td> &#128992; {memo:.4f}</td>')
    elif memo > orange and memo <= red: 
        print(f'<tr><td><b>{process}</b></td><td> &#128308; {memo:.4f}</td>')

print('</table>')
print(f'<p> En total se estan consumiendo {total:.2f} MB de {memo_capacity} MB en procesos </p>')
print(f'<p> % Uso : {total * (100/memo_capacity):.2f}')

print ('''
</body>
</html>
''')



