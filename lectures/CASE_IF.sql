use hr;
SELECT 
    *
FROM
    employees
WHERE
    job_id = 'FI_ACCOUNT' AND salary < 8000;
    
SELECT *, 
CASE  
		WHEN salary <= 8000 THEN 'low'
		WHEN salary <= 17000 THEN 'mid'
        ELSE 'high'
END
FROM hr.employees;


SELECT 
    *,
    CASE
        WHEN salary <= 8000 THEN 'low'
        WHEN salary <= 17000 THEN 'mid'
        ELSE 'high'
    END AS 'status',
    salary * 1.1 AS salary_ind,
    salary AS salary_of_emp
FROM
    hr.employees;
    
use northwind;
/*
Составьте запрос чтобы: классифицировать товары таблицы products по их стоимости standard_cost, присваивая каждому из них категорию:
"Дорогой" от 50
"Средний" от 20 до 50 включая 50 
"Дешевый" до 20 включительно
*/ 

SELECT *, CASE
	WHEN standard_cost > 50 THEN 'hi'
	WHEN standard_cost > 20 THEN 'medium'
	ELSE 'low'
END AS status_cost
FROM products;
    
SELECT *,
CASE
	WHEN standard_cost > 50 THEN 'Дорогой'
	WHEN standard_cost > 20 AND standard_cost <= 50 THEN 'Средний'
ELSE 'Дешевый'
END AS 'категория'
FROM products;

/*
Предположим, что вы хотите предоставить разные скидки discount клиентам таблица customers в зависимости от их региона. 
Составьте для этого запрос. 
'WA', 'CA' - 5% скидка
'ID', 'OR' - 7% скидка
'UT', 'NV' - 13% скидка
Остальные - без скидки
*/
SELECT *,
CASE
WHEN state_province in ('WA', 'CA')  THEN 5
WHEN state_province in ('ID', 'OR')  THEN 7
WHEN state_province in ('UT', 'NV')  THEN 13
ELSE 0
END AS discount
FROM customers;

SELECT *
, CASE
WHEN state_province IN ('WA', 'CA') THEN 5
WHEN state_province IN ('ID', 'OR') THEN 7
WHEN state_province IN ('UT', 'NV') THEN 13
ELSE 0
END AS discount
FROM customers;

/*
Вы хотите установить статус для заказов таблица orders в зависимости от даты отправки shipped_date и даты заказа order_date. Составьте этот запрос.
Если нет данных в shipped_dateто статус 'Ожидание отправки', 
Если  shipped_date =  order_date, то 'Отправлено в день заказа'. 
В остальных случаях -'Отправлено'.
*/
SELECT id, shipped_date, order_date
, CASE
	WHEN shipped_date is null then 'Ожидание отправки'
    when shipped_date = order_date then 'Отправлено в день заказа'
ELSE 'Отправлено'
END AS shipped_status
FROM orders;

SELECT id, shipped_date, order_date,
CASE
 WHEN shipped_date IS NULL THEN 'Ожидание отправки'
WHEN shipped_date = order_date THEN 'Отправлено в день заказа'
ELSE 'Отправлено'
END AS 'Статус заказа'
FROM orders;


/*
Составьте запрос чтобы: выбрать полное имя состоящее из имени и фамилии.
Таблица employees.
*/
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees;
    
SELECT CONCAT_WS(' ', first_name, last_name) AS full_name
FROM employees;   
        
SELECT notes 
, COALESCE(notes, 'Not filled') as not_fill
FROM employees;
