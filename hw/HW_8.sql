-- 1. Найти все записи таблицы Printer для цветных принтеров
SELECT  *
FROM Printer
WHERE color = 'y'; 

/*2. Найти номера моделей и цены всех имеющихся в 
продаже продуктов производителя B*/
SELECT  p.model
       ,mp.price
       ,p.type
FROM Product p
JOIN
(
	SELECT  model
	       ,price
	FROM PC
	UNION ALL
	SELECT  model
	       ,price
	FROM Laptop
	UNION ALL
	SELECT  model
	       ,price
	FROM Printer
) AS mp
ON mp.model = p.model
WHERE p.maker = 'B';

-- 3. Найти производителя, выпускающего ПК, но не ПК-блокноты
SELECT  DISTINCT maker
FROM Product
WHERE type = 'PC'
AND maker NOT IN ( SELECT maker FROM Product WHERE type = 'Laptop');

-- 4. Найти производителей ПК с процессором не менее 450 МГц
SELECT  DISTINCT prod.maker
FROM PC pc
INNER JOIN Product prod
ON pc.model = prod.model
WHERE pc.speed >= 450;

-- 5. Найти среднюю скорость ПК
SELECT  AVG(speed) AS avg_speed
FROM PC;

/*6. Для каждого производителя, имеющего модели в таблице Laptop, 
найти средний размер экрана выпускаемых им ПК-блокнотов. 
Вывести: maker, средний размер экрана.*/
SELECT  prod.maker
       ,AVG(l.screen) AS avg_scr
FROM Laptop l
JOIN Product prod
ON l.model = prod.model
GROUP BY  prod.maker;