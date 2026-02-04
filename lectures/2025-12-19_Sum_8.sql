USE airport;

-- Вывести количество самолетов каждой модели.
SELECT model_name, COUNT(*) AS mc
FROM airliners
GROUP BY model_name;

SELECT model_name, COUNT(model_name) as model_count
FROM airport.airliners
GROUP BY model_name;

-- Вывести количество trips для каждого типа лайнера.
SELECT al.id, COUNT(al.model_name), model_name
FROM airliners al
JOIN trips ts ON al.id = ts.airliner_id
GROUP BY 1;

SELECT a.id, COUNT(t.trip_code)
FROM airliners a
JOIN trips t ON a.id = t.airliner_id
GROUP BY 1;

-- Вывести клиентов, которые ни разу не летали.
SELECT *
FROM clients c
LEFT JOIN tickets t ON t.client_id = c.id
WHERE trip_id IS NULL;

-- ывести среднюю стоимость билета в каждом классе обслуживания (service_class).
SELECT service_class
, ROUND(AVG(price)) AS avg_price
FROM tickets
GROUP BY service_class;

-- Вывести id билетов, цену билета и среднюю стоимость всех билетов этого класса одним запросом.
SELECT service_class, AVG(price) FROM tickets;

SELECT  t.id
       ,t.price
       ,sc.service_class
       ,sc.avg_price
FROM tickets t
JOIN
(
	SELECT  service_class
	       ,AVG(price) AS avg_price
	FROM tickets
	GROUP BY  1
) AS sc
ON t.service_class = sc.service_class
ORDER BY 3;
--
SELECT t.id, t.price, sc.avg_price 
FROM tickets AS t
JOIN (
SELECT avg(price) AS avg_price 
FROM tickets) AS sc
ON True;   -- 1 = 1

SELECT t.id, t.price, sc.avg_price 
FROM tickets AS t
CROSS JOIN (
SELECT avg(price) AS avg_price 
FROM tickets) AS sc;

-- Вывести список поездок (trips) по убыванию количество билетов для каждой поездки.
SELECT  trip_id
       ,COUNT(trip_id) AS sum_trip
FROM tickets
GROUP BY  trip_id
ORDER BY  2 DESC;

SELECT  trip_id
       ,COUNT(trip_id) AS sum_trip
FROM tickets
GROUP BY  trip_id
ORDER BY  sum_trip DESC;

-- Вывести тех клиентов, которые купили билеты, но не смогли улететь.
SELECT *
FROM trips;

SELECT DISTINCT status 
FROM trips;

SELECT  name
       ,tr.status
FROM clients cl
JOIN tickets t
ON t.client_id = cl.id
JOIN trips tr
ON tr.id = t.trip_id
WHERE tr.status = 'Cancelled';

USE world;

-- Вывести список городов и стран с их населением в виде одной таблицы из 2х колонок.
SELECT  Name
       ,Population
FROM city
UNION ALL
SELECT  Name
       ,Population
FROM country;