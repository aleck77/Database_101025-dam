use northwind;
/*
Ситуация:
У вас есть числовые данные, которые хранятся в
текстовом формате. Например, количество
товаров на складе.
Проблема:
Вы хотите рассчитать общую стоимость товаров на
складе.
Если количество товаров хранится как текст, вы не
сможете сделать расчет.
*/

SELECT 
    product_name,
    unit_in_stock,
    quantity_per_unit,
    CAST(unit_in_stock AS SIGNED) * list_price AS total_value
FROM
    products;

/* Создать отчет, который показывает количество и цену продуктов в текстовом формате, 
чтобы представить информацию в более понятном виде для конечных пользователей.
Количество и цена хранятся в числовом формате, 
но для отчетов вы хотите объединить эти данные в строку, которая будет легко читаться.
*/
SELECT product_name, unit_in_stock,
    CONCAT('Available: ',
            CAST(unit_in_stock AS CHAR),
            ' units,
            Price: $',
            CAST(list_price AS CHAR)) AS product_report
FROM products;

/*
Функции для работы с датами и временем
*/
set time_zone = '+01:00';
/*
1. NOW()
Возвращает текущую дату и время в формате YYYY-MM-DD HH:MM:SS.
*/
SELECT NOW() AS CurrentDateTime;
/*
2. CURDATE()
Возвращает текущую дату в формате YYYY-MM-DD.
*/
SELECT CURDATE() AS CurrentDate;
/*
3. CURTIME()
Возвращает текущее время в формате HH:MM:SS.
*/
SELECT CURTIME() AS CurrentTime;
/*
4. DATE_FORMAT(date, format)
Возвращает дату в необходимом формате
*/
/*
5. DATEDIFF(date1, date2)
*/
SELECT DATEDIFF('2024-08-30', '2024-08-25') AS DaysDifference;

SELECT id, ship_name, paid_date, DATE_FORMAT(paid_date, '%Y/%m/%d %H:%i:%s') AS FormattedDateTime
from orders;

SELECT id, ship_name, DATEDIFF(shipped_date, DATE_FORMAT(order_date, '%Y/%m/%d %H:%i:%s')) AS FormattedDateTime
from orders;
/*
6. DATE_ADD(date, INTERVAL value unit)
*/
SELECT DATE_ADD(NOW(), INTERVAL 10 DAY) AS FutureDate;
/*
DATE_SUB(date, INTERVAL value unit)
Вычитает интервал из даты.
*/
SELECT DATE_SUB(NOW(), INTERVAL 10 DAY) AS PastDate;
/*
7. EXTRACT(unit FROM date)
Извлекает часть даты (год, месяц, день и т.д.).
*/
SELECT EXTRACT(YEAR FROM NOW()) AS CurrentYear;
SELECT id, ship_name, DATEDIFF(EXTRACT(DAY FROM shipped_date), EXTRACT(DAY FROM  order_date)) AS DATEDIFF
from orders;

SELECT EXTRACT(YEAR FROM NOW()) AS CurrentYear;
SELECT id, ship_name, EXTRACT(DAY FROM shipped_date), EXTRACT(DAY FROM  order_date)
from orders;

SELECT id, ship_name, DATEDIFF(EXTRACT(DAY FROM shipped_date), EXTRACT(DAY FROM  order_date))
from orders;
/*
Выведите день недели, когда был сделан каждый заказ из таблицы orders
*/
SELECT id, order_date, weekday(order_date), dayofweek(order_date), dayname(order_date)
from orders
where (weekday(order_date) < 5);
/*
Найдите количество дней до конца текущего года
*/
select '2025/12/31';
select '2025/12/31' - DATE_FORMAT(CURDATE(), '%y/%m/d%');
SELECT DATEDIFF('2025-12-31', CURDATE());
SELECT CURDATE();
SELECT DATEDIFF(weekday(2025, 12, 31), CURDATE());

-- 1. Выведите Ваш возраст на текущий день в секундах
-- TIME_TO_SEC();
-- TIME_TO_SEC(time)Returns the time argument, converted to seconds. Returns NULL if time is NULL.mysql> SELECT TIME_TO_SEC('22:23:00');
       --  -> 80580
select TIME_TO_SEC('00:39:38');
        -- -> 2378
SELECT 
    '1971-12-26 22:00:00' AS birthday
    , TIMESTAMPDIFF(SECOND,
        '1971-12-26 22:00:00',
        NOW()) AS seconds_diff_1
    , DATEDIFF(NOW(), '1971-12-26 22:00:00') * 24 * 60 * 60 
    - TIME_TO_SEC('1971-12-26 22:00:00') 
    + TIME_TO_SEC(CURTIME()) AS seconds_diff_2;
    
SELECT 
    '1977-04-05 05:00:00' AS birthday
    , TIMESTAMPDIFF(SECOND,
        '1977-04-05 05:00:00',
        NOW()) AS seconds_diff_1
    , DATEDIFF(NOW(), '1977-04-05 05:00:00') * 24 * 60 * 60 
    - TIME_TO_SEC('1977-04-05 05:00:00') 
    + TIME_TO_SEC(CURTIME()) AS seconds_diff_2;


SELECT 
    DATEDIFF(CONCAT(YEAR(CURDATE()), '-12-31'),
            CURDATE()) AS days_left
            
