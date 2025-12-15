-- HW 7

/* 1. Вывести названия продуктов таблица products, включая количество заказанных единиц quantity для каждого продукта таблица order_details. Решить задачу с помощью cte и подзапроса.*/

-- подзапрос для группировки по product_id и подсчета total_quantity продукта
SELECT  product_id
       ,SUM(quantity) AS total_quantity
FROM order_details
GROUP BY  1
ORDER BY  2 DESC;

-- финальный запрос с подзапросом
SELECT  product_name
       ,total_quantity
FROM products pr
JOIN
(
	SELECT  product_id
	       ,SUM(quantity) AS total_quantity
	FROM order_details
	GROUP BY  1
	ORDER BY  2 DESC
) AS total_qua
ON pr.id = total_qua.product_id;

-- cte
WITH total_qua AS
(
	SELECT  product_id
	       ,SUM(quantity) AS total_quantity
	FROM order_details
	GROUP BY  1
	ORDER BY  2 DESC
)
SELECT  product_name
       ,total_quantity
FROM total_qua
JOIN products pr
ON pr.id = total_qua.product_id;

/* 2. Найти все заказы таблица orders, сделанные после даты самого первого заказа клиента Lee таблица customers.*/

-- ищем id для Lee
SELECT  id
FROM customers
WHERE last_name IN ('Lee');

-- первая дата заказа Lee
SELECT  MIN(order_date)
FROM orders
WHERE customer_id IN ( SELECT id FROM customers WHERE last_name IN ('Lee'));

-- финальный запрос с 2 подзапросами
SELECT  *
FROM orders
WHERE order_date > (
SELECT  MIN(order_date)
FROM orders
WHERE customer_id IN ( SELECT id FROM customers WHERE last_name IN ('Lee')));

-- cte 
WITH afte_lee AS
(
	SELECT  MIN(order_date)
	FROM orders
	WHERE customer_id IN ( SELECT id FROM customers WHERE last_name IN ('Lee')) 
)
SELECT  *
FROM orders
WHERE order_date > (
SELECT  *
FROM afte_lee);

/* 3. Найти все продукты таблицы  products c максимальным target_level*/

-- находим значение текущего максимального target_level
SELECT  MAX(target_level)
FROM products;

-- финальный запрос с подзапросом
SELECT  product_name
       ,target_level
FROM products
WHERE target_level = (
SELECT  MAX(target_level)
FROM products);

-- cte
WITH mtl AS
(
	SELECT  MAX(target_level)
	FROM products
)
SELECT  product_name
       ,target_level
FROM products
WHERE target_level = (
SELECT  MAX(target_level)
FROM products);