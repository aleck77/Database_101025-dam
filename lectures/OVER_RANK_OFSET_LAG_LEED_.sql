SELECT  order_id
       ,product_id
       ,unit_price
       ,SUM(unit_price) OVER(ORDER BY  unit_price DESC)               AS cumulative_sum
       ,ROW_NUMBER() OVER( ORDER BY unit_price DESC)                  AS r_n
       ,ROW_NUMBER() OVER( ORDER BY unit_price DESC,order_id)         AS r_n2
       ,ROW_NUMBER() OVER( PARTITION BY unit_price ORDER BY order_id) AS r_n_ord
       ,RANK() OVER(ORDER BY unit_price DESC)                         AS rank_1
       ,DENSE_RANK() OVER(ORDER BY unit_price DESC)                   AS Drank_1
       ,NTILE(4) OVER(ORDER BY unit_price DESC)                       AS 4_part
-- 15, 15, 14, 14
FROM order_details
ORDER BY unit_price DESC
;

SELECT  *
FROM
(
	SELECT  order_id
	       ,product_id
	       ,unit_price
	       ,SUM(unit_price) OVER(ORDER BY  unit_price DESC) AS cumulative_sum
	       ,ROW_NUMBER() OVER( ORDER BY unit_price DESC)    AS r_n
	       ,RANK() OVER(ORDER BY unit_price DESC)           AS rank_1
	FROM order_details
) AS t1
WHERE rank_1 = r_n;

SELECT  *
       ,ROW_NUMBER() OVER( PARTITION BY 4_part ORDER BY  unit_price DESC) AS new_rn
FROM
(
	SELECT  order_id
	       ,product_id
	       ,unit_price
	       ,SUM(unit_price) OVER(ORDER BY  unit_price DESC) AS cumulative_sum
	       ,NTILE(4) OVER(ORDER BY unit_price DESC)         AS 4_part -- 15, 15, 14, 14
	FROM order_details
	ORDER BY unit_price DESC
) AS t1
;

--Проставить номера строк в зависимости от даты продажи
SELECT  *
       ,ROW_NUMBER() OVER (ORDER BY  SaleDate) AS row_num
FROM orders; /* Провести анализ и выделить лидеров продаж в каждом департаменте
(указать номер продажи в общем рейтинге с пропуском ранга для одинаковых значений
) */
SELECT  *
       ,RANK() OVER (PARTITION BY DepartmentID ORDER BY  SaleAmount DESC) AS ls
FROM Sales;
--Необходимо отранжировать данные продаж по уникальным значениям их стоимости.
SELECT  *
       ,DENSE_RANK() OVER (order by SaleAmount DESC)
FROM sales;
--Разбить набор данных на 3 равных группы. Сколько строк будет в каждой?
SELECT  *
       ,NTILE(3) OVER(ORDER BY  SaleAmount DESC)
FROM sales;
--Присвоить ранг продукту без пропусков значений в ранге от
--большей себестоимости к меньшей. Вывести ТОП 10 продуктов product_name.
--Таблица products
SELECT  id
       ,product_name
       ,standard_cost
       ,DENSE_RANK() OVER(ORDER BY  standard_cost DESC)
FROM products
LIMIT 10;

SELECT  id
       ,product_name
       ,standard_cost
       ,DENSE_RANK() OVER(ORDER BY  standard_cost DESC)
FROM products
LIMIT 10;
--Доработать последний запрос, чтобы вывелось топ 22 продукта. Решить через CTE.
WITH dense_top AS
(
	SELECT  id
	       ,product_name
	       ,standard_cost
	       ,DENSE_RANK() OVER(ORDER BY  standard_cost DESC) AS top_22
	FROM products
)
SELECT  *
FROM dense_top
WHERE top_22 <= 22;
--Пронумеровать строки в таблице в зависимости от названия товара в алфавитном порядке
SELECT  product_name
       ,ROW_NUMBER() OVER ( ORDER BY  product_name ) AS r_name
