SELECT * FROM hw_3.staff;

-- 1. Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания

-- по возрастанию: 
SELECT *
FROM staff
ORDER BY salary;

-- по убыванию:
SELECT *
FROM staff
ORDER BY salary DESC;


-- 2. Выведите 5 максимальных заработных плат (saraly)
SELECT salary
FROM staff
ORDER BY salary DESC
LIMIT 5;


-- 3. Посчитайте суммарную зарплату (salary) по каждой специальности (роst)
SELECT 
	post,
    SUM(salary) AS sum_salary
FROM staff
GROUP BY post;


-- 4. Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.
SELECT post,
	COUNT(id) 'Кол-во сотрудников 24-49'
FROM staff
WHERE post = "Рабочий" AND age >= 24 AND age <= 49;

-- TOP 2 по зп по (post) «Рабочий» в возрасте от 24 до 49 лет включительно.
SELECT post, salary
FROM staff
WHERE post = "Рабочий" AND age >= 24 AND age <= 49
ORDER BY salary DESC
LIMIT 2;

-- 5. Найдите количество специальностей
SELECT 
	COUNT(DISTINCT post) AS count_post
FROM staff;

-- 6. Выведите специальности, у которых средний возраст сотрудников меньше 30 лет 
SELECT post, AVG(age)
FROM staff
GROUP BY post
HAVING AVG(age) <= 30;
