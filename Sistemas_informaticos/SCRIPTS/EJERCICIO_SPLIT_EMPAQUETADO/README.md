Programa = MySQL
Tamaño inicial original = 520.9 M
Tamaño descomprimido = 1,1 G

# gzip 

time tar czvf mysql.tar.gz mysql-8.0.32-linux-glibc2.12-i686

TC = 37,403 s
Tamaño C = 611 M

time tar xzvf mysql.tar.gz

TD = 10,936 s

# xz

time tar -Jcvf mysql.tar.xz mysql

TC =  5min 56,993s
Tamaño C = 565M

tar -Jxvf mysql-8.0.32-linux-glibc2.12-i686.tar.xz 

TD = 21,497s

# bz2

time tar -c mysqld | bzip2 > mysql.tar.bz2

TC = 1min 45,824 s
Tamaño C = 597M

time tar jvxf mysql.tar.bz2 

TD = 46,585 s

# lha

time lha -a mysql.lha mysqld

TC = 1min 12,105 s
Tamaño C = 639M

time lha -x mysql.lha 

TD = 17,613 s

# zip

time zip mysqld.tar.zip mysqld.tar

TC = 35,535 s
Tamaño C = 611M

time unzip mysqld.tar.zip

TD = 18,458 s

# rar

time rar -r a mysql.rar mysql

TC = 58,879s
Tamaño C = 565M

time rar x mysql.rar

TD = 1min 17,508s

