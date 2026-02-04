/*
1 Вывести среднее, минимум, максимум и сумму по столбцу standard_cost
*/
SELECT round(AVG(standard_cost), 2) AS avg_cost , MIN(standard_cost), MAX(standard_cost), SUM(standard_cost)
FROM products;

/*
2  Посчитайте количество товаров в каждой категории category Выведите только записи с количеством товаров не менее 3
*/
SELECT category, COUNT(id)
FROM products
GROUP BY category
HAVING COUNT(id) >= 3;

/*
Выведите среднюю себестоимость standard_cost для пары supplier_ids + category
*/
SELECT AVG(standard_cost), supplier_ids, category
FROM products
GROUP BY supplier_ids , category;

SELECT CONCAT_WS('. ', supplier_ids, category), AVG(standard_cost)
FROM products
GROUP BY 1;

/*
Посчитайте количество продуктов, для которых отсутсвует minimum_reorder_quantity
*/
SELECT COUNT(*) AS CNT
FROM northwind.products
WHERE minimum_reorder_quantity IS NULL;

/*
Посчитайте количество продуктов, для которых отсутсвует minimum_reorder_quantity и для которых он указан одним запросом.
*/
SELECT COUNT(*) AS is_null,
    CASE
        WHEN minimum_reorder_quantity IS NOT NULL THEN 0
        ELSE 1
    END AS no_flag
FROM products
GROUP BY no_flag;

SELECT count(minimum_reorder_quantity) AS is_null, count(*) - count(minimum_reorder_quantity) AS not_null
FROM products;

SELECT 
    COUNT(minimum_reorder_quantity),
    COUNT(*) - COUNT(minimum_reorder_quantity)
FROM
    products;

/*
Посчитайте количество уникальных категорий
*/
SELECT count(distinct category)
FROM products;

/*
Разделите все товары на группы по reorder_level если reorder_level меньше 10 то 'low' , от 10 до 20 включительно - 'medium' , осталные - 'hight' 
Вывести среднее, максимум и минимум столбца list_price для каждой группы
*/
SELECT 
    CASE
        WHEN reorder_level < 10 THEN 'low'
        WHEN reorder_level BETWEEN 10 AND 20 THEN 'medium'
        ELSE 'hight'
    END AS 'group',
    MAX(list_price),
    AVG(list_price)
FROM northwind.products
GROUP BY 1;

/*
7 Найти средний standard_cost только для тех продуктов, 
которые продаются коробками quantity_per_unit
*/
SELECT avg(quantity_per_unit) 
FROM northwind.products
where lower(quantity_per_unit) like '%box%';

/*
8 Вычислите суммарную прибыль компании для каждой категории для продуктов 
с target_level больше 40 Прибыль компании вычисляется как list_price - standard_cost
*/
SELECT category, SUM(list_price - standard_cost) AS profit
FROM products
WHERE target_level > 40
GROUP BY category;

/*
Вывести из таблицы customers количество клиентов в каждом городе и штате и отсортировать по убыванию клиентов.
*/
SELECT COUNT(id), city, state_province
FROM customers
GROUP BY 2
ORDER BY 1 DESC;

/*
Вывести топ 3 id клиентов по количеству заказов из таблицы orders
*/
SELECT 
    customer_id
FROM
    orders
GROUP BY customer_id
ORDER BY COUNT(*) DESC
LIMIT 3;

/*
Найти штат с самым большим средним временем доставки товара в днях.
*/
select ship_state_province, round(avg(datediff(shipped_date, order_date)), 2)   as ship_time_top1
-- select ship_state_province, TIMESTAMPDIFF(day, shipped_date, order_date)
from orders
group by 1
order by 2 desc
limit 1;

/*
Найти месяц в который было осуществлено меньше всего заказов, но не более 2.
*/
select monthname(order_date), count(id)
from orders
group by 1
having count(id) <= 3
order by 2
-- limit 5
;