/*Найти все заказы, сделанные клиентами из Лос-Анджелеса.
Для начала нужно найти клиентов из этого города. Используем таблицу customers.*/
SELECT id
FROM customers
WHERE city = 'Los Angelas';
SELECT *
FROM orders
WHERE customer_id IN (3 , 19);

SELECT*
FROM orders
WHERE customer_id IN (SELECT id
FROM customers
WHERE city = 'Los Angelas');

SELECT *
FROM orders ord
JOIN customers cust ON cust.id = ord.customer_id
WHERE city = 'Los Angelas';
/*
Найти 10 продуктов, которые были заказаны больше всего, и узнать общую сумму заказов  по этим продуктам.
Вывести название продуктов из products, а так же общее количество заказов и сумму выручки из order_details.
*/
SELECT product_id, COUNT(product_id) AS prod_cnt, SUM(quantity * unit_price) AS total_revenue
FROM order_details
GROUP BY 1
ORDER BY 2 DESC;

SELECT product_name, prod_cnt, total_revenue
FROM products pr
JOIN (SELECT product_id, COUNT(product_id) AS prod_cnt, SUM(quantity * unit_price) AS total_revenue
FROM order_details
GROUP BY 1) prod_sum ON prod_sum.product_id = pr.id
ORDER BY 2 DESC
LIMIT 10;

SELECT product_name, prod_cnt, total_revenue
FROM products pr
JOIN (SELECT product_id, COUNT(product_id) AS prod_cnt, SUM(quantity*unit_price) AS total_revenue
FROM order_details
GROUP BY product_id) prod_sum ON prod_sum.product_id = pr.id
ORDER BY prod_cnt desc
LIMIT 10;

/*
Вывести всю информацию из order_details, где стоимость выше средней.
Найти среднюю цену - это одна конкретная цифра.
Сравнить столбец unit_price таблицы order_details с найденным значением.
*/
SELECT AVG(unit_price)
FROM order_details;

SELECT *
FROM order_details
WHERE unit_price > (SELECT AVG(unit_price) FROM order_details);
/*
Найти все заказы таблица orders оформленных сотрудниками employee_id, 
в контактах которых таблица employees указан Sales Representative.
*/
SELECT id
FROM employees
WHERE job_title = 'Sales Representative';

SELECT *
FROM orders
WHERE employee_id IN(SELECT id FROM employees WHERE job_title = 'Sales Representative');

/*
Найти 10 продуктов, которые были заказаны больше всего, и узнать общую сумму заказов  по этим продуктам 
(то есть продукты с наибольшим количеством заказов и их суммарную стоимость).
*/
SELECT product_id, COUNT(product_id) AS prod_cnt, SUM(quantity * unit_price) AS total_revenue
FROM order_details
GROUP BY 1
ORDER BY 2 DESC;

SELECT product_name, prod_cnt, total_revenue
FROM products pr
JOIN 
	(SELECT product_id, COUNT(product_id) AS prod_cnt, SUM(quantity * unit_price) AS total_revenue
	FROM order_details
	GROUP BY 1) prod_sum 
ON prod_sum.product_id = pr.id
ORDER BY 2 DESC
LIMIT 10;
-- Natalia R
WITH ord_d AS 
	(SELECT product_id, count(*) AS cnt, sum(quantity*unit_price) AS sum
	FROM order_details 
	GROUP BY product_id)
SELECT prod.product_name, ord_d.cnt, ord_d.sum 
FROM ord_d
JOIN  products AS prod 
ON ord_d.product_id = prod.id
ORDER BY 2 desc, 3 desc
LIMIT 10;
-- ich

-- Выбрать все строки из таблицы order_details где unit_price больше среднего.

with avg_price as(SELECT AVG(unit_price) AS up FROM order_details)
select *
from order_details
where unit_price > (select up from avg_price);

SELECT AVG(unit_price)
FROM order_details;
SELECT *
FROM order_details
WHERE unit_price > (SELECT AVG(unit_price) FROM order_details);

-- Выбрать все строки из таблицы order_details где unit_price больше среднего и меньше среднего, умноженного на 1,5.
WITH avg_price AS(SELECT AVG(unit_price) AS up
FROM order_details)
SELECT *
FROM order_details
WHERE unit_price > (SELECT up FROM avg_price) AND unit_price < (SELECT up * 1.5 FROM avg_price);

/*Найти все заказы таблица orders оформленных сотрудниками employee_id, 
в контактах которых таблица employees указан Sales Representative (столбец job_title).*/
SELECT id
FROM employees
WHERE job_title = 'Sales Representative';
SELECT *
FROM orders
WHERE employee_id IN(SELECT id FROM employees WHERE job_title = 'Sales Representative');

WITH sr AS (
SELECT id 
FROM employees 
WHERE  job_title = 'Sales Representative')
SELECT *
FROM orders
WHERE employee_id IN (SELECT id FROM sr);

/*
У каких сотрудников в таблице employees нет привилегий таблица employee_privileges. 
Выведите идентификатор, имя и фамилию. Выполните задание тремя способами - с помощью left join, подзапроса и сte.
*/
-- sub
SELECT *
FROM employee_privileges;

SELECT id, first_name, last_name
FROM employees emp
WHERE emp.id NOT IN (
	SELECT employee_id 
    FROM employee_privileges
    );
