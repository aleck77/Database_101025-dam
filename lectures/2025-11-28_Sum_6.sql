/*
Используя базу hr, вывести имя и фамилию сотрудника и название его департамента.
*/
SELECT last_name, first_name, d.department_name
FROM employees em
LEFT JOIN departments d ON em.department_id = d.department_id;

/*
Вывести имя и фамилию и название департамента только тех сотрудников, которые работают в IT, Treasury или IT Support.
*/
SELECT last_name, first_name, d.department_name
FROM employees em
LEFT JOIN departments d ON em.department_id = d.department_id
where d.department_name in ('IT', 'Treasury', 'IT Support');

SELECT last_name, first_name, department_name
FROM employees em
LEFT JOIN departments using(department_id)
where department_name in ('IT', 'Treasury', 'IT Support');

SELECT last_name, first_name, department_name
FROM employees em
INNER JOIN departments d ON em.department_id = d.department_id and department_name in ('IT', 'Treasury', 'IT Support');

/*
FULL JOIN...
*/
SELECT *
FROM employees em
LEFT JOIN departments d ON em.department_id = d.department_id
UNION
SELECT *
FROM employees em
RIGHT JOIN departments d ON em.department_id = d.department_id;

/*
Вывести все департаменты в которых никто не работает
*/
SELECT *
FROM employees em
RIGHT JOIN departments d ON em.department_id = d.department_id;

SELECT * 
FROM employees em
right join departments d on em.department_id = d.department_id
where employee_id is null;

/*
Вывести имя, фамилию и зарплату тех сотрудников, которые работают в городах Oxford и San Francisco.
*/
SELECT first_name, last_name, salary, city 
FROM employees em
join departments d ON em.department_id = d.department_id
join locations l ON d.location_id = l.location_id and city in ('Oxford', 'San Francisco');

SELECT first_name, last_name, salary, city
FROM employees emp
JOIN departments dep ON dep.department_id = emp.department_id
JOIN locations loc ON loc.location_id = dep.location_id AND city IN ('Oxford', 'San Francisco');