use northwind;

SELECT  last_name
       ,first_name
       ,state_province
       ,COUNT(*) OVER()
       ,COUNT(*) OVER(PARTITION BY state_province)
FROM customers
ORDER BY 3;

SELECT  last_name
       ,first_name
       ,state_province
       ,COUNT(*) OVER()
       ,COUNT(*) OVER(PARTITION BY state_province) AS total_clients
       ,COUNT(*) OVER(PARTITION BY state_province) / COUNT(*) OVER()
FROM northwind.customers
ORDER BY state_province;

-- Для каждого клиента посчитать общую сумму всех его заказов
SELECT  *
       ,SUM(OrderAmount) OVER (PARTITION BY CustomerID) AS total_amount
FROM orders;

-- Подсчитать количество заказов для каждого клиента.
SELECT  *
       ,COUNT(*) OVER (PARTITION BY CustomerID) AS orders_cust
FROM orders;

-- 1 Из таблицы products выведите максимальный list_price для каждой строки, имя продукта и его list_price.
SELECT  product_name
       ,list_price
       ,MAX(list_price) OVER() AS max_price
FROM products;

SELECT  product_name
       ,list_price
       ,(
SELECT  MAX(list_price)
FROM products)
FROM products;

-- 2 Используя предыдущий запрос посчитайте разницу в процентах между ценой продукта и максимальной ценой
SELECT  product_name
       ,list_price
       ,MAX(list_price) OVER() AS max_price
       ,round((MAX(list_price) OVER() - list_price) / MAX(list_price) OVER() * 100,1) dif_proc_price
FROM products;

-- 3 Посчитайте количество продуктов в каждой категории с помощью оконной функции Оптимально ли использование оконной 
SELECT  category
       ,COUNT(*) OVER(PARTITION BY category) AS cnt_prod_cat
FROM products;
-- оптимизация
SELECT  category
       ,COUNT(*) AS cnt_prod_cat
FROM products
GROUP BY  1;

-- 4 Найдите разницу между standard_cost продукта и средним list_price по всей таблицы для каждой строки
SELECT  product_name
       ,standard_cost - AVG(list_price) OVER() AS dif_cost
FROM products;

--  Можно ли решить предыдущее задание без оконных функций
SELECT  product_name
       ,standard_cost - (
SELECT  AVG(list_price)
FROM products) AS dif_cost
FROM products;

SELECT  product_name
       ,ROUND(standard_cost - avg_price,1) AS dif_cost
FROM products
CROSS JOIN
(
	SELECT  AVG(list_price) AS avg_price
	FROM products
) AS avg_price_tb;

WITH avg_list_price AS
(
	SELECT  AVG(list_price) AS avg_price
	FROM products
)
SELECT  product_name
       ,standard_cost
       ,round(standard_cost - avg_list_price.avg_price ,2) AS dif
FROM products
JOIN avg_list_price
ON 1 = 1;

-- Рассчитать кумулятивную сумму продаж по датам.
SELECT  *
       ,SUM(SaleAmount) OVER(ORDER BY  SaleDate) AS running_amount
FROM orders;

-- Рассчитать текущее среднее значение суммы заказов для каждого клиента.
SELECT  *
       ,AVG(OrderAmount) OVER(PARTITION BY CustomerID ORDER BY  OrderDate) AS running_avg_amount
FROM FROM orders;

-- HW purchase_order_details 3 2 пункта, 4 2 пункта (без вложенных запросов)