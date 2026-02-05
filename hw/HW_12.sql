-- 1 Вывести id департамента , в котором работает сотрудник, в зависимости от Id сотрудника
CREATE PROCEDURE get_dep_id(IN emp_id INT)
BEGIN
    SELECT dep_id 
    FROM Employees 
    WHERE EmployeeID = emp_id;
END;

CALL get_dep_id(16)

-- 2 Создайте хранимую процедуру get_employee_age, которая принимает id сотрудника 
-- (IN-параметр) и возвращает его возраст через OUT-параметр.
CREATE PROCEDURE get_employee_age(IN emp_id INT, OUT emp_age INT)
BEGIN
    SELECT TIMESTAMPDIFF(YEAR, BirthDate, CURDATE()) 
    INTO emp_age
    FROM Employees
    WHERE EmployeeID = emp_id;
END;

CALL get_employee_age(16, @result_age);
SELECT @result_age;

-- 3 Создайте хранимую процедуру decrease_salary, которая принимает зарплату сотрудника
-- (INOUT-параметр) и уменьшает ее на 10%.

CREATE PROCEDURE decrease_salary(INOUT dec_sal DECIMAL)
BEGIN
    SET dec_sal = dec_sal * 0.9;
END;

SET @dec_sal = 10000;
CALL decrease_salary(@dec_sal);
SELECT @dec_sal;