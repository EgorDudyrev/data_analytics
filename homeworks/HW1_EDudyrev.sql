SELECT 'ФИО: Дудырев Егор';

--Создание таблиц
CREATE TABLE films (
	id SERIAL PRIMARY KEY,
	title VARCHAR(255) NOT NULL,
	country VARCHAR(255),
	box_office INTEGER,
	release_year TIMESTAMP
);
CREATE TABLE persons (
 id SERIAL PRIMARY KEY,
 fio VARCHAR(255) UNIQUE NOT NULL
);
CREATE TABLE persons2content (
 person_id INTEGER REFERENCES persons(id),
 film_id INTEGER REFERENCES films(id),
 person_type VARCHAR(255)
);

--Фильм 1: Богемская рапсодия
INSERT INTO persons (fio)
VALUES ('Рами Малек'), ('Люси Бойнтон'), ('Гвилим Ли'),
        ('Брайан Сингер'), ('Энтони МакКартен'), ('Роберт Де Ниро');

INSERT INTO films (title, country, box_office, release_year)
VALUES ('Богемская рапсодия', 'Великобритания', 801536458, to_timestamp('2018', 'yyyy'));

INSERT INTO persons2content (person_id, film_id, person_type)
WITH f AS (
	SELECT id film_id FROM films WHERE title='Богемская рапсодия'
)
SELECT p.id person_id, film_id, 'Актёр' person_type FROM persons p, f
WHERE p.fio IN ('Рами Малек', 'Люси Бойнтон', 'Гвилим Ли')
UNION
SELECT p.id person_id, film_id, 'Режиссёр' person_type FROM persons p, f
WHERE p.fio = 'Брайан Сингер'
UNION
SELECT p.id person_id, film_id, 'Сценарист' person_type FROM persons p, f
WHERE p.fio = 'Энтони МакКартен'
UNION
SELECT p.id person_id, film_id, 'Продюсер' person_type FROM persons p, f
WHERE p.fio = 'Роберт Де Ниро';

--Фильм 2: Зелёная книга
INSERT INTO persons (fio)
VALUES ('Вигго Мортенсен'), ('Махершала Али'), ('Линда Карделлини'),
        ('Питер Фаррелли'), ('Ник Валлелонга'), ('Джим Бёрк');

INSERT INTO films (title, country, box_office, release_year)
VALUES ('Зелёная книга', 'США', 47888188, to_timestamp('2018', 'yyyy'));

INSERT INTO persons2content (person_id, film_id, person_type)
WITH f AS (
	SELECT id film_id FROM films WHERE title='Зелёная книга'
)
SELECT p.id person_id, film_id, 'Актёр' person_type FROM persons p, f
WHERE p.fio IN ('Вигго Мортенсен', 'Махершала Али', 'Линда Карделлини')
UNION
SELECT p.id person_id, film_id, 'Режиссёр' person_type FROM persons p, f
WHERE p.fio = 'Питер Фаррелли'
UNION
SELECT p.id person_id, film_id, 'Сценарист' person_type FROM persons p, f
WHERE p.fio = 'Ник Валлелонга'
UNION
SELECT p.id person_id, film_id, 'Продюсер' person_type FROM persons p, f
WHERE p.fio = 'Джим Бёрк';

--Фильм 3: Человек-паук: Через вселенные
INSERT INTO persons (fio)
VALUES ('Шамеик Мур'), ('Джейк Джонсон'), ('Хейли Стайнфелд'),
        ('Боб Персичетти'), ('Фил Лорд'), ('Уилл Аллегра');

INSERT INTO films (title, country, box_office, release_year)
VALUES ('Человек-паук: Через вселенные', 'США', 327987352, to_timestamp('2018', 'yyyy'));

INSERT INTO persons2content (person_id, film_id, person_type)
WITH f AS (
	SELECT id film_id FROM films WHERE title='Человек-паук: Через вселенные'
)
SELECT p.id person_id, film_id, 'Актёр' person_type FROM persons p, f
WHERE p.fio IN ('Шамеик Мур', 'Джейк Джонсон', 'Хейли Стайнфелд')
UNION
SELECT p.id person_id, film_id, 'Режиссёр' person_type FROM persons p, f
WHERE p.fio = 'Боб Персичетти'
UNION
SELECT p.id person_id, film_id, 'Сценарист' person_type FROM persons p, f
WHERE p.fio = 'Фил Лорд'
UNION
SELECT p.id person_id, film_id, 'Продюсер' person_type FROM persons p, f
WHERE p.fio = 'Уилл Аллегра';

--Фильм 4: Дом, который построил Джек
INSERT INTO persons (fio)
VALUES ('Мэтт Диллон'), ('Бруно Ганц'), ('Ума Турман'),
        ('Ларс фон Триер'), ('Луиза Вест');

INSERT INTO films (title, country, box_office, release_year)
VALUES ('Дом, который построил Джек', 'Дания', 1217734 , to_timestamp('2018', 'yyyy'));

INSERT INTO persons2content (person_id, film_id, person_type)
WITH f AS (
	SELECT id film_id FROM films WHERE title='Дом, который построил Джек'
)
SELECT p.id person_id, film_id, 'Актёр' person_type FROM persons p, f
WHERE p.fio IN ('Мэтт Диллон', 'Бруно Ганц', 'Ума Турман')
UNION
SELECT p.id person_id, film_id, 'Режиссёр' person_type FROM persons p, f
WHERE p.fio = 'Ларс фон Триер'
UNION
SELECT p.id person_id, film_id, 'Сценарист' person_type FROM persons p, f
WHERE p.fio = 'Ларс фон Триер'
UNION
SELECT p.id person_id, film_id, 'Продюсер' person_type FROM persons p, f
WHERE p.fio = 'Луиза Вест';

--Фильм 5: Ла-Ла Ленд
INSERT INTO persons (fio)
VALUES ('Райан Гослинг'), ('Эмма Стоун'), ('Джон Ледженд'),
        ('Дэмьен Шазелл'), ('Фред Бергер');

INSERT INTO films (title, country, box_office, release_year)
VALUES ('Ла-Ла Ленд', 'США', 446050389, to_timestamp('2016', 'yyyy'));

INSERT INTO persons2content (person_id, film_id, person_type)
WITH f AS (
	SELECT id film_id FROM films WHERE title='Ла-Ла Ленд'
)
SELECT p.id person_id, film_id, 'Актёр' person_type FROM persons p, f
WHERE p.fio IN ('Райан Гослинг', 'Эмма Стоун', 'Джон Ледженд')
UNION
SELECT p.id person_id, film_id, 'Режиссёр' person_type FROM persons p, f
WHERE p.fio = 'Дэмьен Шазелл'
UNION
SELECT p.id person_id, film_id, 'Сценарист' person_type FROM persons p, f
WHERE p.fio = 'Дэмьен Шазелл'
UNION
SELECT p.id person_id, film_id, 'Продюсер' person_type FROM persons p, f
WHERE p.fio = 'Фред Бергер';