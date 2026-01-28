-- Таблица order_details
USE northwind;
-- 1 Для каждого product_id выведите inventory_id, а также предыдущий и последующей inventory_id по убыванию quantity

SELECT  product_id
       ,inventory_id
       ,LAG(inventory_id) OVER(PARTITION BY product_id ORDER BY  quantity DESC) AS prev_inv_id
       ,LEAD(inventory_id) OVER(PARTITION BY product_id ORDER BY quantity DESC) AS next_inv_id
FROM order_details;

-- 2 Выведите максимальный и минимальный unit_price для каждого order_id с помощью функции FIRST VALUE.  
-- Вывести order_id и полученные значения

SELECT  order_id
       ,FIRST_VALUE(unit_price) OVER(PARTITION BY order_id ORDER BY  unit_price DESC) AS u_p_max_f
       ,FIRST_VALUE(unit_price) OVER(PARTITION BY order_id ORDER BY unit_price)       AS u_p_min_f
FROM order_details;

-- 3 Выведите order_id и столбец с разницей между  unit_price для каждого заказа и минимальным unit_price в рамках одного заказа. 
-- Задачу решить двумя способами - с помощью First VAlue и MIN

SELECT  order_id
       ,unit_price - FIRST_VALUE(unit_price) OVER(PARTITION BY order_id ORDER BY  unit_price) AS diff_u_p_first
FROM order_details;

SELECT  order_id
       ,unit_price - MIN(unit_price) OVER(PARTITION BY order_id) AS diff_u_p_min
FROM order_details;


-- 4 Присвойте ранг каждой строке используя RANK по убыванию quantity
SELECT  quantity
       ,RANK() OVER (ORDER BY  quantity DESC) AS rank_quan
FROM order_details;

-- 5  Из предыдущего запроса выберите только строки с рангом до 10 включительно

WITH top_10 AS
(
	SELECT  quantity
	       ,RANK() OVER (ORDER BY  quantity DESC) AS rank_quan
	FROM order_details
)
SELECT  quantity
       ,rank_quan
FROM top_10
WHERE rank_quan <= 10;