SELECT job_id, AVG(salary) 
FROM hr.employees
WHERE manager_id IS NOT NUll
GROUP BY job_id
ORDER BY salary DESC;

SELECT * 
FROM hr.employees 
WHERE job_id ='IT_PROG';

SELECT * 
FROM hr.employees 
WHERE job_id ='IT_PROG'
GROUP BY employee_id
ORDER BY salary DESC;

SELECT * FROM hr.employees where salary > 10000;
SELECT * FROM hr.employees where salary between 10000 and 20000;
SELECT * FROM hr.employees where department_id not in (60, 30, 100);
SELECT * FROM hr.employees where first_name like '%_ll_%';
SELECT * FROM hr.employees where last_name like '%_a';
SELECT * FROM employees where last_name like '%a';
SELECT * FROM hr.employees where department_id = 90;
SELECT * FROM hr.employees where salary > 5000;
SELECT * FROM employees WHERE last_name LIKE 'L%';
SELECT * FROM departments WHERE location_id = 1700;
SELECT * FROM locations WHERE country_id = 'US';
SELECT * FROM employees WHERE  first_name = 'Lex' AND last_name = 'De Haan';
SELECT 
    last_name, salary
FROM
    employees
WHERE
    first_name = 'Lex'
        AND last_name = 'De Haan';
SELECT last_name, salary FROM employees WHERE  first_name = 'Lex';
SELECT first_name, salary FROM employees WHERE last_name = 'De Haan';
SELECT * FROM employees WHERE job_id = 'FI_ACCOUNT' AND salary < 8000;
SELECT * FROM employees where last_name like '%_kk_%' OR last_name like '%_ll_%';
SELECT * FROM employees WHERE commission_pct IS NULL;
SELECT * FROM employees WHERE department_id not in (80, 110);

SELECT
*
FROM
employees
WHERE
salary BETWEEN 5000 AND 7000;

/*
SELECT
*
FROM
employees
WHERE
salary BETWEEN 5000 AND 7000;
*/

SELECT * 
FROM airport.clients
WHERE name IS NOT NUll;

SELECT *