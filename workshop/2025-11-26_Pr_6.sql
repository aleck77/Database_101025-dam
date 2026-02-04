/*
Объедините с помощью UNION ALL названия компаний сотрудников из таблицы employees, названия
компаний клиентов из таблицы customers и названия компаний для поставщиков из таблицы suppliers.
*/
SELECT * FROM .employees
UNION ALL
SELECT * FROM customers
UNION ALL
SELECT * FROM suppliers;

/*
Выведите все строки из объединенных таблиц employees и employee_privileges с помощью INNER/RIGHT и LEFT JOIN. Объясните полученные результаты.
*/
select *
from employees
inner join employee_privileges on employees.id = employee_privileges.employee_id;

select *
from employee_privileges;

select *
from employees
left join employee_privileges on employees.id = employee_privileges.employee_id;

select *
from employees
right join employee_privileges on employees.id = employee_privileges.employee_id;

/*
Выведите идентификаторы заказов из таблицы order_details.  
Дополнительно выведите вместо product_id  столбец с именем продукта product_name из products.
*/
select od.order_id, product_name
from order_details as od
left join products as pd on od.product_id = pd.id
;

/*
Используя предыдущий запрос, посчитайте количество заказов для каждого наименования продукта.
*/
select product_name, count(od.order_id)
from order_details as od
left join products as pd on od.product_id = pd.id
group by product_name
;

/*
Выведите идентификаторы заказов из таблицы order_details. Дополнительно выведите вместо product_id  столбец 
с именем продукта product_name из products и столбец payment_amount из таблицы purchase_orders. 
Оставить все строки из таблицы order_details.
*/
select order_id, product_name, payment_amount
from order_details as od
left join products as pd on od.product_id = pd.id
left join purchase_orders as purch on od.purchase_order_id = purch.id;

/*
Объедините с помощью UNION ALL названия компаний сотрудников из таблицы employees, названия
компаний клиентов из таблицы customers и названия компаний для поставщиков из таблицы suppliers.
*/
SELECT company FROM employees
UNION ALL
SELECT company FROM customers
UNION ALL
SELECT company FROM suppliers;

SELECT company, 'emp' FROM employees
UNION ALL
SELECT company, 'cus' FROM customers
UNION ALL
SELECT company, 'supp' FROM suppliers;


/*
У каких сотрудников в таблице employees нет привилегий таблица employee_privileges. Выведите имя и фамилию.
*/
select first_name, last_name, em.id, emp.employee_id
from employes em
left join employee_privileges emp on emp.employee_id = em.id
;

/*
Работаем с таблице inventory_transactions. Выведите transaction_created_date, 
а также название типа транзакции и название продукта.
*/
select inv.transaction_created_date
from inventory_transactions as inv
left join inventory_transaction_types as inv_t 
on inv.transaction_type = inv_t.id
left join products as pr
on inv.product_id = pr.id
;
SELECT inv.transaction_created_date, inv_t.type_name, pr.product_name
FROM inventory_transactions as inv
LEFT JOIN inventory_transaction_types as inv_t
ON inv.transaction_type = inv_t.id
LEFT JOIN products as pr
ON inv.product_id = pr.id;

/*
Используя предыдущий запрос, посчитайте количество транзакций по типу. 
Оставьте только те типы транзакций, в которых отсутствует слово 'Sold'.
*/
SELECT inv_t.type_name, count(transaction_created_date)
FROM inventory_transactions as inv
LEFT JOIN inventory_transaction_types as inv_t
ON inv.transaction_type = inv_t.id
where type_name not like '%Sold%'
group by 1;

/*
Используя предыдущий запрос, посчитайте количество транзакций по типу. 
Оставьте только те типы транзакций, в которых отсутствует слово 'Sold'
дополнительные условия фильтрации работают только с INNER JOIN.
*/
SELECT inv_t.type_name, count(transaction_created_date)
FROM inventory_transactions as inv
INNER JOIN inventory_transaction_types as inv_t
ON inv.transaction_type = inv_t.id and type_name not like '%Sold%'
group by 1
;

/*
В таблице orders расшифруйте значения всех столбцов, в именах которых присутствует 'id'  и для которых в базе данных имеются соответствующие таблицы. 
Выведите все строки в которых ship_city Seattle. Объясните почему в данном случае важно использовать LEFT JOIN.
*/
select o.id, o.employee_id, e.first_name, o.customer_id, c.first_name, o.shipper_id, s.first_name, o.tax_status_id, ots.tax_status_name, o.status_id, os.status_name
from orders as o
left join employees e on e.id = o.employee_id
left join customers c on c.id = o.customer_id
left join shippers s on s.id = o.shipper_id
left join orders_tax_status ots on ots.id = o.tax_status_id
left join orders_status os on os.id = o.status_id
# WHERE o.ship_city = "Seattle"
;
SELECT o.id, o.employee_id, e.first_name, o.customer_id, c.first_name, o.shipper_id, s.first_name, o.tax_status_id, ots.tax_status_name, o.status_id, os.status_name
FROM orders o
LEFT JOIN employees e ON e.id = o.employee_id
LEFT JOIN customers c ON c.id = o.customer_id
LEFT JOIN shippers s ON s.id = o.shipper_id
LEFT JOIN orders_tax_status ots ON ots.id = o.tax_status_id
LEFT JOIN orders_status os ON os.id = o.status_id
WHERE o.ship_city = "Seattle"
;