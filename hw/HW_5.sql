/*
База данных northwind
Работаем с таблицей purchase_order_details
*/
USE northwind;

-- 1 Посчитайте основные статистики - среднее, сумму, минимум, максимум столбца unit_cost.
SELECT ROUND(AVG(unit_cost), 2) AS avg_unit_cost, SUM(unit_cost), MIN(unit_cost), MAX(unit_cost)
FROM purchase_order_details;

-- 2 Посчитайте количество уникальных заказов purchase_order_id
SELECT COUNT(DISTINCT purchase_order_id)
FROM purchase_order_details;

-- 3 Посчитайте количество продуктов product_id в каждом заказе purchase_order_id Отсортируйте полученные данные по убыванию количества
SELECT purchase_order_id, COUNT(product_id) AS cnt_product
FROM purchase_order_details
GROUP BY 1
ORDER BY 2 DESC;

-- 4 Посчитайте заказы по дате доставки date_received Считаем только те продукты, количество quantity которых больше 30
SELECT date_received, COUNT(id) AS cnt_order
FROM purchase_order_details
WHERE quantity > 30
GROUP BY 1;

-- 5 Посчитайте суммарную стоимость заказов в каждую из дат Стоимость заказа - произведение quantity на unit_cost
SELECT date_received, SUM(quantity * unit_cost) AS total_order_cost
FROM purchase_order_details
GROUP BY 1;

-- 6 Сгруппируйте товары по unit_cost и вычислите среднее и максимальное значение quantity только для товаров где purchase_order_id не больше 100
SELECT unit_cost, AVG(quantity), MAX(quantity)
FROM purchase_order_details
WHERE purchase_order_id <= 100
GROUP BY 1;

/*
7 Выберите только строки где есть значения в столбце inventory_id 
Создайте столбец category - если unit_cost > 20 то 'Expensive' в остальных случаях 'others' 
Посчитайте количество продуктов в каждой категории
*/
SELECT 
    CASE
        WHEN unit_cost > 20 THEN 'Expensive'
        ELSE 'others'
    END AS category, COUNT(id) AS cnt_produkt
FROM purchase_order_details
WHERE inventory_id IS NOT NULL
GROUP BY category;
