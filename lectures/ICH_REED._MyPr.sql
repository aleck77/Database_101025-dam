/*Найти все заказы, сделанные клиентами из Лос-Анджелеса. Для начала нужно найти клиентов из этого города. Используем таблицу customers.*/
SELECT  *
FROM orders
WHERE customer_id IN ( SELECT id FROM customers WHERE city = 'Los Angelas');

SELECT  cus.id
       ,ship_name
       ,ship_city
FROM orders
JOIN customers cus
ON customer_id = cus.id
WHERE city = 'Los Angelas'; 

/* Найти 10 продуктов, которые были заказаны больше всего, и узнать общую сумму заказов по этим продуктам. Вывести название продуктов из products, 
а так же общее количество заказов и сумму выручки из order_details. */
SELECT  product_id
       ,COUNT(order_id)          AS prod_cnt
       ,SUM(quantity*unit_price) AS total_revenue
FROM order_details
GROUP BY  1
ORDER BY  2 DESC;

SELECT  id
       ,product_name
       ,prod_cnt
       ,total_revenue
FROM products pr
JOIN
(
	SELECT  product_id
	       ,COUNT(*)                 AS prod_cnt
	       ,SUM(quantity*unit_price) AS total_revenue
	FROM order_details
	GROUP BY  1
	ORDER BY  2 DESC
	LIMIT 10
) prod_sum
ON prod_sum.product_id = pr.id
ORDER BY 3 DESC;

/* Вывести всю информацию из order_details, где стоимость выше средней. Найти среднюю цену - это одна конкретная цифра. Сравнить столбец unit_price таблицы order_details с найденным значением. */
SELECT  AVG(unit_price)
FROM order_details;

SELECT  *
FROM order_details
WHERE unit_price > (
SELECT  AVG(unit_price)
FROM order_details);

/* Найти все заказы таблица orders оформленных сотрудниками employee_id, в контактах которых таблица employees указан Sales Representative. */
SELECT  id
FROM employees
WHERE job_title = 'Sales Representative';

SELECT  *
FROM orders
WHERE employee_id IN ( SELECT id FROM employees WHERE job_title = 'Sales Representative');

/*
Найти 10 продуктов, которые были заказаны больше всего, и узнать общую сумму заказов  по этим продуктам 
(то есть продукты с наибольшим количеством заказов и их суммарную стоимость).
*/
-- prod_sum
SELECT product_id, COUNT(*) AS prod_cnt, SUM(quantity*unit_price) AS total_revenue
FROM order_details
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

SELECT  product_name
       ,prod_cnt
       ,total_revenue
FROM products pr
JOIN
(
	SELECT  product_id
	       ,COUNT(*)                 AS prod_cnt
	       ,SUM(quantity*unit_price) AS total_revenue
	FROM order_details
	GROUP BY  1
	ORDER BY  2 DESC
	LIMIT 10
) AS prod_sum
ON prod_sum.product_id = pr.id
ORDER BY 2 DESC, 3 DESC;

WITH prod_sum AS
(
	SELECT  product_id
	       ,COUNT(*)                 AS prod_cnt
	       ,SUM(quantity*unit_price) AS total_revenue
	FROM order_details
	GROUP BY  1
	ORDER BY  2 DESC, 3 DESC
	LIMIT 10
)
SELECT  pr.product_name
       ,prod_sum.prod_cnt
       ,prod_sum.total_revenue
FROM products pr
JOIN prod_sum
ON prod_sum.product_id = pr.id
ORDER BY 2 DESC;

-- Выбрать все строки из таблицы order_details где unit_price больше среднего.
WITH avg_price AS
(
	SELECT  AVG(unit_price) AS up
	FROM order_details
)
SELECT  *
FROM order_details
WHERE unit_price > (
SELECT  up
FROM avg_price);

-- Выбрать все строки из таблицы order_details где unit_price больше среднего и меньше среднего, умноженного на 1,5.
WITH avg_price AS
(
	SELECT  AVG(unit_price) AS up
	FROM order_details
)
SELECT *
FROM order_details
WHERE unit_price > (SELECT  up FROM avg_price)
AND unit_price < (SELECT  up * 1.5 FROM avg_price);

/*Найти все заказы таблица orders оформленных сотрудниками employee_id, 
в контактах которых таблица employees указан Sales Representative (столбец job_title).*/
WITH sr AS
(
	SELECT  id
	FROM employees
	WHERE job_title = 'Sales Representative' 
)
SELECT  *
FROM orders
WHERE employee_id IN ( SELECT id FROM sr);
-- nested
SELECT  id
FROM employees
WHERE job_title = 'Sales Representative' ;
SELECT  *
FROM orders
WHERE employee_id IN (
    SELECT  id
    FROM employees
    WHERE job_title = 'Sales Representative');

