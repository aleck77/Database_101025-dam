-- Способ 1 (правильный): авто-uppercase для SQL
-- MySQL Workbench → Edit → Preferences
-- Открой Preferences
-- Перейди в SQL Editor → Code Completion
-- Найди пункт Keyword casing
-- Поставь UPPERCASE
-- Нажми OK и перезапусти Workbench

DELIMITER //
CREATE FUNCTION calc_bonus(e_salary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN 
	DECLARE koeff DECIMAL(4,2);
    DECLARE tax DECIMAL(4,2);
	DECLARE bonus DECIMAL(10,2);

	IF e_salary > 60000 THEN 
		SET koeff = 0.15;
		SET tax = 0.2;
    ELSEIF e_salary > 40000 THEN 
		SET koeff = 0.1;
		SET tax = 0.15;
	ELSE 
		SET koeff = 0.2;
		SET tax = 0.1;
	END IF;
SET bonus = koeff * e_salary * (1-tax);
RETURN bonus;
END //

DELIMITER ;

-- написать процедуру, которая возвращает пользователя (его имя, зарплату и бонус), 
-- который получил наибольший бонус среди всех коллег.
DELIMITER //
CREATE PROCEDURE max_bonus()
BEGIN
SELECT LastName, Salary, calc_bonus(salary) + salary as total_salary
FROM Employees
WHERE calc_bonus(salary) = (SELECT MAX(calc_bonus(salary)) FROM Employees);
END;
DELIMITER ;
CALL max_bonus();

-- создать процедуру которая возвращает в переменную значение самой большой годовой зарплаты сотрудника.
DELIMITER //
DROP PROCEDURE IF EXISTS max_salary
CREATE PROCEDURE max_salary(OUT sal_max DECIMAL(10,2))
BEGIN
SELECT MAX(Salary) * 12 INTO sal_max
FROM Employees;
END;
DELIMITER ;

CALL max_salary(@sal_max);
SELECT @sal_max; --как очистить значение переменной @sal_max после пересоздания процедуры?