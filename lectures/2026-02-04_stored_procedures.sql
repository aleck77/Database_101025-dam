-- Хранимые процедуры

-- Заготовки для создания
INSERT INTO Employees (first_name, last_name)
VALUES ("Timur", "S"),
("Timur", "SSS")

UPDATE Employees
SET Age = round(rand()*70+1,0); -- ИСПОЛЬЗОВАНИЕ СЛУЧАЙНЫХ ЧИСЕЛ!!!!

-- Шаблон создания процедуры(пример)
DELIMITER $$
CREATE PROCEDURE add_employee(IN
emp_name VARCHAR(100), IN emp_age INT)
BEGIN
 INSERT INTO employees (name, age)
VALUES (emp_name, emp_age);
END $$
DELIMITER ;

-- Создаю процедуру добавления сотудника таблице Employees БД 101025_DAM_OO
CREATE PROCEDURE add_employee(IN emp_name VARCHAR(100), IN emp_bd DATE, IN emp_email VARCHAR(100)) 
BEGIN
INSERT INTO Employees(FirstName, BirthDate, Email) 
VALUES (emp_name, emp_bd, emp_email);
SELECT  LAST_INSERT_ID(); 
END;

-- Вызов процедуры
CALL add_employee('Alex', '1977-04-05', 'alex@gmail.com');

-- Просмотр процедуры
SHOW CREATE PROCEDURE add_employee;

-- Удаление процедуры
DROP PROCEDURE add_employee;

UPDATE Employees
SET

-- Вернуть последний айдишник таблицы
SELECT  LAST_INSERT_ID(); 

-- Создание процедуры обновления (!недописано!)
CREATE PROCEDURE upd_employee(IN emp_name VARCHAR(100), IN emp_bd DATE, IN emp_email VARCHAR(100)) 
BEGIN
INSERT INTO Employees(FirstName, BirthDate, Email) 
VALUES (emp_name, emp_bd, emp_email);
SELECT  LAST_INSERT_ID(); 
END;

-- Задание
-- Создайте хранимую процедуру, которая принимает в качестве входного  параметра IN employee_id 
-- и возвращает в качестве выходного параметра OUT -  1  или 0. 
-- Если зарплата сотрудника выше средней зарплаты по всем  департаментам – 1, в противном случае – 0.

CREATE PROCEDURE more_salary(IN emp_id INT, OUT is_more INT)
BEGIN
DECLARE emp_salary DECIMAL(10,2);
DECLARE avg_salary DECIMAL(10,2);
SET avg_salary = (SELECT AVG(Salary) FROM Employees);
SET emp_salary = (SELECT Salary FROM Employees WHERE EmployeeID = emp_id);
IF emp_salary > avg_salary THEN SET is_more = 1;
ELSE SET is_more = 0;
END IF;
END;

CALL more_salary (15,@result); -- id15
CALL more_salary (2,@result);  -- id 2
SELECT @result;

-- Пример Катерина К
DROP PROCEDURE more_then_avgsalary

DELIMITER //
CREATE PROCEDURE more_then_avgsalary (IN employee_id INT, OUT is_higher INT )
BEGIN
DECLARE emp_salary DECIMAL(10,2);
DECLARE avg_salary DECIMAL(10,2);
SET avg_salary = (SELECT AVG(Salary) FROM Employees);
SET emp_salary = (SELECT Salary FROM Employees WHERE EmployeeID = employee_id);
IF emp_salary > avg_salary THEN SET is_higher = 1;
ELSE SET is_higher = 0;
END IF;
END //
DELIMITER ;

CALL more_then_avgsalary (5,@result);
SELECT @result;
CALL more_then_avgsalary (2,@result);

-- Параметры в хранимых процедурах

/*
Создайте таблицу products с колонками id (INT) и product_name (VARCHAR), price.
Вставьте несколько записей в таблицу.
Создайте хранимую процедуру с IN-параметром для поиска имени товара по его идентификатору.
Вызовите эту процедуру и проверьте результат.
*/
CREATE PROCEDURE get_name(IN prod_id INT)
BEGIN
SELECT product_name FROM products WHERE product_id = prod_id;
END

DROP PROCEDURE get_name;

CALL get_name(5)

-- Написать процедуру, которая поднимает зарплату на 10% всем сотрудникам старше х лет 
-- (возраст передается через параметр)

SELECT * FROM 101025dam_Svit.Employees;

CREATE PROCEDURE update_salary (IN emp_age INT)
BEGIN
UPDATE Employees SET Salary = Salary*1.1 WHERE Age > emp_age ;
END


SELECT * FROM Employees;
CALL update_salary(50);

-- Создайте хранимую процедуру, которая возвращает годовую зарплату для определенного 
-- сотрудника (ежемесячная зарплата * 12) через OUT-параметр.Вызовите процедуру и 
-- проверьте результат, используя переменную для OUT-параметра.


-- способ INTO
USE 101025_DAM_OO
CREATE PROCEDURE annuall_sal(IN emp_id INT, OUT ann_salary DECIMAL(12, 2))
BEGIN
SELECT Salary * 12 INTO ann_salary FROM Employees
WHERE EmployeeID = emp_id;
END;

CALL annuall_sal(14, @devid_salary);
SELECT @devid_salary

