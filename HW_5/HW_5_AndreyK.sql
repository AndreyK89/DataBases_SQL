DROP DATABASE IF EXISTS hw_5;
CREATE DATABASE hw_5;
USE hw_5;

CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
SELECT *
FROM cars;

-- Задача 1. Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов.

CREATE VIEW view_cars AS
SELECT *
FROM cars
WHERE cost < 25000;

SELECT *
FROM view_cars;

-- Задача 2. Измените в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW).

ALTER VIEW view_cars AS
SELECT *
FROM cars
WHERE cost < 30000;

SELECT *
FROM view_cars;

-- Задача 3. Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”.

CREATE VIEW view_cars_2 AS
SELECT *
FROM cars
WHERE name IN ("Skoda", "Audi");

SELECT *
FROM view_cars_2
