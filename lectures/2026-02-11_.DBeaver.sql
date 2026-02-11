SELECT *
FROM order_details od;

-- Откройте SQL-консоль, выбрав ваше подключение и щелкнув правой кнопкой мыши SQL Editor > New SQL Script.
-- Введите SQL-запрос, например:
-- SELECT * FROM customers;
-- Нажмите Execute SQL Statement (или используйте Ctrl+Enter), чтобы выполнить запрос.
-- Результаты запроса отобразятся в нижней части экрана.

SELECT *
FROM customers c;

-- Соедините таблицу purchase_orders по всем внешним ключам к другим таблицам.

SELECT *
FROM  purchase_orders po 
LEFT JOIN purchase_order_status pos ON po.status_id = pos.id
LEFT JOIN suppliers s ON po.supplier_id = s.id 
LEFT JOIN employees e ON po.created_by = e.id 
LEFT JOIN purchase_order_details pod ON po.id = pod.purchase_order_id 
LEFT JOIN inventory_transactions it ON po.id = it.purchase_order_id;

-- Выгрузка в виде csv файлов - выбираем "экспорт данных" внизу открытой после выполнения запроса таблице

-- Работа с базой данных world
-- Посмотрите ER диаграмму.
-- Соедините таблицу country cо всеми возможными таблицами по внешним ключам.
-- Выгрузите полученные данные в csv файл и экспортируйте его в Google Sheets.

SELECT *
FROM country c 
LEFT JOIN city c2 ON c.Code = c2.CountryCode 
LEFT JOIN countrylanguage c3 ON c.Code = c3.CountryCode;




