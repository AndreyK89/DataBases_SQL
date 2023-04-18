-- 1. Используя операторы языка SQL, создайте таблицу “sales”. Заполните ее данными:
-- Создаем базу данных HW_2:
DROP DATABASE IF EXISTS HW_2;
CREATE DATABASE IF NOT EXISTS HW_2;

-- Создаем таблицу “sales”:
USE HW_2;

DROP TABLE IF EXISTS sales;
CREATE TABLE IF NOT EXISTS sales 
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    count_product INT NOT NULL
);

INSERT INTO `sales` (order_date, count_product)
VALUES 
	('2022-01-01', 156),
    ('2022-01-02', 180),
    ('2022-01-03', 21),
    ('2022-01-04', 124),
    ('2022-01-05', 341);
SELECT * FROM sales

-- 2.  Для данных таблицы “sales” укажите тип заказа в зависимости от кол-ва :
/* 
меньше 100  -    Маленький заказ
от 100 до 300 - Средний заказ
больше 300  -     Большой заказ
*/
 
SELECT
id AS "id заказа",
     IF (count_product < 100, "Маленький заказ",
		IF(count_product BETWEEN 100 AND 300, "Средний заказ", "Большой заказ"))
	 AS "Тип заказа"
FROM sales;

-- 3. Создайте таблицу “orders”, заполните ее значениями.

-- Создаем таблицу “orders”:
USE HW_2;

DROP TABLE IF EXISTS orders;
CREATE TABLE orders
(
	id INT PRIMARY KEY AUTO_INCREMENT,
	employee_id VARCHAR(5),
	amount FLOAT(7,2),
    order_status VARCHAR(15)
);

-- Наполняем таблицу 'orders' данными:
INSERT INTO `orders` (employee_id, amount, order_status)
VALUES 
('e03', 15.00, 'OPEN'),
('e01', 25.50, 'OPEN'),
('e05', 100.70, 'CLOSED'),
('e02', 22.18, 'OPEN'),
('e04', 9.50, 'CANCELLED');
SELECT * FROM orders

-- Выберите все заказы.
/*
В зависимости от поля order_status выведите столбец full_order_status:
OPEN – «Order is in open state/Заказ открыт»;
CLOSED - «Order is closed/Заказ закрыт»;
CANCELLED -  «Order is cancelled/Заказ отменен»
*/

SELECT *, CASE
			WHEN order_status ='OPEN' then 'Order is in open state/Заказ открыт'
			WHEN order_status ='CLOSED' then 'Order is closed/Заказ закрыт'
			WHEN order_status ='CANCELLED' then 'Order is cancelled/Заказ отменен'
			END AS full_order_status
FROM orders

-- 4. Чем 0 отличается от NULL?
  -- 0 это цифра, т.е. значение (с которым можно производить математические вычисления), а NULL это отсутсвие значений в ячейке.
  
  -- Дополнительное задвние.
  
  USE HW_2;
  
SELECT * FROM users
SELECT * FROM clients
SELECT * FROM posts

-- №1.	Используя оператор ALTER TABLE, установите внешний ключ в одной из таблиц.
-- №2.	Без оператора JOIN, верните заголовок публикации, текст с описанием, идентификатор клиента, опубликовавшего публикацию и логин данного клиента.

SELECT t1.title,t1.full_text,t1.user_id,t2.login
from posts as t1, clients as t2
where t1.user_id=t2.id

-- №3.	Выполните поиск  по публикациям, автором котоырх является клиент "Mikle".

SELECT t1.title,t1.full_text
from posts as t1, clients as t2
where t1.user_id=t2.id and t2.login='Mikle'
