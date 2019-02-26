--1) Создание таблицы цветомоделей
CREATE TABLE Stylecolor (
	id SERIAL PRIMARY KEY,
	WAREGROUP VARCHAR(255) NOT NULL,
	Trademark VARCHAR(255),
	Color VARCHAR(255),
	Price INTEGER NOT NULL
);

--2) Создание таблицы городов
CREATE TABLE City (
	id SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Population INTEGER
);

--3) Создание таблицы магазинов
CREATE TABLE Shop (
	id SERIAL PRIMARY KEY,
	idCity INTEGER,
	Name VARCHAR(255) NOT NULL,
	Address VARCHAR(255) NOT NULL,
	CONSTRAINT shop_city_id FOREIGN KEY (idCity) REFERENCES City (id)
);

--4) Создание таблицы покупок
CREATE TABLE Sale (
	id SERIAL PRIMARY KEY,
	idStylecolor INTEGER,
	idShop INTEGER,
	Datetime_ TIMESTAMP,
	CONSTRAINT sale_stylecolor_id FOREIGN KEY (idStylecolor) REFERENCES Stylecolor (id),
	CONSTRAINT sale_shop_id FOREIGN KEY (idShop) REFERENCES Shop (id)
);

--5) Запись данных в таблицы
INSERT INTO Stylecolor (WAREGROUP, Trademark, Color, Price)
VALUES	('Sneakers', 'Nike', 'Black', 5000),
		('TShirt', 'Adidas', 'Yellow', 2000),
		('Sneakers', 'Adidas', 'Blue', 5500),
		('TShirt', 'Nike', 'Blue', 2300),
		('Shoes', 'Solomon', 'Black', 3000);
INSERT INTO City (Name, Population)
VALUES	('Москва', 15000000),
		('Санкт-Петербург', 5000000),
		('Ижевск', 700000),
		('Пермь', 1000000),
		('Казань', 1200000);
INSERT INTO Shop (idCity, Name, Address)
VALUES	(1, 'Первый', 'Пушкинская 1'),
		(1, 'Второй', 'Ленинская 36'),
		(1, 'Третий', 'Пушкинская 54'),
		(2, 'Четвёртый', 'Ленинская 36'),
		(2, 'Пятый', 'Пушкинская 54'),
		(3, 'Шестой', 'Ленинская 36'),
		(4, 'Седьмой', 'Пушкинская 54'),
		(5, 'Восьмой', 'Ленинская 36'),
		(5, 'Девятый', 'Пушкинская 54'),
		(4, 'Десятый', 'Ленинская 36');
INSERT INTO Sale (idStylecolor, idShop, Datetime_)
VALUES	(1, 1, '2019-01-01 10:10:10-07'),
		(1, 2, '2019-01-01 10:10:10-07'),
		(1, 2, '2019-01-02 10:10:10-07'),
		(1, 3, '2019-01-02 10:10:10-07'),
		(1, 3, '2019-01-03 10:10:10-07'),
		(1, 4, '2019-01-05 10:10:10-07'),
		(1, 5, '2019-01-06 10:10:10-07'),
		(1, 10, '2019-01-10 10:10:10-07'),
		(2, 3, '2019-01-05 10:10:10-07'),
		(2, 4, '2019-01-06 10:10:10-07'),
		(2, 3, '2019-01-02 10:10:10-07'),
		(2, 3, '2019-01-01 10:10:10-07'),
		(2, 5, '2019-01-10 10:10:10-07'),
		(2, 6, '2019-01-15 10:10:10-07'),
		(2, 7, '2019-01-15 10:10:10-07'),
		(2, 8, '2019-01-05 10:10:10-07'),
		(2, 6, '2019-01-06 10:10:10-07'),
		(2, 5, '2019-01-07 10:10:10-07'),
		(3, 1, '2019-01-08 10:10:10-07'),
		(3, 1, '2019-01-02 10:10:10-07'),
		(3, 1, '2019-01-01 10:10:10-07'),
		(3, 2, '2019-01-03 10:10:10-07'),
		(3, 3, '2019-01-05 10:10:10-07'),
		(3, 6, '2019-01-09 10:10:10-07'),
		(3, 4, '2019-01-10 10:10:10-07'),
		(3, 3, '2019-01-02 10:10:10-07'),
		(3, 2, '2019-01-03 10:10:10-07'),
		(3, 10,'2019-01-05 10:10:10-07'),
		(4, 3, '2019-01-01 10:10:10-07'),
		(4, 4, '2019-01-02 10:10:10-07'),
		(4, 1, '2019-01-03 10:10:10-07'),
		(4, 3, '2019-01-06 10:10:10-07'),
		(4, 9, '2019-01-04 10:10:10-07'),
		(4, 8, '2019-01-02 10:10:10-07'),
		(4, 10,'2019-01-01 10:10:10-07'),
		(4, 1, '2019-01-06 10:10:10-07'),
		(4, 1, '2019-01-08 10:10:10-07'),
		(4, 2, '2019-01-05 10:10:10-07'),
		(5, 5, '2019-01-04 10:10:10-07'),
		(5, 6, '2019-01-02 10:10:10-07'),
		(5, 7, '2019-01-01 10:10:10-07'),
		(5, 10,'2019-01-02 10:10:10-07'),
		(5, 2, '2019-01-05 10:10:10-07'),
		(5, 4, '2019-01-02 10:10:10-07'),
		(5, 7, '2019-01-06 10:10:10-07'),
		(5, 7, '2019-01-02 10:10:10-07'),
		(5, 8, '2019-01-03 10:10:10-07'),
		(5, 10,'2019-01-09 10:10:10-07');

