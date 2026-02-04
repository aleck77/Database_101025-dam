-- Практика 12
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
CASE
    WHEN 

    END;
END;


DELIMITER //
CREATE PROCEDURE new_status (IN c_id INT, OUT massage VARCHAR(100))
BEGIN
DECLARE is_exist INT;
	SET is_exist = (SELECT COUNT(customer_id) FROM  customers
	WHERE customer_id = c_id);
IF is_exist = 0 THEN SET massage = 'Такой клиент отсутсвует';
ELSE