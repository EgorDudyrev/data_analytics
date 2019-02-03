SELECT 'ФИО: Дудырев Егор';

--1. Оконные функции
SELECT
    userid, movieid,
    (rating-r_min)/(r_max-r_min+0.000001) normed_rating,
    avg_rating
FROM (
        SELECT userid, movieid,
            rating,
            MIN(rating) OVER (PARTITION BY userid) r_min,
            MAX(rating) OVER (PARTITION BY userid) r_max,
            AVG(rating) OVER (PARTITION BY userid) avg_rating
 FROM ratings
)t
LIMIT 30;

--2. Создание таблицы 
psql -U postgres  -c "CREATE TABLE keywords (id INTEGER NOT NULL, tags VARCHAR(6000))"

--3. Заливка данных в таблицу
psql -U postgres -c "\\copy keywords FROM 'raw_data/keywords.csv' DELIMITER ',' CSV HEADER"

--4. "ЗАПРОС3"
WITH top_rated AS (
 SELECT movieid, AVG(rating) avg_rating FROM ratings
 GROUP BY movieid
 HAVING COUNT(*)>50
 ORDER BY AVG(rating) DESC, movieid ASC
 LIMIT 150
 )
SELECT tr.movieid, kw.tags top_rated_tags
INTO top_rated_tags
FROM top_rated tr LEFT JOIN keywords kw ON tr.movieid=kw.id;

--5. Выгрузка таблицы в файл
\copy (SELECT * FROM top_rated_tags) TO 'top_rating_tags.csv' WITH CSV HEADER DELIMITER AS E'\t';