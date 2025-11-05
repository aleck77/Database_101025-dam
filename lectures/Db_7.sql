CREATE DATABASE `northwind` /*!40100 DEFAULT CHARACTER SET latin1 */ /*!80016 DEFAULT ENCRYPTION='N' */;

CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `shipped_date` datetime DEFAULT NULL,
  `shipper_id` int DEFAULT NULL,
  `ship_name` varchar(50) DEFAULT NULL,
  `ship_address` longtext,
  `ship_city` varchar(50) DEFAULT NULL,
  `ship_state_province` varchar(50) DEFAULT NULL,
  `ship_zip_postal_code` varchar(50) DEFAULT NULL,
  `ship_country_region` varchar(50) DEFAULT NULL,
  `shipping_fee` decimal(19,4) DEFAULT '0.0000',
  `taxes` decimal(19,4) DEFAULT '0.0000',
  `payment_type` varchar(50) DEFAULT NULL,
  `paid_date` datetime DEFAULT NULL,
  `notes` longtext,
  `tax_rate` double DEFAULT '0',
  `tax_status_id` tinyint DEFAULT NULL,
  `status_id` tinyint DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `customer_id_2` (`customer_id`),
  KEY `employee_id` (`employee_id`),
  KEY `employee_id_2` (`employee_id`),
  KEY `id` (`id`),
  KEY `id_2` (`id`),
  KEY `shipper_id` (`shipper_id`),
  KEY `shipper_id_2` (`shipper_id`),
  KEY `id_3` (`id`),
  KEY `tax_status` (`tax_status_id`),
  KEY `ship_zip_postal_code` (`ship_zip_postal_code`),
  KEY `fk_orders_orders_status1` (`status_id`),
  CONSTRAINT `fk_orders_customers` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `fk_orders_employees1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_orders_orders_status1` FOREIGN KEY (`status_id`) REFERENCES `orders_status` (`id`),
  CONSTRAINT `fk_orders_orders_tax_status1` FOREIGN KEY (`tax_status_id`) REFERENCES `orders_tax_status` (`id`),
  CONSTRAINT `fk_orders_shippers1` FOREIGN KEY (`shipper_id`) REFERENCES `shippers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `email_address` varchar(50) DEFAULT NULL,
  `job_title` varchar(50) DEFAULT NULL,
  `business_phone` varchar(25) DEFAULT NULL,
  `home_phone` varchar(25) DEFAULT NULL,
  `mobile_phone` varchar(25) DEFAULT NULL,
  `fax_number` varchar(25) DEFAULT NULL,
  `address` longtext,
  `city` varchar(50) DEFAULT NULL,
  `state_province` varchar(50) DEFAULT NULL,
  `zip_postal_code` varchar(15) DEFAULT NULL,
  `country_region` varchar(50) DEFAULT NULL,
  `web_page` longtext,
  `notes` longtext,
  `attachments` longblob,
  PRIMARY KEY (`id`),
  KEY `city` (`city`),
  KEY `company` (`company`),
  KEY `first_name` (`first_name`),
  KEY `last_name` (`last_name`),
  KEY `zip_postal_code` (`zip_postal_code`),
  KEY `state_province` (`state_province`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3;

use northwind;

select *
from inventory_transactions;

CREATE TABLE `inventory_transactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `transaction_type` tinyint NOT NULL,
  `transaction_created_date` datetime DEFAULT NULL,
  `transaction_modified_date` datetime DEFAULT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `purchase_order_id` int DEFAULT NULL,
  `customer_order_id` int DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_order_id` (`customer_order_id`),
  KEY `customer_order_id_2` (`customer_order_id`),
  KEY `product_id` (`product_id`),
  KEY `product_id_2` (`product_id`),
  KEY `purchase_order_id` (`purchase_order_id`),
  KEY `purchase_order_id_2` (`purchase_order_id`),
  KEY `transaction_type` (`transaction_type`),
  CONSTRAINT `fk_inventory_transactions_inventory_transaction_types1` FOREIGN KEY (`transaction_type`) REFERENCES `inventory_transaction_types` (`id`),
  CONSTRAINT `fk_inventory_transactions_orders1` FOREIGN KEY (`customer_order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `fk_inventory_transactions_products1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `fk_inventory_transactions_purchase_orders1` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb3;

select *
from privileges;

CREATE TABLE `privileges` (
  `id` int NOT NULL AUTO_INCREMENT,
  `privilege_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

select order_id, quantity, unit_price, discount, quantity * unit_price - quantity * unit_price * discount  as total_income
from order_details;

SELECT 
    order_id,
    (quantity * unit_price)*(1 - discount) AS net_price
FROM
    order_details;
    
SELECT id, order_id, quantity, unit_price, discount, 
quantity * unit_price AS total_price,
quantity * unit_price * discount AS total_discount,
quantity * unit_price - quantity * unit_price * discount AS total_income
FROM northwind.order_details;

CREATE TABLE `order_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `unit_price` decimal(19,4) DEFAULT '0.0000',
  `discount` double NOT NULL DEFAULT '0',
  `status_id` int DEFAULT NULL,
  `date_allocated` datetime DEFAULT NULL,
  `purchase_order_id` int DEFAULT NULL,
  `inventory_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `inventory_id` (`inventory_id`),
  KEY `id_2` (`id`),
  KEY `id_3` (`id`),
  KEY `id_4` (`id`),
  KEY `product_id` (`product_id`),
  KEY `product_id_2` (`product_id`),
  KEY `purchase_order_id` (`purchase_order_id`),
  KEY `id_5` (`id`),
  KEY `fk_order_details_orders1_idx` (`order_id`),
  KEY `fk_order_details_order_details_status1_idx` (`status_id`),
  CONSTRAINT `fk_order_details_order_details_status1` FOREIGN KEY (`status_id`) REFERENCES `order_details_status` (`id`),
  CONSTRAINT `fk_order_details_orders1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `fk_order_details_products1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb3;

/* CAST(expression AS target_data_type)

SELECT CAST('123' AS SIGNED) AS Number;
SELECT CAST(OrderDate AS CHAR) AS OrderDateString
FROM Orders
*/

SELECT '100' + 50 AS Result;

/*
Когда вы объединяете строку с числом,
число автоматически преобразуется в
строку.
*/

SELECT CONCAT('The total amount is
', 150) AS Message;
/*
Когда вы сравниваете строку и число, строка
автоматически преобразуется в число.
*/

SELECT * FROM products WHERE
unit_in_stock = '50';
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
            