/*
У каких сотрудников в таблице employees нет привилегий таблица employee_privileges. 
Выведите идентификатор, имя и фамилию. Выполните задание тремя способами - 
с помощью left join, подзапроса и сte.
*/
-- nested
SELECT  *
FROM employee_privileges; -- 2, 5

SELECT  id
       ,last_name
       ,first_name
FROM employees
WHERE id NOT IN (2, 5);

SELECT  id
       ,last_name
       ,first_name
FROM employees emp
WHERE emp.id NOT IN ( SELECT employee_id FROM employee_privileges);

-- left join
SELECT  id
       ,last_name
       ,first_name
FROM employees emp
LEFT JOIN employee_privileges
ON emp.id = employee_id
WHERE privilege_id IS NULL;

-- cte 
WITH ep AS
(
	SELECT  employee_id
	FROM employee_privileges
)
SELECT  id
       ,last_name
       ,first_name
FROM employees
WHERE id NOT IN ( SELECT employee_id FROM ep);

/*Выберите только тех сотрудников из таблицы employees,  имя которых содержит английскую 
букву 'e' или их job_title = Sales Representative. 
Из заказов orders выберите заказы в которых город отправки ship_city = Las Vegas. 
Проверьте, отправляли ли найденные сотрудники заказы в Las Vegas. 
Решите задачу с помощью подзапросов и cte.*/
-- nested
SELECT  *
FROM employees
WHERE first_name LIKE '%e%' OR job_title = 'Sales Representative';

SELECT  *
FROM orders
WHERE ship_city = 'Las Vegas'
AND employee_id IN ( SELECT id FROM employees WHERE first_name LIKE '%e%' OR job_title = 'Sales Representative');

-- cte 1
WITH emp_like AS
(
	SELECT  id
	FROM employees
	WHERE first_name LIKE '%e%' OR job_title = 'Sales Representative' 
)
SELECT  *
FROM orders
WHERE ship_city = 'Las Vegas'
AND employee_id IN ( SELECT id FROM emp_like);

-- cte 2
WITH shs AS
(
    SELECT distinct employee_id
    FROM orders
    WHERE ship_city = 'Las Vegas'
 )
SELECT  *
FROM employees
WHERE (first_name LIKE '%e%' OR job_title = 'Sales Representative')
AND id IN (SELECT employee_id FROM shs );

-- HW 7
/* 1. Вывести названия продуктов таблица products, включая количество заказанных единиц quantity для каждого продукта таблица order_details.
Решить задачу с помощью cte и подзапроса.*/

-- подзапрос для группировки по product_id и подсчета total_quantity продукта
SELECT product_id, SUM(quantity) AS total_quantity 
FROM order_details
GROUP BY 1
ORDER BY 2 DESC;

-- финальный запрос с подзапросом
SELECT product_name, total_quantity
FROM products pr
JOIN 
( 
    SELECT product_id, SUM(quantity) AS total_quantity 
    FROM order_details
    GROUP BY 1
    ORDER BY 2 DESC
) AS total_qua ON pr.id = total_qua.product_id;

-- cte
WITH total_qua AS
( 
    SELECT product_id, SUM(quantity) AS total_quantity 
    FROM order_details
    GROUP BY 1
    ORDER BY 2 DESC
)
SELECT product_name, total_quantity
FROM total_qua
JOIN products pr ON pr.id = total_qua.product_id;

/* 2. Найти все заказы таблица orders, сделанные после даты самого первого заказа клиента Lee таблица customers.*/

-- ищем id для Lee
SELECT id
FROM customers
WHERE last_name IN ('Lee')

-- первая дата заказа Lee
SELECT MIN(order_date)
FROM orders
WHERE customer_id IN (SELECT id
FROM customers
WHERE last_name IN ('Lee'))

-- финальный запрос с 2 подзапросами
SELECT *
FROM orders
WHERE order_date > (SELECT MIN(order_date)
FROM orders
WHERE customer_id IN (SELECT id
FROM customers
WHERE last_name IN ('Lee')))

-- cte 
WITH afte_lee AS
( 
    SELECT MIN(order_date)
    FROM orders
    WHERE customer_id IN (SELECT id FROM customers WHERE last_name IN ('Lee')) 
)
SELECT *
FROM orders
WHERE order_date > (SELECT * FROM afte_lee)

/* 3. Найти все продукты таблицы  products c максимальным target_level*/

-- находим значение текущего максимального target_level
SELECT MAX(target_level)
FROM products

-- финальный запрос с подзапросом
SELECT product_name, target_level
FROM products
WHERE target_level = (SELECT MAX(target_level)
FROM products)

-- cte
WITH mtl AS
( 
    SELECT MAX(target_level)
    FROM products
)
SELECT product_name, target_level
FROM products
WHERE target_level = (SELECT MAX(target_level) FROM products)