# *******************
# TEMPERATURAS MEDIAS
# *******************
import filecmp
from pathlib import Path


def run(input_path: Path) -> bool:
    output_path = 'data/avg_temps/avg_temps.dat'
    months_temps = []
    with open(input_path) as f:
        for line in f:
            clean_line = line.strip().split(",")
            clean_line = [int(value) for value in clean_line]
            months_temps.append(sum(clean_line)/len(clean_line))
            
        
    with open(output_path,"w") as f: 
        for month_temp in months_temps:
            f.write(f'{month_temp:.2f}\n')
    return filecmp.cmp(output_path, 'data/avg_temps/.expected', shallow=False)


if __name__ == '__main__':
    run('data/avg_temps/temperatures.dat')