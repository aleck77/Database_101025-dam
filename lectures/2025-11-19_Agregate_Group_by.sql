SELECT *
FROM orders;

SELECT COUNT(*)
FROM orders;

SELECT COUNT(id)
FROM orders;

SELECT COUNT(id), COUNT(payment_type)
FROM orders;

SELECT COUNT(id), COUNT(payment_type), COUNT(paid_date)
FROM orders;

SELECT COUNT(15)
FROM orders;

SELECT COUNT(15), COUNT('арбуз'), -- ship_city,  
GROUP_CONCAT(DISTINCT ship_city ORDER BY ship_city DESC SEPARATOR '\n')  -- ? 48 nan
FROM northwind.orders;

SELECT 15
FROM orders;

/*
Найдите общее количество товаров quantity в таблице order_details.
*/
SELECT SUM(quantity)
FROM order_details;

/*
Посчитайте количество уникальных order_id в таблице order_details.
*/
SELECT COUNT(DISTINCT order_id)
FROM order_details;

/*
Перечислите через запятую имена всех сотрудников из таблицы employees.
*/
SELECT GROUP_CONCAT(first_name)
FROM employees;

/*
Выведите среднее, минимум и макисиму столбца unit_price таблицы order_details.
*/
SELECT  AVG(unit_price), MIN(unit_price), MAX(unit_price)
FROM order_details;

/*
Из таблицы employees посчитать количество сотрудников в каждом городе city.
*/
       
SELECT city, COUNT(id)
FROM employees
GROUP BY city;

/*
Отсортировать результаты по убыванию.
*/
SELECT  city, COUNT(id)
FROM employees
GROUP BY 1
ORDER BY 1 DESC;

SELECT COUNT(id), city
FROM employees
GROUP BY 2
ORDER BY COUNT(id) desc;

/*
Подсчитать общее количество продуктов из таблицы order_details для каждого заказа.
*/
SELECT SUM(quantity), order_id
FROM order_details
GROUP BY order_id;

/*
Отсортировать по убыванию общего количества продуктов.  Сделать это 2мя способами.
*/
SELECT SUM(quantity), order_id
FROM order_details
GROUP BY order_id
ORDER BY 1 DESC;

SELECT SUM(quantity), order_id
FROM order_details
GROUP BY order_id
ORDER BY SUM(quantity) DESC;

SELECT order_id, SUM(quantity) as s_quantity
FROM order_details
GROUP BY order_id
ORDER BY s_quantity DESC;

/*
Посчитать сколько сотрудников работает в каждой компании из таблицы customers. 
Учитывать только тех сотрудников, у которых job_title равен 'Purchasing Manager'.
*/
SELECT company, COUNT(id)
FROM customers
WHERE job_title = 'Purchasing Manager'
GROUP BY 1;

/*
Посчитать количество сотрудников в разрезе компании и занимаемой должности из таблицы employees.
*/
SELECT COUNT(id), company, job_title
FROM northwind.employees
GROUP BY 2 , 3;

SELECT COUNT(id), company, job_title
FROM employees
GROUP BY company, job_title;