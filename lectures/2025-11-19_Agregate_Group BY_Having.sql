SELECT COUNT(id), company, job_title
FROM employees
WHERE job_title <> 'Sales Manager'
-- WHERE COUNT(id) > 5 error
GROUP BY company, job_title
HAVING COUNT(id) > 5 ;

/*
Выбрать supplier_ids для тех поставщиков, у которых количество продуктов больше 2 Используем таблицу products
*/
SELECT supplier_ids
FROM products
GROUP BY supplier_ids
HAVING COUNT(id) > 2;

/*
Вы можете использовать несколько условий в HAVING
Сгруппировать продукты по standard_cost и list_price 
Посчитать количество продуктов и вывести только те данные, где количество продуктов не менее 2
*/
SELECT standard_cost, list_price, COUNT(product_name)
FROM northwind.products
GROUP BY 1, 2
HAVING COUNT(product_name) >= 2;

/*
Выбрать только те продукты в quantity_per_unit встречается слово 'oz' как в нижнем 
так и в верхнем регистрах Сгруппировать по standard_cost 
Оставить только данные где количество продуктов не менее 3
*/
SELECT standard_cost, GROUP_CONCAT(quantity_per_unit)
FROM products
WHERE LOWER(quantity_per_unit) LIKE '%oz%'
GROUP BY standard_cost
HAVING COUNT(*) >= 3;

SELECT standard_cost, GROUP_CONCAT(quantity_per_unit)
FROM products
WHERE LOWER(quantity_per_unit) LIKE '%oz%'
GROUP BY standard_cost
HAVING COUNT(*) >= 3
order by GROUP_CONCAT(quantity_per_unit);