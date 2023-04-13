--  Создание БД Db_SQL
DROP DATABASE IF EXISTS Db_SQL;
CREATE DATABASE IF NOT EXISTS Db_SQL;

-- Выбираем активную БД
USE Db_SQL;

-- 1. Создание таблицы с мобильными телефонами
CREATE TABLE `Db_SQL`.`HW_1_mobile_phones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ProductName` VARCHAR(45) NOT NULL,
  `Manufacturer` VARCHAR(45) NOT NULL,
  `ProductCount` INT NULL,
  `Price` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE);
  
  -- Заполнение таблицы значениями
INSERT INTO HW_1_mobile_phones (ProductName, Manufacturer, ProductCount, Price)
VALUES 
	('IPhone X','Apple',3,76000),
	('IPhone 8','Apple',2,51000),
	('Galaxy S9','Samsung',2,56000),
	('Galaxy S8','Samsung',1,41000),
	('P20 Pro','Huawei',5,36000);

-- Вывод базы данных hw_1_mobile_phones
SELECT * FROM db_sql.hw_1_mobile_phones;

-- 2. Выведите название, производителя и цену для товаров, количество которых превышает 2 (SQL - файл, скриншот, либо сам код)
SELECT  ProductName, Manufacturer, Price
FROM HW_1_mobile_phones
WHERE ProductCount>2;

-- 3. Выведите весь ассортимент товаров марки “Samsung”
SELECT *
FROM HW_1_mobile_phones
WHERE Manufacturer='Samsung';

-- 4.Выведите информацию о телефонах, где суммарный чек больше 100 000 и меньше 145 000**
SELECT *
FROM HW_1_mobile_phones
WHERE ProductCount*Price between 100000 and 145000;

-- 4.*** С помощью регулярных выражений найти (можно использовать операторы “LIKE”, “RLIKE” для 4.3 ):
	-- 4.1. Товары, в которых есть упоминание "Iphone"
SELECT *
FROM HW_1_mobile_phones
WHERE ProductName LIKE '%IPhone%';

	-- 4.2. "Galaxy"
SELECT *
FROM HW_1_mobile_phones
WHERE ProductName LIKE '%Galaxy%';

	-- 4.3.  Товары, в которых есть ЦИФРЫ
SELECT *
FROM HW_1_mobile_phones
WHERE ProductName RLIKE '[%0-9%]';

     -- 4.4.  Товары, в которых есть ЦИФРА "8"
SELECT *
FROM HW_1_mobile_phones
WHERE ProductName LIKE '%8%';