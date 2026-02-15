--Все запросы пишем в интерфейсе DBeaver На платформу загружаем скрины выполненных запросов

--1 Выберите только те строки из таблицы suppliers, где company имеет значение Supplier A

SELECT *
FROM suppliers
WHERE company = 'Supplier A';

--2 Вывести все строки там, где purchase_order_id не указано. При этом дополнительно создать столбец total_price как произведение quantity * unit_price

SELECT *, quantity * unit_price AS total_price
FROM order_details
WHERE purchase_order_id IS NULL;

--3 Выведите какая дата будет через 51 день

SELECT ADDDATE(CURDATE(), INTERVAL 51 DAY) AS INTERVAL_51;

--
--4  Посчитайте количество уникальных заказов purchase_order_id
--
--5 Выведите все столбцы таблицы order_details, а также дополнительный столбец payment_method из таблицы purchase_orders. Оставьте только заказы для которых известен payment_method