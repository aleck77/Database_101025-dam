/*
Из таблицы products выяснить какое количество товаров содержат в коде товара цифру 9 на предпоследней позиции.
*/
SELECT count(*)
FROM products
where product_code like "%9_"
#where product_code rihgt(left)
;

/*
Из таблицы order details вывести продукты со средней итоговой стоимостью выше средней.
*/
SELECT unit_price * quantity * (1 - discount) AS sum_total,  product_id
FROM order_details
WHERE unit_price * quantity * (1 - discount) > (SELECT AVG(unit_price * quantity * (1 - discount)) FROM order_details);

-- Найти имена и фамилии сотрудников с максимальной зарплатой HR.EMPLOYEES:
SELECT max(salary) 
FROM employees;

SELECT first_name, last_name, salary
FROM employees
WHERE salary = (SELECT  MAX(salary) FROM employees);

-- Найти среднюю зарплату в рамках каждого департамента
SELECT ROUND(AVG(salary)) avg_salary, department_id
FROM employees
GROUP BY department_id;

-- Найти общее количество департаментов.
SELECT COUNT(DISTINCT department_id)
FROM employees;

-- Найти самую большую зарплату среди сотрудников, работающих в департаментах с id 70 и 80.
SELECT MAX(salary)
FROM employees
WHERE department_id IN (70 , 80);

-- Найти самую большую зарплату среди сотрудников, работающих в департаментах с id 70 и 80 по-отдельности.
SELECT department_id, MAX(salary)
FROM employees
WHERE department_id IN (70 , 80)
GROUP BY 1;

-- Вывести департаменты, со средней зарплатой выше 8000
SELECT avg(salary)
FROM employees;

SELECT department_id, AVG(salary)
FROM employees
GROUP BY department_id
HAVING AVG(salary) > 8000;

SELECT department_id, AVG(salary)
FROM employees
GROUP BY department_id
HAVING AVG(salary) > 8000;

-- Найти количество сотрудников из департамента с айди 100, которые зарабатывают более 5000.
SELECT count(employee_id)
FROM employees
WHERE salary> 5000 and department_id = 100;

-- Найти количество сотрудников из департамента с айди 60, которые зарабатывают больше средней зарплаты по компании.
SELECT AVG(salary)
FROM employees;

SELECT COUNT(employee_id)
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees) AND department_id = 60;

SELECT COUNT(employee_id)
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees) AND department_id = 60;