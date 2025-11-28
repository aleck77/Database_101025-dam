/*
1 Выведите одним запросом с использованием UNION столбцы id, employee_id из таблицы orders 
и соответствующие им столбцы из таблицы purchase_orders 
В таблице purchase_orders  created_by соответствует employee_id
*/
SELECT id, employee_id
FROM orders 
UNION ALL 
SELECT id, created_by
FROM purchase_orders;

/*
2 Из предыдущего запроса удалите записи там где employee_id не имеет значения 
Добавьте дополнительный столбец со сведениями из какой таблицы была взята запись
*/
SELECT id, employee_id, 'employees'
FROM  orders
WHERE employee_id IS NOT NULL 
UNION ALL 
SELECT id, created_by, 'created_by'
FROM  purchase_orders
WHERE created_by IS NOT NULL;

/*
3 Выведите все столбцы таблицы order_details а также дополнительный столбец payment_method
 из таблицы purchase_orders Оставьте только заказы для которых известен payment_method
*/
SELECT od.*, po.payment_method
FROM order_details AS od
JOIN purchase_orders po 
ON od.purchase_order_id = po.id
WHERE po.payment_method IS NOT NULL;

/*
4 Выведите заказы orders и фамилии клиентов customers для тех заказов по которым были
 инвойсы таблица invoices
*/
SELECT o.id, cus.last_name
FROM orders AS o
JOIN invoices inv ON inv.order_id = o.id
JOIN customers cus ON o.customer_id = cus.id;

/*
5 Подсчитайте количество инвойсов для каждого клиента из предыдущего запроса
*/
SELECT o.id, cus.last_name, count(inv.id) cnt_inv
FROM orders AS o
JOIN invoices inv ON inv.order_id = o.id
JOIN customers cus ON o.customer_id = cus.id
GROUP BY 2;