-- CREATE DATABASE `northwind` /*!40100 DEFAULT CHARACTER SET latin1 */ /*!80016 DEFAULT ENCRYPTION='N' */;
use northwind;
SHOW CREATE DATABASE northwind;
-- CREATE DATABASE `northwind` /*!40100 DEFAULT CHARACTER SET latin1 */ /*!80016 DEFAULT ENCRYPTION='N' */;
/* CREATE TABLE `orders` (
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
*/

/*
1. Из таблицы inventory_transactions вывести столбец quantity, а также рассчитанный на его основе столбец  category,  
который принимает значения 'Almost finish', 
если quantity меньше  20 и 'Enought', 
если quantity больше либо равно 20. Решить задачу с помощью IF и CASE.
*/

SELECT quantity,
    CASE
        WHEN quantity < 20 THEN 'Almost finish'
        ELSE 'Enought'
    END AS category
FROM inventory_transactions;

/**/
SELECT quantity,
    IF(quantity < 20,
        'Almost finish',
        'Enought') AS category
FROM inventory_transactions;

/*
2. Из таблицы purchase_order_details вывести все строки, где purchase_order_id
изменяется от 90 до 100 включительно. Добавить столбец с категорией по
количеству Если quantity меньше 30 то 'small', от 30 до 70 включительно - 'medium', в
остальных случаях 'large'.
*/
SELECT *,
CASE 
	WHEN quantity < 30 THEN 'small'
	WHEN quantity BETWEEN 30 and 70 THEN 'medium'
	ELSE 'large'
END as category
FROM purchase_order_details
WHERE purchase_order_id BETWEEN 90 AND 100;

SELECT *,
CASE 
	WHEN quantity < 30 THEN 'small'
	WHEN quantity <= 70 THEN 'medium'
	ELSE 'large'
END as category
FROM purchase_order_details
WHERE purchase_order_id BETWEEN 90 AND 100;

SELECT *,
    IF(quantity < 30,
        'small',
        IF(quantity BETWEEN 30 AND 70,
            'medium',
            'large')) AS category
FROM purchase_order_details
WHERE purchase_order_id BETWEEN 90 AND 100;

SELECT *,
    IF(quantity < 30,
        'small',
        IF(quantity <= 70, 'medium', 'large')) AS category
FROM purchase_order_details
WHERE purchase_order_id BETWEEN 90 AND 100
ORDER BY category , quantity DESC;

/*
4. Вывести уникальные значения purchase_order_id для строк где unit_cost больше 10. 
Отсортировать данные по убыванию выводимого столбца. Таблица purchase_order_details.
*/
SELECT DISTINCT purchase_order_id
FROM purchase_order_details
WHERE unit_cost > 10
ORDER BY purchase_order_id DESC;

/*
5. Вывести пять строк начиная со второй из customers, где job_title равно 'Owner'. Отсортировать строки в
алфавитном порядке по state_province.
*/
SELECT *
FROM customers
WHERE job_title = 'Owner'
ORDER BY state_province
LIMIT 1 , 5;

/*
6. Выбрать уникальные id продуктов из таблицы order_details в 
том случае, если суммарная стоимость
продукта quantity*unit_price превышает 200 
отсортировать столбец по возрастанию и выбрать 7 строк.
*/

SELECT DISTINCT  product_id
FROM order_details
WHERE quantity * unit_price > 200
ORDER BY product_id
LIMIT 7;

/*
7. Вывести инициалы - первую букву имени 
и первую букву фамилии сотрудника из таблицы employees.
*/
SELECT CONCAT(LEFT(first_name, 1), '.', LEFT(last_name, 1), '.') AS init
FROM employees;

SELECT concat(LEFT(last_name, 1), '.', LEFT(first_name, 1), '.') 
AS initials
FROM employees;

/*
8. Вывести все строки и вычисляемый столбец - если payment_type не указан,
то 'No data' в остальных случаях значение столбца payment_type из 
таблицы orders.
Решить задачу с помощью IF и CASE.
*/
# 1
SELECT *,
    CASE
        WHEN payment_type IS NULL THEN 'No data'
        ELSE payment_type
    END AS payment
FROM orders;

# 2
SELECT *,
    IF(payment_type IS NULL,
        'No data',
        payment_type) AS payment
FROM orders;

