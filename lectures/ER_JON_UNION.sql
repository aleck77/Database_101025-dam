-- UNION

SELECT * FROM northwind.employees;

SELECT * FROM northwind.customers
union
SELECT * FROM northwind.employees;

SELECT id, first_name FROM northwind.customers
union
SELECT id, first_name FROM northwind.employees;

SELECT id FROM customers -- 29
UNION ALL
SELECT id FROM employees; -- 9

USE northwind;
SELECT first_name, last_name from
employees
UNION ALL
SELECT first_name, last_name from
customers;

SELECT customer_id, COUNT(*), 'ord' FROM orders GROUP BY customer_id
UNION
SELECT id, COUNT(*) , 'prod' FROM products GROUP BY id;

/*
Выведите в одну общую выборку из таблиц customers и employees имена и фамилии клиентов и сотрудников.
*/
select first_name, last_name, 'customers' from customers
union all
select first_name, last_name, 'employees' from employees;

-- JOIN

SELECT * FROM hr.employees emp 
LEFT JOIN hr.employees man ON emp.manager_id = man.employee_id;

SELECT *
FROM customers cust
LEFT JOIN orders ord ON cust.id = ord.customer_id;

SELECT *
FROM orders ord 
RIGHT JOIN customers cust ON cust.id = ord.customer_id;

SELECT *
FROM customers CROSS JOIN orders;
SELECT *
FROM customers, orders;

-- псевдонимы
SELECT *
FROM customers
LEFT JOIN orders  ON customers.id = customer_id;

SELECT cust.id, ord.id
FROM customers cust
LEFT JOIN orders ord ON cust.id = ord.customer_id;