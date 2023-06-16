import sqlite3

DB_PATH = 'school.db'

def create_db():
    con = sqlite3.connect(DB_PATH)
    cur  = con.cursor()
    sql = '''
    CREATE TABLE students (
        id INTEGER PRIMARY KEY,
        name TEXT,
        age INTEGER
    );
    '''
    cur.execute(sql)
    con.commit()
    con.close()


class Student: 
    def __init__(self, name: str, age: int, student_id: int = 0):
        self.con = sqlite3.connect(DB_PATH)
        self.cur = self.con.cursor()
        self.name = name
        self.age = age
        self.id = student_id
    
    @staticmethod
    def same_name(method):
        def wrapper(self):
            sql = f'SELECT * FROM students WHERE name = "{self.name}"'
            if self.cur.execute(sql).fetchone() is None:
                return method(self)
            return False
        return wrapper
    
    @same_name
    def register(self):
        sql = 'INSERT INTO students(name, age) VALUES(?,?)'
        self.cur.execute(sql,(self.name, self.age))
        self.con.commit()
        self.id = self.cur.lastrowid
        
    def __repr__(self):
        return f'{self.name} {self.age}'

class School:
    def __init__(self):
        self.con = sqlite3.connect(DB_PATH)
        self.con.row_factory = sqlite3.Row
        self.cur = self.con.cursor()
    
    def search_by_age(self, age: int):
        sql = 'SELECT * FROM students WHERE age = ?'
        rows = self.cur.execute(sql,[age])
        for row in rows:
            name =  row["name"]
            age = row["age"]
            yield Student(name, age)

    def delete_student(self, student_id):
        sql = 'DELETE FROM students WHERE id = ?'
        self.cur.execute(sql,[student_id])
        self.con.commit()
        
        


school1 = School()

new_student = Student('dimas', 24)
print(new_student.register())
school1.delete_student(1)

