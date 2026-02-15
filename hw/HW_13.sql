-- Все запросы пишем в интерфейсе DBeaver На платформу загружаем скрины выполненных запросов

-- 1 Выберите только те строки из таблицы suppliers, где company имеет значение Supplier A
SELECT *
FROM suppliers
WHERE company = 'Supplier A';

-- 2 Вывести все строки там, где purchase_order_id не указано. При этом дополнительно создать столбец total_price как произведение quantity * unit_price
SELECT *, quantity * unit_price AS total_price
FROM order_details
WHERE purchase_order_id IS NULL;

-- 3 Выведите какая дата будет через 51 день
SELECT DATE_ADD(CURDATE(), INTERVAL 51 DAY) AS INTERVAL_51;

-- 4  Посчитайте количество уникальных заказов purchase_order_id
SELECT COUNT(DISTINCT purchase_order_id) AS unic_pur_ord
FROM order_details;

-- 5 Выведите все столбцы таблицы order_details, а также дополнительный столбец payment_method из таблицы purchase_orders. 
-- Оставьте только заказы для которых известен payment_method
SELECT od.*, po.payment_method
FROM purchase_orders AS po
JOIN order_details AS od
	ON od.purchase_order_id = po.id
WHERE po.payment_method IS NOT NULL;

SELECT od.*, po.payment_method
FROM (
	SELECT id, payment_method
	FROM purchase_orders
	WHERE payment_method IS NOT NULL
) AS po
JOIN order_details AS od
	ON od.purchase_order_id = po.id;
