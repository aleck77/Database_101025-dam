USE northwind;
-- Практика

-- 1 Для каждого заказа order_id выведите минимальный, максмальный и средний unit_price.
SELECT  order_id
       ,MIN(unit_price) OVER(PARTITION BY order_id) AS min_price
       ,MAX(unit_price) OVER(PARTITION BY order_id) AS max_price
       ,AVG(unit_price) OVER(PARTITION BY order_id) AS avg_price
FROM order_details;

-- 2 Оставьте только уникальные строки из предыдущего запроса.
SELECT  DISTINCT order_id
       ,MIN(unit_price) OVER(PARTITION BY order_id) AS min_price
       ,MAX(unit_price) OVER(PARTITION BY order_id) AS max_price
       ,AVG(unit_price) OVER(PARTITION BY order_id) AS avg_price
FROM order_details;

SELECT  order_id
       ,MIN(unit_price) AS min_price
       ,MAX(unit_price) AS max_price
       ,AVG(unit_price) AS avg_price
FROM order_details
GROUP BY  1;

-- Таблица purchase_order_details
-- 4 Посчитайте количество продуктов в каждом заказе с учетом их статуса с помощью оконной функции.
SELECT  order_id
       ,status_id
       ,COUNT(*) OVER(PARTITION BY order_id,status_id)
FROM order_details;

-- 5 Посчитайте кумулятивную количество товаров quantity по дате получения date_received. purchase_order_details
SELECT  quantity
       ,date_received
       ,SUM(quantity) OVER(ORDER BY date_received)
FROM purchase_order_details;

SELECT  quantity
       ,date_received
       ,ROUND(SUM(quantity) OVER(ORDER BY date_received))
FROM purchase_order_details
WHERE date_received IS NOT NULL;

-- 6 Посчитайте кумулятивную выручку quantity*unit_cost по дате получения date_received для каждого product_id
SELECT  product_id
       ,date_received
       ,ROUND(SUM(quantity * unit_cost) OVER(PARTITION BY product_id ORDER BY  date_received))
FROM purchase_order_details
WHERE NOT date_received IS NULL;

SELECT  product_id
       ,date_received
       ,SUM(quantity*unit_cost) OVER(PARTITION BY product_id ORDER BY  date_received) AS sum_cumul
FROM purchase_order_details
WHERE NOT date_received IS NULL;

--Вывести средний рейтинг клиентов по городам: для каждого города вывести средний рейтинг клиентов.
USE shop;
SELECT DISTINCT CITY
, AVG(RATING) OVER (PARTITION BY CITY) AS avg_rating
FROM CUSTOMERS;

SELECT CITY
, AVG(RATING) AS avg_rating
FROM CUSTOMERS
GROUP BY CITY;

-- Вывести информацию о каждом заказе и максимальную сумму заказа в том же месяце для каждой строки.
SELECT  *
       ,MAX(AMT) OVER(PARTITION BY month(ODATE)) AS max_month
FROM ORDERS;

--добавим подсчет относительного вклада каждого заказа в общий объем продаж месяца.
SELECT  *
       ,SUM(AMT) OVER(PARTITION BY month(ODATE))                      AS sum_month_order
       ,round(AMT / SUM(AMT) OVER(PARTITION BY month(ODATE)) * 100,2) AS relative_total_amnt
FROM ORDERS;

-- Вывести список продавцов с указанием общей суммы их продаж. 
-- Если продаж не было, то необходимо оставить у таких продавцов значение 0. 
-- Отсортировать продавцов по убыванию суммы продаж.
SELECT  ord.SELL_ID
       ,ORDER_ID
       ,AMT
       ,sel.SNAME
       ,COALESCE(SUM(ord.AMT) OVER(PARTITION BY SELL_ID),0) AS sum_sell
FROM SELLERS sel
LEFT JOIN ORDERS ord
ON ord.SELL_ID = sel.SELL_ID
ORDER BY 5 DESC;

-- CASE
SELECT  se.SELL_ID
       ,o.ORDER_ID
       ,o.AMT
       ,se.SNAME
       ,CASE WHEN (SUM(o.AMT) OVER (PARTITION BY o.SELL_ID)) > 0 THEN (SUM(o.AMT) OVER (PARTITION BY o.SELL_ID))  ELSE 0 END AS total_amnt
FROM SELLERS se
LEFT JOIN ORDERS o
ON o.SELL_ID = se.SELL_ID;

-- IFNULL
SELECT SNAME
, IFNULL(SUM(AMT) OVER(PARTITION BY SNAME), 0) AS sum_total
FROM SELLERS AS s
LEFT JOIN ORDERS AS o ON s.SELL_ID=o.SELL_ID
ORDER BY 2 DESC;

USE airport;

-- 1. Вывести список model_name всех самолетов (airliners) и количество всех самолетов 
-- этой модели. Так же вывести дальность полета этого самолета.
SELECT  model_name
       ,id
       ,`range`
       ,COUNT(*) OVER(PARTITION BY model_name) AS cnt_airplans
FROM airliners;

--Работаем с таблицей tickets. Написать запрос, который выводит список client_id, 
--их имена, класс и id билета  и количество перелетов, которое у него было.
SELECT  client_id
       ,cl.name
       ,tick.service_class
       ,tick.id
       ,COUNT(*) OVER (PARTITION BY client_id) AS cnt_fl
FROM tickets AS tick
LEFT JOIN clients AS cl
ON cl.id = tick.client_id;

--Для каждой поездки из таблицы trips 
--вывести общее количество поездок имеющих такой же статус.
SELECT *,
COUNT(*) OVER(PARTITION BY `status`) cnt_status_trips
FROM trips;