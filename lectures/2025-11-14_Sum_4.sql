alter table Employees2
MODIFY COLUMN EmployeeID INT AUTO_INCREMENT PRIMARY KEY;

CREATE TABLE Sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    sale_date DATETIME NOT NULL,
    amount DECIMAL(10 , 2 ),
    quantity INT,
    discount DECIMAL(2 , 2 ),
    category VARCHAR(50)
);

INSERT INTO Sales (product_name, sale_date, amount, quantity, discount, category)
VALUES 
('Ноутбук Lenovo', '2024-01-15', 50000.00, 1, 0.10, 'Электроника'),
('Мышь беспроводная', '2024-01-20', 2500.00, 2, 0.05, 'Электроника'),
('Книга "SQL для начинающих"', '2024-02-05', 1500.00, 1, 0, 'Книги'),
('Кофеварка', '2024-02-10', 120000.50, 1, 0.15, 'Бытовая техника'),
('Чайник', '2024-02-28', 5000.00, 1, 0.20, 'Бытовая техника'),
('Наушники Sony', '15-03-2026', 15000.00, 1, 0.10, 'Электроника'),
('Флешка 32GB', '2024-03-20', 1200.00, 3, 0, 'Электроника'),
('Смартфон Xiaomi', '2024-04-01 12:12:00', 35000.00, 1, 0.12, 'Электроника');
/*
1) Изменить тип данных столбца quantity на DECIMAL
2) Сделать столбец discount обязательным для заполнения
3) Увеличить максимальную длину названия товара
4) Переименовать столбец discount на discount_rate
5) Переименовать таблицу Sales в ProductSales
6) Добавьте в таблицу столбец currency (по умолчанию доллары)
7) Обновите значение currency у товаров с суммой больше 10000 или количеством больше 2 на RUB
8) Удалите столбец currency
*/
alter table Sales
MODIFY COLUMN quantity DECIMAL;

alter table Sales
MODIFY COLUMN discount DECIMAL(4,2) not null default 0.05;

alter table Sales
MODIFY COLUMN product_name VARCHAR(200) NOT NULL;

alter table Sales
rename column discount TO discount_rate;

rename table Sales TO ProductSales;

alter table ProductSales
add column currency CHAR(3) default 'USD';

SET SQL_SAFE_UPDATES = 0;

update ProductSales
set currency = 'RUB'
where amount > 10000 or quantity > 2;

alter table ProductSales
drop column currency;

describe ProductSales;

describe products;

/*Посчитать количество покупок, сделанных в понедельник*/

SELECT *, DAYNAME(sale_date)
FROM ProductSales
WHERE DAYNAME(sale_date) = 'Monday';

CREATE TABLE `ProductSales` (
  `sale_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(200) NOT NULL,
  `sale_date` datetime NOT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `quantity` decimal(10,0) DEFAULT NULL,
  `discount_rate` decimal(4,2) NOT NULL DEFAULT '0.05',
  `category` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`sale_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*
Создайте новый столбец - примените сезонные коэффициенты к ценам товаров:
Зимой (декабрь-февраль) - скидка 15%
Весной (март-май) - скидка 10%
Летом (июнь-август) - без скидки
Осенью (сентябрь-ноябрь) - скидка 5%
И столбец - цена умноженная на текущую скидку
*/

SELECT 
    *,
    (1-discount_rate) * amount,
    CASE
        WHEN EXTRACT(MONTH FROM sale_date) IN (1 , 2, 12) THEN (1 - 0.15) * amount
        WHEN EXTRACT(MONTH FROM sale_date) IN (3 , 4, 5) THEN (1 - 0.10) * amount
        WHEN EXTRACT(MONTH FROM sale_date) IN (9 , 10, 11) THEN (1 - 0.05) * amount
        ELSE amount
    END AS season
FROM
    ProductSales;

/*
Сколько товаров было продано в текущем месяце и летом 2025 года
*/
SELECT * 
FROM ProductSales
WHERE YEAR(sale_date) = YEAR(CURDATE()) and MONTH(sale_date) = MONTH(CURDATE()) 
or YEAR(sale_date) = 2025 and (MONTH(sale_date) < 9 or MONTH(sale_date) > 5);

SELECT *
FROM ProductSales
WHERE MONTH(sale_date) IN (6,7,8) OR MONTH(CURDATE());
