USE world;
--Вывести список тех стран, продолжительность жизни в которых выше средней, 
--а так же указать разницу между этой продолжительностью и актуальной для страны
SELECT  `Name`
       ,LifeExpectancy
       ,AVG(LifeExpectancy) OVER()                  AS avg_life_ex
       ,LifeExpectancy - AVG(LifeExpectancy) OVER() AS life_diff
FROM country
WHERE LifeExpectancy > (
SELECT  AVG(LifeExpectancy)
FROM country);
--
SELECT  `Name`
       ,LifeExpectancy
       ,LifeExpectancy - avg_life_ex1 AS life_diff
       ,avg_life_ex1
FROM country
CROSS JOIN
(
	SELECT  AVG(LifeExpectancy) AS avg_life_ex1
	FROM country
) AS t1
WHERE LifeExpectancy > avg_life_ex1;

--
SELECT  *
FROM
(
	SELECT  `Name`
	       ,LifeExpectancy
	       ,LifeExpectancy - (AVG(LifeExpectancy) OVER ()) AS life_diff
	       ,AVG(LifeExpectancy) OVER ()                    AS avg_life
	FROM country
) AS t
WHERE LifeExpectancy > avg_life;
--Teacher
WITH t AS
(
	SELECT  `Name`
	       ,LifeExpectancy
	       ,LifeExpectancy - (AVG(LifeExpectancy) OVER ()) AS life_diff
	       ,AVG(LifeExpectancy) OVER ()                    AS avg_life
	FROM country
)
SELECT  *
FROM t
WHERE LifeExpectancy > avg_life;

--Дима
SELECT  `Name`
       ,LifeExpectancy
       ,(SELECT  AVG(LifeExpectancy) FROM country) AS avg_1
       ,ROUND( LifeExpectancy - (SELECT  AVG(LifeExpectancy) FROM country), 2 ) AS dif_avg
FROM country
WHERE LifeExpectancy > (SELECT  AVG(LifeExpectancy) FROM country);

--Рассчитать долю населения каждой страны от континента. Вывести название, население и эту долю
SELECT `Name`
, Population
, Continent
, SUM(Population) OVER(PARTITION BY Continent) AS cont_pop
, Population / SUM(Population) OVER(PARTITION BY Continent) * 100 AS percent_pop
FROM country;

--Вывести страны, их население, а также сумму населения континента 
--в порядке убывания средней продолжительности каждой страны в нем.
SELECT  `Name`
       ,Continent
       ,LifeExpectancy
       ,`Population`
       ,SUM(Population) OVER(PARTITION BY Continent ORDER BY  LifeExpectancy DESC)
FROM country;

SELECT  `Name`
       ,Continent
       ,LifeExpectancy
       ,`Population`
       ,SUM(Population) OVER(PARTITION BY Continent) cont_pop
FROM country
ORDER BY Continent, LifeExpectancy DESC;

--Для каждого города вывести суммарное население в его регионе.
SELECT  `Name`
       ,District
       ,Population
       ,SUM(Population) OVER (PARTITION BY District) AS sum_dist
FROM city;

