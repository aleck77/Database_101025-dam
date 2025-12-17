/*Найти все заказы, сделанные клиентами из Лос-Анджелеса. Для начала нужно найти клиентов из этого города. Используем таблицу customers.*/
SELECT  id
FROM customers
WHERE city = 'Los Angelas';

SELECT  *
FROM orders
WHERE customer_id IN (3 , 19);
-- nested
 SELECT*
FROM orders
WHERE customer_id IN ( SELECT id FROM customers WHERE city = 'Los Angelas');
-- inner join
SELECT  *
FROM orders ord
JOIN customers cust
ON cust.id = ord.customer_id
WHERE city = 'Los Angelas'; 

/* Найти 10 продуктов, которые были заказаны больше всего, и узнать общую сумму заказов по этим продуктам. Вывести название продуктов из products, а так же общее количество заказов и сумму выручки из order_details. */
SELECT  product_id
       ,COUNT(product_id)          AS prod_cnt
       ,SUM(quantity * unit_price) AS total_revenue
FROM order_details
GROUP BY  1
ORDER BY  2 DESC;

SELECT  product_name
       ,prod_cnt
       ,total_revenue
FROM products pr
JOIN
(
	SELECT  product_id
	       ,COUNT(product_id)          AS prod_cnt
	       ,SUM(quantity * unit_price) AS total_revenue
	FROM order_details
	GROUP BY  1
) prod_sum
ON prod_sum.product_id = pr.id
ORDER BY 2 DESC
LIMIT 10;

SELECT  product_name
       ,prod_cnt
       ,total_revenue
FROM products pr
JOIN
(
	SELECT  product_id
	       ,COUNT(product_id)        AS prod_cnt
	       ,SUM(quantity*unit_price) AS total_revenue
	FROM order_details
	GROUP BY  1
	ORDER BY  2 DESC
	LIMIT 10
) AS prod_sum
ON prod_sum.product_id = pr.id
ORDER BY 2 DESC, 3 DESC; 

/* Вывести всю информацию из order_details, где стоимость выше средней. Найти среднюю цену - это одна конкретная цифра. Сравнить столбец unit_price таблицы order_details с найденным значением. */
SELECT  AVG(unit_price)
FROM order_details;

SELECT  *
FROM order_details
WHERE unit_price > (
SELECT  AVG(unit_price)
FROM order_details);

/* Найти все заказы таблица orders оформленных сотрудниками employee_id, в контактах которых таблица employees указан Sales Representative. */
SELECT  id
FROM employees
WHERE job_title = 'Sales Representative';

SELECT  *
FROM orders
WHERE employee_id IN ( SELECT id FROM employees WHERE job_title = 'Sales Representative'); 

/* Найти 10 продуктов, которые были заказаны больше всего, и узнать общую сумму заказов по этим продуктам (то есть продукты с наибольшим количеством заказов и их суммарную стоимость). */
SELECT  product_id
       ,COUNT(product_id)          AS prod_cnt
       ,SUM(quantity * unit_price) AS total_revenue
FROM order_details
GROUP BY  1
ORDER BY  2 DESC;

SELECT  product_name
       ,prod_cnt
       ,total_revenue
FROM products pr
JOIN
(
	SELECT  product_id
	       ,COUNT(product_id)          AS prod_cnt
	       ,SUM(quantity * unit_price) AS total_revenue
	FROM order_details
	GROUP BY  1
	ORDER BY  2 DESC
	LIMIT 10
) prod_sum
ON prod_sum.product_id = pr.id
ORDER BY 2 DESC, 3 DESC;
-- Natalia R
WITH ord_d AS
(
	SELECT  product_id
	       ,COUNT(*)                 AS cnt
	       ,SUM(quantity*unit_price) AS sum
	FROM order_details
	GROUP BY  product_id
)
SELECT  prod.product_name
       ,ord_d.cnt
       ,ord_d.sum
FROM ord_d
JOIN products AS prod
ON ord_d.product_id = prod.id
ORDER BY 2 DESC, 3 DESC
LIMIT 10;
-- ich
WITH prod_sum AS
(
	SELECT  product_id
	       ,COUNT(*)                 AS prod_cnt
	       ,SUM(quantity*unit_price) AS total_revenue
	FROM order_details
	GROUP BY  1
	ORDER BY  2 DESC
	         ,3 DESC
	LIMIT 10
)
SELECT  pr.product_name
       ,prod_sum.prod_cnt
       ,prod_sum.total_revenue
