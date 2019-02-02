SELECT 'ФИО: Дудырев Егор';

--1. Простые выборки
--1.1
SELECT * FROM ratings LIMIT 10;
--1.2
SELECT * FROM links
WHERE imdbid LIKE '%42' AND movieid BETWEEN 100 AND 1000
LIMIT 10;

--2. Сложные выборки: JOIN
--2.1
SELECT *
FROM links l JOIN ratings r ON l.movieid=r.movieid 
LIMIT 10;

--3. Аггрегация данных: базовые статистики
--3.1
SELECT COUNT(*)
FROM links l LEFT JOIN ratings r ON l.movieid=r.movieid
WHERE r.rating IS NULL;
--3.2
SELECT userid, AVG(rating) avg_rating FROM ratings
GROUP BY userid
HAVING AVG(rating)>3.5
ORDER BY avg_rating DESC
LIMIT 10;

--4. Иерархические запросы
--4.1
SELECT imdbid FROM links
WHERE movieid IN (
 SELECT movieid FROM ratings
 GROUP BY movieid HAVING AVG(movieid)>3.5
 )
LIMIT 10;
--4.2
--v1 Средний рейтинг активных пользователей
WITH tmp AS (
 SELECT AVG(rating) avg_per_user FROM ratings
 GROUP BY userid HAVING COUNT(*)>10)
SELECT AVG(avg_per_user)
FROM tmp;
--v2 Средний рейтинг фильмов, который поставили активные пользователи
/*WITH tmp AS (
 SELECT userid FROM ratings
 GROUP BY userid HAVING COUNT(*)>10)
SELECT AVG(rating)
FROM ratings r JOIN tmp ON r.userid=tmp.userid;
*/