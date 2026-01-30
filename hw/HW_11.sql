-- Создать кастомные функции

-- Расчет площади круга
-- Создайте функцию для расчета площади круга, если известен его радиус.
-- Используйте формулу 
-- Где:
-- S — площадь круга,
-- r — радиус круга,
-- ​π≈3.14159, используйте функцию PI(), которая возвращает это число

CREATE FUNCTION circle_area(radius DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN PI() * POW(radius, 2);
END;

SELECT circle_area(2);

-- 2. Функция для расчета гипотенузы треугольника
-- Создайте функцию для расчета гипотенузы прямоугольного треугольника, если известны длины его катетов.
-- Используйте формулу 
-- Где:
-- c — длина гипотенузы прямоугольного треугольника,
-- a, b — длины его катетов

CREATE FUNCTION hypo_triangle(legs_a DECIMAL(10,2), legs_b DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN SQRT(POW(legs_a, 2) + POW(legs_b, 2));
END;

SELECT hypo_triangle(6, 8);