# 3
SELECT payment_type 
, COALESCE(payment_type, 'No data') as payment
FROM orders;

SELECT payment_type,
IFNULL(payment_type,'No data') as payment
FROM orders;

/*
9. Вывести имя и фамилию клиентов из таблицы customers в верхнем регистре
*/
SELECT UPPER(first_name), UPPER(last_name)
FROM customers;

SELECT UPPER(CONCAT(first_name, ' ', last_name)) AS first_last
FROM customers;

SELECT CONCAT_WS(' ', UPPER(first_name), UPPER(last_name)) AS first_last
FROM customers;

SELECT UPPER(CONCAT_WS(' ', first_name, last_name)) AS full_name
FROM customers;
/*
10. Выбрать три цифры после кода из business_phone таблицы employees. Кодом
считаем первые три цифры в скобках.
*/
SELECT SUBSTRING(business_phone, 2, 3) AS first_3
FROM employees;

SELECT business_phone
, substr(business_phone, 2, 3)
, right(left(business_phone, 4), 3) 
FROM employees;

/*
Из таблицы employees вывести email таким образом, чтобы он начинался с большой буквы, а все остальные строчными.
*/
SELECT email_address, 
SUBSTRING(email_address) AS email_1
FROM employees;

select email_address, concat(upper(left(email_address, 1)), lower(email_address)) AS email_1
FROM employees;

select email_address, concat(upper(left(email_address, 1)), lower(substr(email_address, 2))) AS email_1
FROM employees;

select email_address, concat(upper(left(email_address, 1)), lower(right(email_address, lenght(email_address) - 1))) AS email_1
FROM employees;

SELECT CONCAT(UPPER(LEFT(email_address, 1)),LOWER(RIGHT(email_address,LENGTH(email_address)-1))) AS new_email
FROM employees;

/*
Выберите все строки из таблицы  products для которых product_code содержит 'NWTSO' и стандартная себестоимость standard_cost равна 1, либо минимальная цена list_price меньше 5 и target_level = 40.
*/

SELECT *
FROM products
WHERE product_code LIKE '%NWTSO%'
        AND standard_cost = 1
        OR list_price < 5 AND target_level = 40;

SELECT *
FROM products
WHERE (product_code LIKE '%NWTSO%'
        AND standard_cost = 1)
        OR (list_price < 5 AND target_level = 40);

/*
Вывести все заказы у поставщика shipper_id 3, 
для которого необходимо пересчитать стоимость доставки и увеличить 
на 10% для штатов OR, NY, 
на 15% для штатов FL и TN, 
а для остальных оставить без изменений. 
Результат отсортировать по новому столбцу shipping fee. 
Вывести дату заказа, стоимость доставки, адрес и штат.
*/
select shipped_date,
case 
when ship_state_province in ('OR', 'NY') then shipping_fee * 1.1
when ship_state_province in ('FL', 'TN') then shipping_fee * 1.15
else shipping_fee
end as new_shipping_fee, ship_address, ship_state_province
from orders
where shipper_id = 3
order by new_shipping_fee;

SELECT 
    shipped_date,
    CASE
        WHEN ship_state_province IN ('OR' , 'NY') THEN shipping_fee * 1.1
        WHEN ship_state_province IN ('FL' , 'TN') THEN shipping_fee * 1.15
        ELSE shipping_fee
    END AS new_shipping_fee,
    ship_address,
    ship_state_province
FROM
    orders
WHERE
    shipper_id = 3
ORDER BY new_shipping_fee;

SELECT 
    order_date,
    CASE 
        WHEN ship_state_province IN ('OR', 'NY') THEN shipping_fee * 1.10
        WHEN ship_state_province IN ('FL', 'TN') THEN shipping_fee * 1.15
        ELSE shipping_fee
    END AS shipping_fee,
    ship_address,
    ship_state_province
FROM orders
WHERE shipper_id = 3
ORDER BY shipping_fee;

SELECT order_date,
    CASE
        WHEN ship_state_province IN ('OR' , 'NY') THEN shipping_fee * 1.1
        WHEN ship_state_province IN ('FL' , 'TN') THEN shipping_fee * 1.15
        ELSE shipping_fee
    END AS new_shipping_fee, ship_address, ship_state_province
FROM orders
WHERE shipper_id = 3
ORDER BY new_shipping_fee;