-- Светлана, способ SET
CREATE PROCEDURE annual_salary (IN emp_id INT, OUT an_salary decimal(12,2))
BEGIN
SET an_salary = (SELECT Salary*12 FROM Employees WHERE EmployeeID = emp_id);
END

-- Сравним все годовые зарплаты сотрудников из таблицы с полученной годовой зарплатой.

SELECT * 
, ROUND(salary * 12 - @devid_salary) AS salary_DIFF
FROM Employees;

-- Создайте хранимую процедуру, которая принимает значение бонуса для сотрудника, 
-- увеличивает его на 15% и возвращает новое значение через INOUT-параметр.
-- Создайте переменную для хранения значения бонуса.
-- Создайте хранимую процедуру с INOUT-параметром, которая увеличивает бонус на 15%.
-- Вызовите процедуру с начальными значениями и проверьте измененные значения.

CREATE PROCEDURE bonus(INOUT bonus DECIMAL(10,2), IN proc int)
BEGIN
	SET bonus = bonus * (1 + proc/100);	
END;

SET @year_sal = 10000;
CALL bonus(@year_sal, 15);
SELECT @year_sal;

CALL bonus(@devid_salary, 15);
SELECT @devid_salary;

-- доработать использование ф-ции calculate_bonus
CREATE PROCEDURE bonus(INOUT bonus DECIMAL(10,2), IN proc int)
BEGIN
	SET bonus = bonus * (1 + proc/100);	
END;

-- В базе данных есть создать таблицу customers с полями:
-- •  customer_id (INT, первичный ключ) — идентификатор клиента,
-- •  name (VARCHAR(100)) — имя клиента,
-- •  total_spent (DECIMAL(10,2)) — общая сумма покупок,
-- •  status (VARCHAR(20)) — статус клиента (‘Regular’, ‘VIP’, ‘Premium’).


/*
CREATE TABLE customers (
customer_id INT auto_increment primary KEY, 
full_name VARCHAR(100),
total_spent DECIMAL(10,2) DEFAULT 0,
client_status VARCHAR(20) DEFAULT 'Regular' CHECK (client_status IN('Regular', 'VIP', 'Premium'))
);

INSERT INTO customers (full_name, total_spent) VALUES ('Tom Red', 1000),
('Harry Potter', 10000), ('Hermiona Grandger', 2000), ('Ron Uizly', 3000),
('Hans Müller', 1250),
('Anna Schneider', 3420),
('Peter Wagner', 560),
('Maria Stashkevich', 3500),
('Aaron Judge', 0.00),
('Shohei Ohtani', 344.83),
('Mookie Betts', 689.66),
('Mike Trout', 1034.49),
('Ronald Acuna Jr.', 1379.32),
('Juan Soto', 1724.15),
('Freddie Freeman', 2068.98),
('Nolan Arenado', 2413.81),
('Jose Altuve', 2758.64),
('Bryce Harper', 3103.47),
('Manny Machado', 3448.30),
('Corey Seager', 3793.13),
('Vladimir Guerrero Jr.', 4137.96),
('Fernando Tatis Jr.', 4482.79),
('Paul Goldschmidt', 4827.62),
('Jacob deGrom', 5172.45),
('Gerrit Cole', 5517.28),
('Max Scherzer', 5862.11),
('Clayton Kershaw', 6206.94),
('Justin Verlander', 6551.77),
('Yadier Molina', 6896.60),
('Ichiro Suzuki', 7241.43),
('Albert Pujols', 7586.26),
('David Ortiz', 7931.09),
('Derek Jeter', 8275.92),
('Ken Griffey Jr.', 8620.75),
('Randy Johnson', 8965.58),
('Mariano Rivera', 9310.41),
('Alex Rodriguez', 9655.24),
('Barry Bonds', 10000.00),
('Alex Ivanoff', 1250.50),
('Helen Berkovich', 150),
('Albus Dumbledore', 1520),
('Hans Müller', 920);
*/

-- Необходимо создать хранимую процедуру, которая обновляет статус клиента на основе суммы его покупок:
-- •  Если total_spent < 1000, статус — ‘Regular’.
-- •  Если total_spent >= 1000 и < 5000, статус — ‘VIP’.
-- •  Если total_spent >= 5000, статус — ‘Premium’.
-- Что должна делать процедура:
-- •  Принимать параметр customer_id.
-- •  Обновлять поле status в таблице customers в зависимости от значения total_spent.
-- •  Возвращать сообщение об успешном обновлении или ошибке (например, если клиента не существует).
CREATE PROCEDURE new_status(IN c_id INT, OUT message VARCHAR(100))
BEGIN
    DECLARE is_exist INT;
    SET is_exist = (SELECT COUNT(customer_id) FROM customers
    WHERE customer_id = c_id);
IF is_exist = 0 THEN SET message  = 'клиента не существует';
ELSE
    UPDATE customers 
    SET client_status = 
    CASE
        WHEN total_spent >= 5000 THEN 'Premium'
        WHEN total_spent >= 1000 THEN 'VIP'
        ELSE 'Regular'
    END
    WHERE customer_id = c_id;
    SET message = 'Статус изменен';
END IF;
END;

CALL new_status(26, @message);
SELECT @message;