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
DROP FUNCTION IF EXISTS -- hypotenuse

SELECT ROUTINE_NAME, ROUTINE_TYPE, ROUTINE_DEFINITION
FROM INFORMATION_SCHEMA.ROUTINES
WHERE ROUTINE_SCHEMA = DATABASE()
AND ROUTINE_TYPE = 'FUNCTION';

/*Функция для проверки, является ли число четным. 
Функция принимает целое число и возвращает 1,
если оно четное, и 0, если нечетное.*/

CREATE FUNCTION is_even (NUM INT)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    RETURN number % 2 = 0;
END;

--Практика

/*1. Перевод сантиметров в дюймы
Создайте функцию для перевода сантиметров в дюймы.
Используйте формулу:
1 сантиметр = 0. 393701 дюйма*/

CREATE FUNCTION cm_to_inches(cm DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN cm * 0.393701;
END;

-- 2. Расчет объема шара
-- Создайте функцию для расчета объема шара, если известен радиус.
-- Можно воспользоваться следующей формулой:
-- 𝑉 = 4/3 * π𝑟
-- 3
-- Где:
-- ● 𝑉— объем шара,
-- ● 𝑟 — радиус шара,
-- ● π≈3. 14159

CREATE FUNCTION sphere_volume(radius DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN (4 / 3) * PI() * POW(radius, 3);
END;

SELECT sphere_volume(2)

-- Перевод градусов в радианы
-- Создайте функцию для перевода градусов в радианы.
-- Для перевода градусов в радианы используется следующая формула:
-- радианы=градусы×π/180, где ​π≈3.14159

CREATE FUNCTION degrees_to_radians(grad DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN grad * PI() / 180;
END;

SELECT degrees_to_radians(45);

CREATE FUNCTION work_exp(HireDate DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN TIMESTAMPDIFF(MONTH, HireDate, CURDATE());
END;

SELECT *, work_exp(HireDate)
FROM Employees;

-- update Employees
-- set HireDate;

ALTER TABLE Employees 
ADD COLUMN Age INT;

UPDATE Employees
SET Age = round(rand()*70+1,0); -- ИСПОЛЬЗОВАНИЕ СЛУЧАЙНЫХ ЧИСЕЛ!!!!

UPDATE Employees
SET Age = timestampdiff(YEAR, BirthDate, CURDATE());

/*Написать функцию классификации зарплаты:
'Низкая' для зарплаты менее 50000
'Средняя' для зарплаты от 50000 до 70000
'Высокая' для зарплаты свыше 70000
Написать запрос, который вернет имя, зарплату 
и класс зарплаты сотрудника.*/

CREATE FUNCTION class_salary(salary DECIMAL(10,2))
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    RETURN 
        CASE
            WHEN salary < 50000 THEN 'Низкая'
            WHEN salary <= 70000 THEN 'Средняя'
            ELSE 'Высокая'
        END
    ;
END;

SELECT *, class_salary(Salary)
FROM Employees;

update Employees
set Salary = Salary / 2

-- Создайте функцию get_tax(salary), которая возвращает объем налоговой ставки:
-- 13% для зарплаты до 60000
-- 15% для зарплаты от 60000 до 80000
-- 18% для зарплаты свыше 80000



CREATE FUNCTION get_tax(salary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN 
        CASE
            WHEN salary > 80000 THEN Salary * 0.18
            WHEN salary >= 60000 THEN Salary * 0.15
            ELSE Salary * 0.13
        END
    ;
END;

SELECT FirstName, LastName, Salary, get_tax(Salary) AS Tax_volume, (Salary - get_tax(Salary)) AS Netto_salary
FROM Employees;