FROM products pr
JOIN prod_sum
ON prod_sum.product_id = pr.id
ORDER BY 2 DESC;

-- Выбрать все строки из таблицы order_details где unit_price больше среднего.
WITH avg_price AS
(
	SELECT  AVG(unit_price) AS up
	FROM order_details
)
SELECT  *
FROM order_details
WHERE unit_price > (
SELECT  up
FROM avg_price);

-- Выбрать все строки из таблицы order_details где unit_price больше среднего и меньше среднего, умноженного на 1, 5.
WITH avg_price AS
(
	SELECT  AVG(unit_price) AS up
	FROM order_details
)
SELECT  *
FROM order_details
WHERE unit_price > (
SELECT  up
FROM avg_price) AND unit_price < (
SELECT  up * 1.5
FROM avg_price); 

/*Найти все заказы таблица orders оформленных сотрудниками employee_id, в контактах которых таблица employees указан Sales Representative (столбец job_title).*/
-- nested
SELECT  id
FROM employees
WHERE job_title = 'Sales Representative';

SELECT  *
FROM orders
WHERE employee_id IN (
SELECT  id
FROM employees
WHERE job_title = 'Sales Representative'); 

-- cte
WITH sr AS
(
	SELECT  id
	FROM employees
	WHERE job_title = 'Sales Representative'
)
SELECT  *
FROM orders
WHERE employee_id IN ( SELECT id FROM sr); 

/* У каких сотрудников в таблице employees нет привилегий таблица employee_privileges. Выведите идентификатор, имя и фамилию. Выполните задание тремя способами - с помощью left join, подзапроса и сte. */
-- nested
SELECT  *
FROM employee_privileges; -- 2, 5

SELECT  id
       ,last_name
       ,first_name
FROM employees
WHERE id NOT IN (2, 5);

SELECT  id
       ,last_name
       ,first_name
FROM employees emp
WHERE emp.id NOT IN ( SELECT employee_id FROM employee_privileges);
-- left join
SELECT  id
       ,last_name
       ,first_name
FROM employees emp
LEFT JOIN employee_privileges
ON emp.id = employee_id
WHERE privilege_id IS NULL;
-- cte 
 WITH ep AS
(
	SELECT  employee_id
	FROM employee_privileges
)
SELECT  id
       ,last_name
       ,first_name
FROM employees
WHERE id NOT IN ( SELECT employee_id FROM ep); 

/*Выберите только тех сотрудников из таблицы employees, имя которых содержит английскую букву 'e' или их job_title = Sales Representative. Из заказов orders выберите заказы в которых город отправки ship_city = Las Vegas. Проверьте, отправляли ли найденные сотрудники заказы в Las Vegas. Решите задачу с помощью подзапросов и cte.*/
-- подзапросов
SELECT  id
FROM employees
WHERE first_name LIKE '%e%' or job_title = 'Sales Representative';

SELECT  *
FROM orders
WHERE ship_city = 'Las Vegas'
AND employee_id IN ( SELECT id FROM employees WHERE first_name LIKE '%e%' OR job_title = 'Sales Representative');

-- cte 1 
WITH lv AS
(
	SELECT  distinct employee_id
	FROM orders
	WHERE ship_city = 'Las Vegas'
)
SELECT  id
FROM employees
WHERE (first_name LIKE '%e%' OR job_title = 'Sales Representative')
AND id IN ( SELECT employee_id FROM lv);

-- cte 2 
WITH emp AS
(
	SELECT  id
	FROM employees
	WHERE first_name LIKE '%e%' OR job_title = 'Sales Representative' 
)
SELECT  employee_id
FROM orders
WHERE ship_city = 'Las Vegas'
AND employee_id IN ( SELECT id FROM emp);

-- Вывести имя и фамилию сотрудников, id заказов и город доставки для условий из задачи.
-- 1
SELECT  first_name
       ,last_name
       ,ord.id
       ,ord.ship_city
FROM employees emp
JOIN orders ord
ON ord.employee_id = emp.id
WHERE (first_name LIKE '%e%' OR job_title = 'Sales Representative')
AND ord.ship_city = 'Las Vegas';
-- 2
SELECT  first_name
       ,last_name
       ,ord.id
       ,ord.ship_city
FROM employees emp
JOIN orders ord
ON ord.employee_id = emp.id AND (first_name LIKE '%e%' OR job_title = 'Sales Representative') AND ord.ship_city = 'Las Vegas'; 