--6) Плоская таблица с информацией по всем магазинам с указанием городов, где они находятся
SELECT s.id idShop, idCity, s.name nameShop, address, c.name nameCity, population  FROM Shop s JOIN City c ON s.idcity=c.id
ORDER BY idShop;

--7) Статистика по количеству магазинов в городах
SELECT c.id idCity, c.name city, count(*) cnt FROM shop s JOIN city c ON s.idcity=c.id
GROUP BY c.id, c.name
ORDER BY count(*) DESC, c.name ASC;

--8) Плоская таблица по всем покупкам
SELECT 
	datetime_, idStylecolor, waregroup, trademark, color, price, idShop, s.name nameShop, address, idCity, c.name cityName, population
FROM shop s
	JOIN sale sls ON sls.idShop=s.id
	JOIN city c ON s.idCity=c.id
	JOIN Stylecolor sc ON sc.id=sls.idStylecolor
LIMIT 30;

--9) Количество продаж товаров за день суммарно и в разрезе брендов
SELECT DISTINCT
	datetime_::date, Trademark,
	COUNT(*) OVER (PARTITION BY datetime_::date, Trademark) tm_daily_cnt,
	COUNT(*) OVER (PARTITION BY datetime_::date) daily_cnt
FROM sale s LEFT JOIN stylecolor sc ON s.idStylecolor=sc.id
ORDER BY datetime_;

--10) Скользящее среднее продаж по каждой цветомодели, включая скользящее среднее с окном в 7 дней, взятое с лагом
WITH
all_date_sc as (
	SELECT date_::date date_, id idSc
	FROM generate_series((SELECT MIN(datetime_) FROM sale), (SELECT MAX(datetime_) FROM sale), '1 day'::interval) date_, stylecolor
),
buyed as (
	SELECT
		date_, idsc, price,
		SUM(CASE WHEN datetime_ IS NULL THEN 0 ELSE 1 END) OVER (PARTITION BY date_, idsc) cnt_buyed
	FROM all_date_sc ads LEFT JOIN sale s ON ads.idSc=s.idStylecolor AND ads.date_=s.datetime_::date JOIN stylecolor sc ON ads.idSc=sc.id
),
sl_means as (
	SELECT DISTINCT
		b.*,
		AVG(cnt_buyed) OVER (PARTITION BY idsc ORDER BY date_) sl_mean_idsc_cnt,
		AVG(cnt_buyed*price) OVER (PARTITION BY idsc ORDER BY date_) sl_mean_idsc_price,
		AVG(cnt_buyed) OVER (PARTITION BY idsc ORDER BY date_ ROWS 6 PRECEDING) sl_mean_week_idsc_cnt,
		AVG(cnt_buyed*price) OVER (PARTITION BY idsc ORDER BY date_ ROWS 6 PRECEDING) sl_mean_week_idsc_price
	FROM buyed b
)
SELECT
	date_, idsc, cnt_buyed,
	COALESCE(LAG(sl_mean_idsc_cnt) OVER (PARTITION BY idsc ORDER BY date_),0) sl_mean_idsc_cnt1,
	COALESCE(LAG(sl_mean_idsc_price) OVER (PARTITION BY idsc ORDER BY date_),0) sl_mean_idsc_price1,
	COALESCE(LAG(sl_mean_week_idsc_cnt) OVER (PARTITION BY idsc ORDER BY date_),0) sl_mean_week_idsc_cnt1,
	COALESCE(LAG(sl_mean_week_idsc_price) OVER (PARTITION BY idsc ORDER BY date_),0) sl_mean_week_idsc_price1
FROM sl_means
ORDER BY date_, idsc
LIMIT 30;