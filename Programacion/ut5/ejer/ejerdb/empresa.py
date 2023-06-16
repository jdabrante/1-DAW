from __future__ import annotations

import sqlite3

DB_PATH = 'empresa.db'

class Employee:
    con = sqlite3.connect(DB_PATH)
    con.row_factory = sqlite3.Row
    cur = con.cursor()

    def __init__(self,dni: str, first_name: str, last_name: str, age: int, workplace: str, raw_salary: float | int):
        if not isinstance(dni,str):
            raise DNIError('Invalid format')
        self.dni = self.calculate_dni_letter(dni)
        self.first_name = first_name
        self.last_name = last_name
        self.age = age
        self.workplace = workplace
        self.raw_salary = raw_salary

    def calculate_dni_letter(self,dni):
        letters = 'TRWAGMYFPDXBNJZSQVHLCKE'
        if isinstance(dni, str) and len(dni) == 9:
            return dni
        dni_letter = letters[int(dni) % 23]
        return f'{dni}{dni_letter}'
    
    @property
    def net_salary(self):
        return self.raw_salary - self.raw_salary * 0.12
    
    def save(self):
        sql = 'INSERT INTO employees VALUES(?,?,?,?,?,?,?)'
        self.cur.execute(sql,(self.dni,self.first_name,self.last_name,self.age,self.workplace,self.raw_salary,self.net_salary))
        self.con.commit()

    def update(self):
        sql = f'''UPDATE employees SET first_name = "{self.first_name}",last_name = "{self.last_name}",age = {self.age},workplace = "{self.workplace}",raw_salary = {self.raw_salary}, net_salary = {self.net_salary}
        WHERE dni = "{self.dni}"'''
        self.cur.execute(sql)
        self.con.commit()

    def __repr__(self):
        return f'El empleado {self.first_name} {self.last_name} con DNI {self.dni} que trabaja de {self.workplace} cobra {self.net_salary}'

    @classmethod
    def from_db_row(cls, row: sqlite3.Row) -> Employee:
        dni = row['dni']
        first_name = row['first_name']
        last_name = row['last_name']
        age = row['age']
        workplace = row['workplace']
        raw_salary = row['raw_salary']
        net_salary = row['net_salary']
        employee = Employee(dni,first_name,last_name,age,workplace,raw_salary,net_salary)
        return employee

    @classmethod
    def get(cls, employee_dni: str) -> Employee:
        data = cls.cur.execute(f'SELECT dni,first_name,last_name,age,workplace,raw_salary FROM employees WHERE dni = "{employee_dni}"').fetchone()
        dni,first_name, last_name, age, workplace, raw_salary = data
        return Employee(dni,first_name,last_name,age,workplace,raw_salary)
        


class DNIError(Exception):
    def __init__(self, message: str = ''):
        default = 'Invalid DNI'
        if message:
            self.message = f'{default}: {message}'
        else: 
            self.message = default
        super().__init__(self.message)


class Company:
    con = sqlite3.connect(DB_PATH)
    con.row_factory = sqlite3.Row
    cur = con.cursor()


    def create_db(self):
        sql = '''
        CREATE TABLE employees (
            dni TEXT PRIMARY KEY,
            first_name TEXT,
            last_name TEXT,
            age INT,
            workplace TEXT,
            raw_salary REAL,
            net_salary REAL
        );
'''
        self.cur.execute(sql)
        self.con.commit()


person2 = Employee.get('43485758B')
print(person2)
