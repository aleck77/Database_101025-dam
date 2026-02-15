/*
Урок 2.2. Ограничение выборки.
Выбор уникальных значений
*/
/*
Напишите запрос для сортировки списка продуктов по убыванию standard_cost. 
Таблица products.
*/

SELECT product_name, standard_cost
FROM products
ORDER BY standard_cost DESC;

SELECT *
FROM products
ORDER BY standard_cost DESC;

/*
Напишите запрос для сортировки списка продуктов по цене  standard_cost и list_price.
*/
SELECT *
FROM products
ORDER BY standard_cost DESC, list_price desc;

SELECT *
FROM products
ORDER BY standard_cost, list_price;

/*
Напишите запрос для сортировки  списка клиентов 
по компании и затем по городу по возрастанию.
*/
SELECT *
FROM customers
ORDER BY company, city;

/*
Напишите запрос для сортировки заказов по дате выполнения в порядке убывания.
*/
SELECT *
FROM orders
ORDER BY order_date desc;

/*
Limit
*/
SELECT *
FROM orders
ORDER BY order_date desc
limit 5;

/*
Напишите запрос для выбора пяти самых дешевых продуктов standard_cost
 из таблицы products.
*/
SELECT *
FROM products
ORDER BY standard_cost
limit 5;

/*
Напишите запрос для выбора id десяти последних заказов.
Таблица orders.
*/
SELECT 
    id
FROM
    orders
ORDER BY order_date DESC
LIMIT 10;

/*
Напишите запрос для вывода первых 5 записей.
Таблица Customers:
*/
select *
from customers
limit 5;
/*
OFSET
*/
select *
from customers
#limit 5 offset 2;
limit 2, 5;
/*
Предположим, что в products данные из интернетмагазина, 
где ассортимент продуктов выводится
покупателю по страницам, отсортированный от А
до Z по 10 продуктов на страницу.
Составьте запрос, который выведет этот список.
*/
SELECT product_name
FROM products
ORDER BY product_name ASC
LIMIT 10 OFFSET 10;

SELECT product_name
FROM products
ORDER BY product_name ASC
LIMIT 10 OFFSET 10;

/*
DISTINCT
*/
SELECT DISTINCT ship_state_province, order_date
FROM northwind.orders;

SELECT DISTINCT ship_state_province
FROM northwind.orders;

/*
Составьте запрос для выбора уникальных городов, 
в которых находятся клиенты.
Таблица customers.
*/
SELECT DISTINCT city
FROM customers;

/*
Комбинирование
DISTINCT, ORDER BY,
LIMIT и OFFSET
*/
SELECT DISTINCT city
FROM customers
ORDER BY first_name
LIMIT 3 OFFSET 2;