FROM products;
--Разделить все продукты на 4 равных группы в зависимости от list_price
--Вывести имя продукта, list_price и номер группы
SELECT  product_name
       ,list_price
       ,NTILE (4) OVER(ORDER BY  list_price) AS 4_part
FROM products;
--Найти значение SaleAmount следующей продажи по дате.
SELECT  *
       ,LEAD(SaleAmount,1,200) OVER(ORDER BY  SaleDate) AS lead_Sale
FROM t;
--примеры с лекции
SELECT  order_date
       ,customer_id
       ,LEAD(customer_id) OVER(ORDER BY  order_date)            AS next_client
       ,LEAD(customer_id) OVER(ORDER BY order_date DESC)        AS prev_client_lead
       ,LAG(customer_id) OVER(ORDER BY order_date)              AS prev_next_client_lag
       ,LEAD(customer_id,3) OVER(ORDER BY order_date)           AS next3_client
       ,LEAD(customer_id,3,-1) OVER(ORDER BY order_date)        AS next3_client
       ,LEAD(customer_id,3,'abc') OVER(ORDER BY order_date)     AS next3_client
       ,LAG(customer_id) OVER ( ORDER BY order_date)            AS prev_client_lag
       ,LAG(customer_id,2,12345354) OVER ( ORDER BY order_date) AS prev_client_lag
       ,LAG(customer_id) OVER(ORDER BY order_date DESC)         AS prev_next_client_lag
FROM orders
ORDER BY order_date;

SELECT  order_date
       ,customer_id
       ,LEAD(customer_id) OVER(ORDER BY  order_date)                                                        AS next_client
       ,LEAD(customer_id) OVER(ORDER BY order_date DESC)                                                    AS prev_client_lead
       ,LAG(customer_id) OVER(ORDER BY order_date)                                                          AS prev_next_client_lag
       ,LEAD(customer_id,3) OVER(ORDER BY order_date)                                                       AS next3_client
       ,LEAD(customer_id,3,-1) OVER(ORDER BY order_date)                                                    AS next3_client
       ,LEAD(customer_id,3,'abc') OVER(ORDER BY order_date)                                                 AS next3_client
       ,LAG(customer_id) OVER ( ORDER BY order_date)                                                        AS prev_client_lag
       ,LAG(customer_id,2,12345354) OVER ( ORDER BY order_date)                                             AS prev_client_lag
       ,LAG(customer_id) OVER(ORDER BY order_date DESC)                                                     AS prev_next_client_lag
       ,FIRST_VALUE(customer_id) OVER (PARTITION BY YEAR(order_date),MONTH(order_date) ORDER BY order_date) AS first_cl
       ,nth_value(customer_id,3) OVER (ORDER BY order_date)
FROM orders
ORDER BY order_date;

--Найти значение SaleAmount предыдущей продажи по дате.
SELECT  *
       ,LAG(SaleAmount) OVER(ORDER BY  SaleDate) AS prev_sale
FROM sales;
--Задача: Найти первую цену продажи для каждого месяца.
SELECT  OrderID
       ,OrderDate
       ,UnitPrice
       ,FIRST_VALUE(UnitPrice) OVER (PARTITION BY EXTRACT(YEAR
FROM OrderDate), EXTRACT(MONTH
FROM OrderDate) ORDER BY OrderDate) AS FirstPriceOfMonth
FROM OrderDetails;

SELECT  date
       ,SUM(amt)
       ,nth_value(SUM(amt),7) OVER(PARTITION BY YEAR(order_date),MONTH(order_date) ORDER BY  order_date ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
FROM TABLE
GROUP BY  date;

, nth_value(customer_id,7) OVER (ORDER BY order_date ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)

SELECT order_date, customer_id 

 , LEAD(customer_id, 3) OVER(ORDER BY  order_date) as next3_client
 , LAST_VALUE(customer_id) OVER(ORDER BY  order_date ROWS BETWEEN CURRENT ROW and 3 FOLLOWING)
 , SUM(customer_id) OVER(ORDER BY order_date)
, SUM(customer_id) OVER(ROWS BETWEEN UNBOUNDED PRECEDING and CURRENT ROW)
FROM orders
ORDER BY order_date;