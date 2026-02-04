CREATE FUNCTION hypo_triangle(legs_a DECIMAL(10,2), legs_b DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN SQRT(POW(legs_a, 2) + POW(legs_b, 2));
END;

SELECT hypo_triangle(6, 8);

-- Переменные в фун-иях
-- READS SQL DATA не обязательно в MySQL  
-- DECLARE обявление переменных
-- SET @user_var = 10; присвоение значений (в том числе выражения)
-- SELECT @@version;

CREATE FUNCTION max_age_dep(dep int)
RETURNS DECIMAL(10,2)
DETERMINISTIC
READS SQL DATA -- не обязательно в MySQL
BEGIN
    DECLARE max_age INT;
    SELECT MAX(age) INTO max_age FROM Emploees WHERE departament_id = dep;
    RETURN salary * 1.5;
END;

-- Примеры Алексея
-- 1
DELIMITER $$

CREATE FUNCTION hypotenuse (a DECIMAL(10,2), b DECIMAL(10,2), dep int)
RETURNS DECIMAL(10,2)
DETERMINISTIC

READS SQL DATA -- не обязательно в mysql

BEGIN
	DECLARE a_2, b_2 DECIMAL(10,2) DEFAULT 0;
    DECLARE max_age INT;
    SET a_2 = POW(a,2);
    SET a_2 = 2;
    SET b_2 = POW(b,2);
    SELECT MAX(age) INTO max_age FROM employees WHERE department_id = dep;
   --  DECLARE b_2 DECIMAL(10,2) DEFAULT 0
	RETURN SQRT(a_2 + b_2);
END$$ 

DELIMITER ;

-- 2
CREATE FUNCTION hypotenuse (dep int)
RETURNS VARCHAR(10)
DETERMINISTIC
READS SQL DATA -- не обязательно в mysql
BEGIN
    DECLARE max_age INT;
    SET a = IF( условие, значение 1, значение2);
    
    IF max_age > 0 THEN 
		(SET a= 9;
		RETURN  
			CASE WHEN max_age <30 
			THEN 'young' END)
	ELSEIF  THEN
		RETURN
	END IF;
    
    
    SELECT MAX(age) INTO max_age FROM employees WHERE department_id = dep;
	RETURN CASE WHEN max_age <30 THEN 'young'
		END;
END$$

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

-- Задача для факультативныой работы

-- Создайте функцию calculate_bonus(salary, hire_date), которая рассчитывает годовой бонус:
-- 5% от зарплаты для стажа менее 2 лет
-- 10% от зарплаты для стажа от 2 до 5 лет
-- 15% от зарплаты для стажа свыше 5 лет
-- Рассчитать финальную зарплату.

SELECT  FirstName
       ,LastName
       ,Salary
       ,hiredate
       ,TIMESTAMPDIFF(YEAR,hiredate,CURDATE()) AS experience
       ,CASE WHEN TIMESTAMPDIFF(YEAR,hiredate,CURDATE()) < 2 THEN salary * 0.05
             WHEN TIMESTAMPDIFF(YEAR,hiredate,CURDATE()) < 5 THEN salary * 0.1  ELSE salary * 0.15 END AS bonus_volume
FROM 101025dam_Svit.Employees;

CREATE FUNCTION calculate_bonus(salary DECIMAL(10,2), HireDate DATE) 
RETURNS decimal(10,2)
DETERMINISTIC
BEGIN
		DECLARE experience INT;
		SET experience = TIMESTAMPDIFF(YEAR, hiredate, CURDATE());
		RETURN CASE 
			WHEN experience < 2 THEN salary * 0.05
			WHEN experience < 5 THEN salary * 0.1
			ELSE salary * 0.15
			END;
END

-- 101025dam_rNatalia  101025dam_Svit
SELECT FirstName, LastName, hiredate,TIMESTAMPDIFF(YEAR,hiredate,CURDATE()) AS experience, Salary, calculate_bonus(Salary, HireDate) AS bonus_volume, (Salary + calculate_bonus(Salary, HireDate)) AS bonus_salary
FROM 101025dam_Svit.Employees;