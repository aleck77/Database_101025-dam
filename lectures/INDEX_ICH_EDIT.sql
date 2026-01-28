USE 101025_DAM_OO
SHOW tables from 101025_DAM_OO
SELECT *
FROM product_overview
SHOW index from mytable;
SHOW index from ProductSales;

EXPLAIN SELECT * FROM Employees
WHERE Salary > 70000;

CREATE INDEX idx_salary ON Employees (salary);

/*Создайте таблицу students с такими столбцами: id (INT),
 name (VARCHAR), age (INT), grade (DECIMAL).*/
CREATE TABLE students(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    age INT,
    grade DECIMAL(5, 2)
);

SELECT *FROM students;

DROP TABLE IF EXISTS students;

CREATE TABLE IF NOT EXISTS students(
	id INT PRIMARY KEY AUTO_INCREMENT, 
    name VARCHAR(50), 
    age INT, 
    grade DECIMAL(5, 2));
    
SELECT * FROM students;


INSERT INTO students (name, age, grade)
VALUES 
    ('Yadier Molina', 42, 93.0),
    ('Ichiro Suzuki', 51, 98.5),
    ('Albert Pujols', 45, 94.0),
    ('David Ortiz', 49, 94.2),
    ('Derek Jeter', 50, 97.3),
    ('Ken Griffey Jr.', 55, 98.8),
    ('Randy Johnson', 61, 96.7),
    ('Mariano Rivera', 55, 99.0),
    ('Alex Rodriguez', 49, 95.2),
    ('Barry Bonds', 60, 99.8);

/*
1. Создайте индекс на столбец age, чтобы ускорить поиск по возрасту.
2. Напишите запрос, который выбирает всех студентов определенного возраста.
3. Просмотрите план выполнения запроса с помощью команды EXPLAIN.
*/
CREATE INDEX idx_age ON students(age);

SHOW INDEX FROM students;

SELECT *FROM students
WHERE age = 42;

EXPLAIN SELECT *FROM students
WHERE age = 42;

EXPLAIN SELECT *FROM students
WHERE age > 50;

EXPLAIN SELECT *FROM students
WHERE grade < 80;

-- Создайте функцию для перевода текста в верхний регистр. 
-- Функция принимает строку и возвращает её в верхнем регистре.

DELIMITER //

CREATE FUNCTION to_upper_case (INPUT VARCHAR(100))
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
RETURN UPPER(INPUT);
END;

// DELIMITER;

SELECT to_upper_case(name)
FROM students;

SHOW CREATE FUNCTION to_upper_case;