use northwind;
/* Вывести из таблицы employees два столица - 1 фамилия и имя id
EMP-2
*/

SELECT CONCAT(last_name, ' ', first_name) AS full_name,
    CONCAT('EMP-', CAST(id AS CHAR)) AS id_code
FROM northwind.employees;

SELECT CONCAT(last_name, ' ', first_name) AS full_name,
    CONCAT('EMP-', LPAD(CAST(id AS CHAR), 3, '0')) AS id_code
FROM northwind.employees;

SELECT 
    id, customer_id,
       CONCAT('EMP-', CAST(id AS CHAR(1))) AS EMP
FROM
    northwind.orders;
    
SELECT 
    id,
    CONCAT('EMP-', LPAD(id, 6, '0')) AS full_id
FROM
    orders;
/*Вывести те заказы, где дата оплаты прошла спустя более чем двое суток с даты заказа*/    
SELECT order_date, paid_date
FROM orders
WHERE paid_date - order_date >= 2
        OR paid_date IS NULL
;
SELECT order_date, shipped_date
FROM orders
WHERE shipped_date - order_date >= 2
        #OR paid_date IS NULL
;

SELECT order_date, shipped_date, datediff(shipped_date, order_date)as date_diff, dayname(order_date),  dayname(order_date)
FROM orders
WHERE datediff(shipped_date, order_date)>2
;
SET lc_time_names = 'es_MX';
SET lc_time_names = 'ru_RU';
SET lc_time_names = 'de_DE';
/*
mysql> SET lc_time_names = 'es_MX';
Query OK, 0 rows affected (0.00 sec)

mysql> SELECT @@lc_time_names;
+-----------------+
| @@lc_time_names |
+-----------------+
| es_MX           |
+-----------------+
*/
SELECT order_date, shipped_date, datediff(shipped_date, order_date)as date_diff, dayname(order_date),  dayname(order_date)
FROM orders
WHERE datediff(shipped_date, order_date)>2;

SELECT @@lc_time_names;

SELECT @@global.time_zone, @@session.time_zone;