-- cte
-- left join
SELECT id, first_name, last_name
FROM employees emp
LEFT JOIN employee_privileges emp_p ON emp_p.employee_id = emp.id
WHERE privilege_id IS NULL;
/*Выберите только тех сотрудников из таблицы employees,  имя которых содержит английскую букву 'e' или их job_title = Sales Representative. 
Из заказов orders выберите заказы в которых город отправки ship_city = Las Vegas. Проверьте, отправляли ли найденные сотрудники заказы в Las Vegas. 
Решите задачу с помощью подзапросов и cte.*/
-- подзапросов
SELECT id 
FROM employees
where first_name like '%e%' or job_title = 'Sales Representative';

SELECT *
FROM orders
WHERE ship_city = 'Las Vegas'
	AND employee_id IN (
    SELECT id
	FROM employees
	WHERE first_name LIKE '%e%' OR job_title = 'Sales Representative');
-- cte 1
WITH lv AS (SELECT distinct employee_id
FROM orders
WHERE ship_city = 'Las Vegas')
SELECT id
	FROM employees
	WHERE (first_name LIKE '%e%' OR job_title = 'Sales Representative') AND id IN (SELECT employee_id FROM lv);
-- cte 2
with emp as (select id from employees where first_name LIKE '%e%' OR job_title = 'Sales Representative')
select employee_id
from orders
where ship_city = 'Las Vegas'
and employee_id in (select id from emp);
-- cte 2 Irina
WITH lv AS (SELECT  id FROM employees WHERE first_name LIKE "%e%" OR job_title = 'Sales Representative')
SELECT employee_id
FROM orders
WHERE ship_city = 'Las Vegas'
AND  employee_id IN (SELECT id FROM lv);

-- Вывести имя и фамилию сотрудников, id заказов и город доставки для условий из задачи.
-- 1
SELECT first_name, last_name, ord.id, ord.ship_city
FROM employees emp
JOIN orders ord ON ord.employee_id = emp.id
WHERE (first_name LIKE '%e%' OR job_title = 'Sales Representative') AND ord.ship_city = 'Las Vegas';
-- 2
SELECT first_name, last_name, ord.id, ord.ship_city
FROM employees emp
JOIN orders ord ON ord.employee_id = emp.id
AND (first_name LIKE '%e%' OR job_title = 'Sales Representative')
AND ord.ship_city = 'Las Vegas';

/*
Выберите клиентов из компаний A, B, C, D, F.  Проверьте, делали ли они заказы orders, используя перевозчика shipper_id = 3. 
Выведите имя клиента и наименование перевозчика company из таблицы shippers. 
Решить задачу тремя способами - с помощью JOIN, подзапросов и временных 
*/
with tc as (
select id, first_name
from customers
where company in ('Company A', 'Company B', 'Company C', 'Company D', 'Company F'))

select ship.company, tc.first_name
from orders
join tc on tc.id = orders.customer_id and shipper_id = 3
left join shippers ship on  ship.id = orders.shipper_id;
#where customer_id in (select id from tc);

select tc.id, tc.first_name, ship.company
from customers tc
join orders ord on tc.id = ord.customer_id and shipper_id = 3
and tc.company in ('Company A', 'Company B', 'Company C', 'Company D', 'Company F')
join shippers ship on  ship.id = ord.shipper_id;

select tc.id, tc.first_name, tc.last_name
from customers tc
where tc.company in ('Company A', 'Company B', 'Company C', 'Company D', 'Company F');

select ord.customer_id, shipper_id
from orders ord
where shipper_id = 3;

select tc.id, tc.first_name, tc.last_name, tc.company
from (select customer_id, shipper_id
from orders ord where shipper_id = 3) AS ord
join (select tc.id, tc.first_name, tc.last_name from customers tc
where tc.company in ('Company A', 'Company B', 'Company C', 'Company D', 'Company F')
) as tc on tc.id = ord.customer_id
join shippers ship on  ship.id = ord.shipper_id;

SELECT cus.id
 , cus.first_name
 , cus.last_name
 , sh.company
 FROM ( SELECT  customer_id, shipper_id FROM orders WHERE shipper_id = 3) AS ord
 JOIN (SELECT first_name, last_name, id FROM customers
 WHERE company IN ('Company A', 'Company B', 'Company C', 'Company D', 'Company F')
 ) AS cus ON cus.id = ord.customer_id
 JOIN shippers AS sh ON sh.id = ord.shipper_id;
 
 /*Найти имя и фамилию сотрудника с самой высокой зарплатой.*/
 SELECT first_name, last_name, salary
FROM employees
WHERE salary = (SELECT MAX(salary)
FROM employees);

-- Найти сотрудников, у которых зарплата меньше средней зарплаты по компании.
SELECT first_name, last_name, salary
FROM employees
WHERE salary < (SELECT avg(salary) FROM employees);

SELECT first_name, last_name, salary
FROM employees
WHERE salary < (SELECT AVG(salary) FROM employees);

-- Найти имена и фамилии сотрудников с максимальной зарплатой в каждом департаменте HR.EMPLOYEES
SELECT department_id, max(salary) AS ms
FROM employees
group by department_id
order by department_id;

SELECT emp.department_id, first_name, last_name, salary
FROM employees emp
JOIN (SELECT MAX(salary) AS ms, department_id FROM employees GROUP BY department_id) AS max_sal 
ON emp.department_id = max_sal.department_id
AND emp.salary = ms
ORDER BY department_id;
        
SELECT department_id, first_name, last_name, salary
FROM employees
WHERE (department_id, salary) IN (SELECT department_id, max(salary) FROM employees GROUP BY department_id)
ORDER BY department_id;

SELECT emp.department_id, first_name, last_name, salary
FROM employees emp
JOIN (SELECT department_id, MAX(salary) AS ms FROM employees GROUP BY department_id
)  AS max_sal
ON emp.department_id = max_sal.department_id
AND emp.salary = ms
ORDER BY department_id; 