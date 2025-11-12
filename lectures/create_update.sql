CREATE DATABASE 101025_DAM_OO;
USE 101025_DAM_OO;
/*
Задание для закрепления
Создать таблицу Employees со следующими столбцами
EmployeeID
FirstName 
LastName
BirthDate 
HireDate
Salary
Email
При  этом указать ограничения
EmployeeID - первичный ключ, увеличивается автоматически на 1 при добавлении записи
FirstName и LastName - строка длиной в 50 символов Не может быть пустой
BirthDate - дата
HireDate - дата по умолчанию указывается текущая дата
Salary - число с количеством цифр 2 после запятой Общее число знаков, включая запятую, 10 Должна быть больше 0
Email - строка длиной в 100 символов Должна быть уникальной
*/
CREATE TABLE Employees (
EmployeeID int primary key auto_increment,
FirstName varchar(50) DEFAULT NULL,
LastName varchar(50) DEFAULT NULL,
BirthDate date DEFAULT NULL,
HireDate date DEFAULT NULL,
Salary decimal(10,2) check(Salary > 0),
Email varchar(100) unique
);


INSERT INTO Employees (FirstName, LastName, BirthDate, HireDate, Salary, Email)
VALUES ('Tom', 'Taylor', '1977-04-05', '2025-11-12', 10000, 'z@.');

select*
from Employees;

INSERT INTO Employees (FirstName, LastName, BirthDate, HireDate, Salary, Email)
VALUES 
('Tom', 'Taylor', '1977-04-05', '2025-11-12', 10000, 'z@.'),
('John', 'Smith', '1976-04-05', '2025-11-12', 10000, 'a@.'),
('Jane ', 'Doe', '1976-04-05', '2025-11-12', 10000, 'b@.'),
('David ', 'Lee', '1976-04-05', '2025-11-12', 10000, 'c@.'),
('Sarah ', 'Johnson', '1976-04-05', '2025-11-12', 10000, 'd@.'),
('Kim ', 'Johnson', '1976-04-05', '2025-11-12', 10000, 'e@.');


INSERT INTO Employees (first_name, last_name)
VALUES ("Timur", "S"),
("Timur", "SSS")
;
create table Employees2 AS
SELECT * FROM 101025_dam_karamanits.Employees;

select *
from Employees;

update Employees2
set Salary = 20000
where EmployeeID = 1;

SET SQL_SAFE_UPDATES = 0;

update Employees
set Salary = 20000
where EmployeeID = 1;

select *
from Employees2;

alter table Employees2
MODIFY COLUMN EmployeeID INT AUTO_INCREMENT PRIMARY KEY;

alter table Employees2
MODIFY COLUMN Email varchar(100) unique;

alter table Employees2
ADD UNIQUE (Email);

/*
Вывести идентификатор сотрудника, имя, зарплату с условием - зарплата > 5000
*/

CREATE VIEW salary_more_5000 AS
SELECT EmployeeID, FirstName, Salary
FROM Employees2
WHERE Salary > 5000;

select *
from salary_more_5000;

/*
новый столбец - class
Возможные значения: 
Pro
Medium
First
1) Pro - есть @ и зарплата > 30000
2) Medium - зарплата > 10000 и дата рождения < 2000
3) все остальные
*/
CREATE VIEW employees_class  AS
SELECT *
, CASE 
	WHEN Email LIKE '%@%' AND Salary > 30000 THEN 'Pro'
	WHEN Salary > 10000 AND  YEAR(BirthDate) < 2010 THEN 'Medium'
    ELSE 'First'
END AS class
FROM Employees;

select *
from Employees2;

-- удаление таблыцы
DROP TABLE Employees;

-- удаление строки
Delete from Employees2 Where EmployeeID = 1;

-- удаление всех данных таблыцы 
TRUNCATE TABLE Employees2;

INSERT INTO Employees2 (FirstName, LastName, BirthDate, Salary, Email)
VALUES 
('Alice', 'Green', '1985-05-15', 55000.00, 'alice.green@example.com'),
('Bob', 'Smith', '1990-08-22', 60000.00, 'bob.smith@example.com'),
('Charlie', 'Johnson', '1988-02-10', 52000.00, 'charlie.johnson@example.com'),
('Diana', 'Williams', '1992-11-01', 58000.00, 'diana.williams@example.com'),
('Edward', 'Brown', '1987-09-30', 61000.00, 'edward.brown@example.com');