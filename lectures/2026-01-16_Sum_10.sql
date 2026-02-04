/*Найдите время отправки заказа date_received  и время отправки предыдущего заказа. 
Для начала оставьте только уникальные пары purchase_order_id, date_received 
и  отфильтруйте строки, там где  date_received не указано. 
Запишите результат в CTE и дальше работайте с ним.*/

WITH t1 AS
(
	SELECT  DISTINCT purchase_order_id
	       ,date_received
	FROM purchase_order_details
	WHERE date_received IS NOT NULL 
)
SELECT  purchase_order_id
       ,date_received
       ,LAG(date_received) OVER(ORDER BY  date_received) prev_date_r
       ,LEAD(date_received) OVER(ORDER BY date_received) next_date_r
FROM t1;

WITH order_received AS
(
	SELECT  DISTINCT purchase_order_id
	       ,date_received
	FROM purchase_order_details
	WHERE date_received IS NOT NULL
)
SELECT  purchase_order_id
       ,date_received
       ,LAG(date_received) OVER (ORDER BY  date_received) AS prev_date_r
FROM order_received;

/*Выведите максимальное количество quantity и минимальный unit_cost 
для каждого inventory_id с помощью функции FIRTS VALUE.*/
SELECT  inventory_id
       ,first_value(quantity) OVER (PARTITION BY inventory_id ORDER BY  quantity DESC) AS max_qu
       ,first_value(unit_cost) OVER (PARTITION BY inventory_id ORDER BY unit_cost)     AS min_cost
       ,MAX(quantity) OVER (PARTITION BY inventory_id)                                 AS max_qu2
       ,MIN(unit_cost) OVER (PARTITION BY inventory_id )                               AS min_cost2
FROM purchase_order_details;

/*Выведите одно значения – насколько в среднем отличается 
unit_cost для каждой строки от максимального unit_cost.*/
WITH u_cost_diff AS
(
	SELECT  unit_cost
	       ,MAX(unit_cost) OVER()
	       ,MAX(unit_cost) OVER() - unit_cost AS diff
	FROM purchase_order_details
)
SELECT  AVG(diff)
FROM u_cost_diff;

/*Выберите ТОП 5 продуктов с максимальным quantity, используя DENSE RANK.*/
WITH top_5 AS
(
	SELECT  product_id
	       ,quantity
	       ,DENSE_RANK() OVER(ORDER BY  quantity DESC) AS rank_quan
	FROM purchase_order_details
)
SELECT *
FROM top_5
WHERE rank_quan <= 5;

WITH top_prod AS
(
	SELECT  product_id
	       ,quantity
	       ,DENSE_RANK() OVER(ORDER BY  quantity DESC) AS rank_quan
	FROM purchase_order_details
)
SELECT  *
FROM top_prod
WHERE rank_quan <= 5;

6 Пронумеруйте строки в соответствии с убывание inventory_id Выведите только 13 строчку
SELECT * FROM
(SELECT *, ROW_NUMBER() OVER (ORDER BY inventory_id DESC) as rw
FROM purchase_order_details) a 
WHERE rw = 13