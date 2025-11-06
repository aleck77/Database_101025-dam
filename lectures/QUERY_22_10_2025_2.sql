-- активация БД
use northwind;

-- выборка
/*вывести всех 
сотрудников*/

SELECT * 
FROM employees;

SELECT first_name, last_name
FROM employees;

/*
USE northwind;
-- задание №1
# задание 1
/*Вывести данные обо всех сотрудниках
Условие для фильтрации и тд*/

SELECT *
FROM employees;

-- Вывести данные обо всех сотрудниках
-- Условие для фильтрации и тд

SELECT  first_name -- , last_name
FROM employees;

# Пракика
/*
Выведите строку  “Hello world!” в My SQL.
Подключитесь к базе данных northwind.
Откройте вкладку Tables.
Выберите таблицу orders.
Щелкните по ней Сколько столбцов и какие у них имена содержатся в этой таблице.
 Выведите всю таблицу.
*/

SELECT 'Hello world';

USE northwind;

SELECT *
FROM orders; -- 48 строк

/*
Выведите столбцы ship_name и ship_city.
Отформатируете написанные запросы в соответствии с правилами хорошего стиля.
Используйте автоформатирование My SQL.
 Сохраните написанные запросы себе на компьютер.
*/

SELECT 
    ship_name, ship_city
FROM
    orders;

-- Выбрать все строки с ценой единицы товара unit price превышающей 20

USE northwind;
SELECT *
FROM order_details
WHERE unit_price > 20;

#Выбрать все столбцы, если в заказе был продукт product_id  равный 43 и статус заказа status_id равен 2

SELECT *
FROM order_details
WHERE product_id = 43 and status_id = 2;

/*
Выбрать все строки там где количество определенного продукта в заказе quantity не превышает либо равно 15 или цена товара равна 15
*/

SELECT *
FROM order_details
WHERE quantity <= 15 or unit_price = 15;

SELECT order_id, quantity, unit_price
FROM order_details
WHERE quantity <= 15 and unit_price = 18;

/*
Выбрать Inventory_id для всех заказов кроме заказов с id не равными 79 и 46.
*/

SELECT  inventory_id
FROM order_details
WHERE order_id <> 79 and order_id <> 46;

#Оператор поиска по маске

SELECT * FROM northwind.employees
where first_name LIKE 'A%';

/*
Выбрать домашние номера сотрудников, 
если в заметках которых (notes) есть упоминание французского языка (French),  
или в середине фамилии этого сотрудника (last_name) присутствует английская буква k.
*/

USE northwind;

SELECT * FROM northwind.employees
where notes LIKE '%French%'or last_name like '_%k%_';

SELECT 
    home_phone
FROM
    employees
WHERE 
    notes like '%French%'  or     last_name like '_%k%_' ;

/*
Выбрать все строки, в которых shipping_fee больше либо равен 10 и меньше либо равен 15.
*/

SELECT * 
FROM orders
where shipping_fee between 10 and 15;

/*
Выбрать ship_name только для городов отгрузки ship_city Chicago и Miami.
*/

SELECT 
    ship_name, ship_city
FROM
    orders
WHERE
    ship_city IN ('Chicago' , 'Miami');

SELECT 
    ship_name, ship_city
FROM
    orders
WHERE
    ship_city = 'Chicago' or ship_city = 'Miami';

SELECT 
    ship_name, ship_city
FROM
    orders
WHERE
    ship_city IN ('Chicago' , 'Miami');

/*Найдите все строки в которых не указана shipped_date.*/

SELECT 
    *
FROM
    orders
WHERE
    shipped_date IS NULL;

SELECT 
    *
FROM
    orders
WHERE
    shipped_date IS NOT NULL;


/*
Выберите Id всех заказов где отсутствует shipped_date и shipper_id.
*/

SELECT 
    id
FROM
    orders
WHERE
    shipped_date IS NULL
        AND shipper_id IS NULL;
        
/*
Выбрать сотрудников, живущих в городах, 
названия которых заканчиваются на ‘mond’.
*/

SELECT 
    *
FROM
    employees
WHERE
    city LIKE '_%mond';
    
/*
Выбрать только те строки в которых 
либо unit_price больше 9 и order_id равен 30 
либо unit_price больше 9 и status_id равен 1
*/
SELECT 
    *
FROM
    order_details
WHERE
    unit_price > 9 AND order_id = 30
        OR unit_price > 9 AND status_id = 1;
        
SELECT 
    *
FROM
    order_details
WHERE
    unit_price > 9
        AND (order_id = 30 OR status_id = 1);
        
/*
Выведите список всех товаров из таблицы products, 
у которых цена (standard_cost) находится в диапазоне от 10 до 20 единиц.
Решить 2 способами
*/

SELECT 
    *
FROM
    products
WHERE
    standard_cost BETWEEN 10 AND 20;
    
SELECT 
    *
FROM
    products
WHERE
    standard_cost >=10 and standard_cost <= 20;
    
/*
Выберите имена продуктов из таблицы products где минимальная цена list_price
превышает себестоимость standard_cost более чем на 5 уе
*/

SELECT 
    *
FROM
    products
WHERE
    list_price - 5 > standard_cost;

#order_details
