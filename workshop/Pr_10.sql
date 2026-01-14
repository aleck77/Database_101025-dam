/*
Из таблицы purchase_orders для каждого поставщика supplier_id выведите 
дату создания заказа, а также дату создания предыдущего заказа. 
Посчитайте разницу между этим датами.
*/
SELECT  supplier_id
       ,creation_date
       ,LAG(creation_date) OVER(PARTITION BY supplier_id ORDER BY  creation_date)
       ,DATEDIFF(creation_date, LAG(creation_date) OVER(PARTITION BY supplier_id ORDER BY creation_date))
FROM purchase_orders;

--Измените предыдущий запрос таким образом, чтобы узнать среднее время между двумя заказами.
WITH t1 AS
(
	SELECT  supplier_id
	       ,DATEDIFF(creation_date,LAG(creation_date) OVER(PARTITION BY supplier_id ORDER BY creation_date)) AS date_diff
	FROM purchase_orders
)
SELECT  supplier_id
       ,AVG(date_diff) AS avg_
FROM t1
GROUP BY  supplier_id;

-- Напишите аналогичный второму задания запрос но с использованием функции LEAD Сравните результаты
WITH t1 AS
(
	SELECT  supplier_id
	       ,DATEDIFF(creation_date,LEAD(creation_date) OVER(PARTITION BY supplier_id ORDER BY creation_date DESC)) AS date_diff
	FROM purchase_orders
)
SELECT  supplier_id
       ,AVG(date_diff) AS avg_
FROM t1
GROUP BY  supplier_id;

--Нaйдите самую раннюю дату submitted_date для каждого менеджера created_by 
--Решите данное задание использую оконные функции MIN и FIRST VALUE Сравните результаты
SELECT  id
       ,created_by
       ,submitted_date
       ,FIRST_VALUE(submitted_date) OVER(PARTITION BY created_by ORDER BY  submitted_date) AS erly_date
       ,MIN(submitted_date) OVER(PARTITION BY created_by) AS erly_date_min
FROM purchase_orders;

--Вывести наибольшее submitted date. Сделать через MAX, LAST_VALUE.
SELECT  id
       ,created_by
       ,submitted_date
       ,LAST_VALUE(submitted_date) OVER(PARTITION BY created_by ORDER BY  submitted_date ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS las_date
       ,MAX(submitted_date) OVER(PARTITION BY created_by) AS las_date_max
FROM purchase_orders;

SELECT  id
       ,created_by
       ,submitted_date
       ,LAST_VALUE(submitted_date) OVER(PARTITION BY created_by ORDER BY  submitted_date)                                                         AS last_date -- находит последнюю дату ДО текущей строки окна
       ,LAST_VALUE(submitted_date) OVER(PARTITION BY created_by ORDER BY submitted_date ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS last_date2
       ,MAX(submitted_date) OVER(PARTITION BY created_by)                                                                                         AS last_date_max -- находит истинную последнюю дату окна
FROM purchase_orders;

--Таблица purchase_order_details
--Для каждого product_id выведите дату его получения date_received, 
--предыдущую и последующую даты получения этого продукта. 
--Оставьте только строки где date_received не является пропуском.
SELECT  product_id
       ,date_received
       ,LAG(date_received) OVER(PARTITION BY product_id ORDER BY  date_received)
       ,LEAD(date_received) OVER(PARTITION BY product_id ORDER BY date_received)
FROM purchase_order_details
WHERE date_received IS NOT NULL;

SELECT  product_id
       ,date_received
       ,lag(date_received) OVER (PARTITION BY product_id ORDER BY  date_received)
       ,lead(date_received) OVER (PARTITION BY product_id ORDER BY date_received)
FROM purchase_order_details
WHERE date_received IS NOT NULL;