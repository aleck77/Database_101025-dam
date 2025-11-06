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
    orordersders;
    
