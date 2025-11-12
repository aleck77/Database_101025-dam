/*
Создайте таблицу products со следующими столбцами и ограничениями:
product_id — тип INT, автоинкремент, первичный ключ.
product_name — тип VARCHAR(100), не может быть пустым.
category — тип VARCHAR(50), значение по умолчанию — 'General'.
price — тип DECIMAL(8, 2), не может быть отрицательным, добавьте ограничение CHECK (price >= 0).
stock_quantity — тип INT, не может быть отрицательным.
supplier_id — тип INT, может быть NULL, указывает на поставщика продукта.
2) Заполните таблицу products 5 строками данных.
3) Измените значение в таблице, например, уменьшите количество на складе для продукта с product_id = 1
4) Создайте представление product_overview, которое будет содержать следующие данные:
product_name — название продукта.
category — категория продукта.
stock_value — расчетная стоимость запасов (произведение price и stock_quantity).
stock_status — строка "Low Stock", если stock_quantity меньше 20, и "In Stock" в противном случае.
5) Вам необходима таблица с данными о мониторинге основных показателей здоровья. 
Подумайте какие столбцы и с какими ограничениями вы будете использовать. Создайте такую таблицу и заполните ее тремя тестовыми строками. 
Обсудите результаты с коллегами.
*/
create table products
(
product_id int primary key auto_increment,
product_name varchar(100) NOT NULL,
category varchar(50) DEFAULT ('General'),
price DECIMAL(8, 2) CHECK (price >= 0),
stock_quantity INT NOT NULL,
supplier_id INT
);
update products
set stock_quantity = stock_quantity * 0.8
where product_id = 1;


INSERT INTO products(product_name, category, price, stock_quantity, supplier_id)
VALUES 
('Apple', 'Fruit', 2.2, 100, 1),
('Banana', 'Fruit', 3.2, 200, 1),
('Potato', 'Vegetables', 1.2, 500, 1),
('Carrot', 'Vegetables', 2.5, 150, 1),
('Bluberry', 'Berries', 5.2, 80, 3);

UPDATE products 
SET  stock_quantity = stock_quantity - 20
WHERE product_id = 1;

CREATE VIEW product_overview AS

SELECT product_name, category, price*stock_quantity AS stock_value,
case
when stock_quantity < 20 then 'Low Stock'
else 'In Stock'
end as stock_status
FROM products
;
create table heals_monitor
(
id int primary key auto_increment,
name varchar(100) NOT NULL,
category varchar(50) DEFAULT ('General'),
price DECIMAL(8, 2) CHECK (price >= 0),
stock_quantity INT NOT NULL,
supplier_id INT
);