/* Выберите клиентов из компаний A, B, C, D, F. Проверьте, делали ли они заказы orders, используя перевозчика shipper_id = 3. 
Выведите имя клиента и наименование перевозчика company из таблицы shippers. Решить задачу тремя способами - с помощью JOIN, подзапросов и временных */
WITH tc AS
(
	SELECT  id
	       ,first_name
	FROM customers
	WHERE company IN ('Company A', 'Company B', 'Company C', 'Company D', 'Company F')
)
SELECT  ship.company
       ,tc.first_name
FROM orders
JOIN tc
ON tc.id = orders.customer_id AND shipper_id = 3
LEFT JOIN shippers ship
ON ship.id = orders.shipper_id; #where customer_id IN ( SELECT id FROM tc);

SELECT  tc.id
       ,tc.first_name
       ,ship.company
FROM customers tc
JOIN orders ord
ON tc.id = ord.customer_id AND shipper_id = 3 AND tc.company IN ('Company A', 'Company B', 'Company C', 'Company D', 'Company F')
JOIN shippers ship
ON ship.id = ord.shipper_id;
-- подзапросы
-- 1
SELECT  id
       ,first_name
       ,last_name
FROM customers
WHERE company IN ('Company A', 'Company B', 'Company C', 'Company D', 'Company F');
--2 
SELECT  customer_id
       ,shipper_id
FROM orders
WHERE shipper_id = 3;
-- финальный запрос с подзапросом во FROM и JOIN
SELECT  tc.id
       ,tc.first_name
       ,tc.last_name
       ,ship.company
FROM
(
	SELECT  customer_id
	       ,shipper_id
	FROM orders
	WHERE shipper_id = 3
) AS ord
JOIN
(
	SELECT  id
	       ,first_name
	       ,last_name
	FROM customers
	WHERE company IN ('Company A', 'Company B', 'Company C', 'Company D', 'Company F') 
) AS tc
ON tc.id = ord.customer_id
JOIN shippers ship
ON ship.id = ord.shipper_id;

SELECT  cus.id
       ,cus.first_name
       ,cus.last_name
       ,sh.company
FROM
(
	SELECT  customer_id
	       ,shipper_id
	FROM orders
	WHERE shipper_id = 3
) AS ord
JOIN
(
	SELECT  first_name
	       ,last_name
	       ,id
	FROM customers
	WHERE company IN ('Company A', 'Company B', 'Company C', 'Company D', 'Company F') 
) AS cus
ON cus.id = ord.customer_id
JOIN shippers AS sh
ON sh.id = ord.shipper_id; 

/*Найти имя и фамилию сотрудника с самой высокой зарплатой.*/
SELECT  first_name
       ,last_name
       ,salary
FROM employees
WHERE salary = (
SELECT  MAX(salary)
FROM employees);

-- Найти сотрудников, у которых зарплата меньше средней зарплаты по компании.
SELECT  first_name
       ,last_name
       ,salary
FROM employees
WHERE salary < (
SELECT  AVG(salary)
FROM employees);

SELECT  first_name
       ,last_name
       ,salary
FROM employees
WHERE salary < (
SELECT  AVG(salary)
FROM employees);
-- Найти имена и фамилии сотрудников с максимальной зарплатой в каждом департаменте HR.EMPLOYEES
USE hr;
SELECT  department_id
       ,MAX(salary) AS ms
FROM employees
GROUP BY  department_id
ORDER BY  department_id;

SELECT  emp.department_id
       ,first_name
       ,last_name
       ,salary
FROM employees emp
JOIN
(
	SELECT  MAX(salary) AS ms
	       ,department_id
	FROM employees
	GROUP BY  department_id
) AS max_sal
ON emp.department_id = max_sal.department_id AND emp.salary = ms
ORDER BY department_id;

SELECT  department_id
       ,first_name
       ,last_name
       ,salary
FROM employees
WHERE (department_id, salary) IN ( SELECT department_id, MAX(salary) FROM employees GROUP BY department_id)
ORDER BY department_id;

SELECT  emp.department_id
       ,first_name
       ,last_name
       ,salary
FROM employees emp
JOIN
(
	SELECT  department_id
	       ,MAX(salary) AS ms
	FROM employees
	GROUP BY  department_id
) AS max_sal
ON emp.department_id = max_sal.department_id AND emp.salary = ms
ORDER BY department_id;