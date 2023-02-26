-- I'm a restaurant owner
-- create 5 Tables
-- 1x Fact, 4x Dimensions
-- search google -> how to add a foreign key
-- write SQL 3-5 queries to analyze data
-- 1x subquery/ with

CREATE TABLE dimMenu (
  menuID INT PRIMARY KEY,
  menuName TEXT,
  price REAL
);

INSERT INTO dimMenu VALUES
  -- Hot drinks
	(111, 'Americano 8oz', 2.10),
	(112, 'Americano 12oz', 2.30),
	(113, 'Americano 16oz', 2.50),
	(121, 'Latte 8oz', 2.30),
  (122, 'Latte 12oz', 2.50),
  (123, 'Latte 16oz', 2.70),
  (131, 'Cappucino 8oz', 2.30),
  (132, 'Cappucino 12oz', 2.50),
  (133, 'Cappucino 16oz', 2.70),
  (141, 'Flat White 8oz', 2.30),
  (151, 'Mocha 8oz', 2.60),
  (152, 'Mocha 12oz', 2.80),
  (153, 'Mocha 16oz', 3.00),
  (161, 'Double Espresso', 2.00),
  (162, 'Double Macchiato', 2.10),
  (163, 'Tea', 1.60),
  (164, 'Hearbal Tea', 1.70),
  (165, 'Cream and Marshmellows', 0.40),
  (171, 'Hot Chocolate 8oz', 2.50),
  (172, 'Hot Chocolate 12oz', 2.80),
  (173, 'Hot Chocolate 16oz', 3.00),
  (181, 'Chai Latte 8oz', 2.30),
  (182, 'Chai Latte 12oz', 2.50),
  (183, 'Chai Latte 16oz', 2.70),
  (191, 'Matcha Latte 8oz', 2.30),
  (192, 'Matcha Latte 12oz', 2.50),
  (193, 'Matcha Latte 16oz', 2.80),
  -- Cold drinks
  (212, 'Iced Black 12oz', 2.20),
	(213, 'Iced Black 16oz', 2.40),
  (222, 'Iced Latte 12oz', 2.50),
	(223, 'Iced Latte 16oz', 2.70),
  (232, 'Iced Mocha 12oz', 2.60),
	(233, 'Iced Mocha 16oz', 2.80),
  (242, 'Frappe 12oz', 3.50),
	(243, 'Frappe 16oz', 3.80),
  (252, 'Milkshakes 12oz', 3.50),
	(253, 'Milkshakes 16oz', 3.80),
  (262, 'Smoothies 12oz', 3.00),
	(263, 'Smoothies 16oz', 3.30),
  -- Extras
  (310, 'Coffee Shot', 0.80),
  (320, 'Syrups', 0.50),
  (330, 'Altenative Milks', 0.40);

CREATE TABLE dimCustomers (
	customerID INT PRIMARY KEY,
	firstname TEXT,
	lastname TEXT,
	phoneNr TEXT
);

INSERT INTO dimCustomers VALUES
	(1, 'Nicholas', 'Woods', '+44 8081 570932'),
	(2, 'Brandom', 'Harrison', '+44 118 496 0356'),
	(3, 'Raymond', 'Edwards', '+44 131 496 0291 '),
	(4, 'Robert', 'Wright', '+44 7700 900451'),
	(5, 'Donna', 'Richardson', '+44 7700 900600'),
	(6, 'Sandra', 'Taylor', '+44 113 496 0622'),
	(7, 'Jacob', 'Baker', '+44 8081 5702973'),
	(8, 'Lois', 'Scott', '+44 7700 900884'),
	(9, 'Carolyn', 'Mitchell', '+44 7700 900103'),
	(10, 'Thomas', 'Lewis', '+44 7700 900116'),
  (11, 'Jason', 'Simpson', '+44 7438 140865'),
  (12, 'Catherine', 'Watson', '+44 07226 136284'),
  (13, 'Janet', 'Clark', '+44 7725 34255'),
  (14, 'Robert', 'Lee', '+44 4181 16903'),
  (15, 'Melissa', 'Martin', '+44 1970 700552'),
  (16, 'Scott', 'Lewis', '+44 7398 884307'),
  (17, 'Henry', 'Brown', '+44 3297 30104'),
  (18, 'Douglas', 'Hall', '+44 2022 799238'),
  (19, 'Brenda', 'Walker', '+44 9920 869945'),
  (20, 'Daniel', 'Anderson', '+44 9050 723850');

CREATE TABLE dimStaff (
	staffID INT PRIMARY KEY,
	firstname TEXT,
	lastname TEXT,
	hiredate DATE
);

INSERT INTO dimStaff VALUES
	(1, 'Matthew', 'Martin', '2021-10-15'),
	(2, 'Alexander', 'Anderson ', '2022-12-01'),
	(3, 'Timothy', 'Morris', '2021-06-25');

CREATE TABLE dimPayment (
	paymentID INT PRIMARY KEY,
	paymentMethod TEXT
);

INSERT INTO dimPayment VALUES
	(1, 'cash'),
	(2, 'cashless IDcard'),
	(3, 'credit cards'),
	(4, 'visa dabit');

CREATE TABLE dimOrders (
	orderID INT PRIMARY KEY,
	orderDate DATE,
	orderTime TIMESTAMP,
	menuID INT,
	customerID INT,
  paymentID INT,
	staffID INT,
		FOREIGN KEY (menuID)     REFERENCES dimMenu(menuID)
    FOREIGN KEY (customerID) REFERENCES dimCustomers(customerID)
    FOREIGN KEY (paymentID)  REFERENCES dimPayment(paymentID)
		FOREIGN KEY (staffID)    REFERENCES dimStaff(staffID)
);

INSERT INTO dimOrders VALUES
	(1, '2023-01-13', '07:34:15', 112, 20, 2, 1),
	(2, '2023-01-13', '08:03:28', 133, 15, 2, 2),
	(3, '2023-01-13', '08:04:18', 161, 4, 4, 3),
	(4, '2023-01-13', '08:04:14', 173, 12, 4, 1),
	(5, '2023-01-13', '08:17:25', 122, 7, 4, 2),
	(6, '2023-01-13', '08:20:47', 141, 17, 3, 3),
	(7, '2023-01-13', '08:23:05', 122, 8, 1, 1),
	(8, '2023-01-13', '08:29:54', 182, 18, 3, 2),
	(9, '2023-01-13', '08:30:47', 222, 1, 4, 3),
	(10, '2023-01-13', '08:34:15', 253, 11, 2, 1),
	(11, '2023-01-13', '08:37:51', 132, 14, 2, 2),
	(12, '2023-01-13', '08:42:34', 122, 13, 4, 3),
	(13, '2023-01-13', '08:48:31', 132, 3, 4, 1),
	(14, '2023-01-13', '08:50:29', 172, 6, 3, 2),
	(15, '2023-01-13', '08:53:19', 122, 16, 3, 3);

/*---------------------------------------------------*/

.mode table
.header on
  
-- query --
-- all of orders
SELECT 
	*
FROM (
	SELECT
		o.orderID AS 'NO.',
		o.orderDate AS ORDER_DATE,
		o.orderTime AS ORDER_TIME,
		m.menuName AS MENU,
		'£ ' || m.price AS PRICE,
		c.firstname || ' ' || c.lastname AS CUSTUMER_NAME,
		s.firstname STAFF
	FROM dimOrders o
	JOIN dimMenu m      ON o.menuID = m.menuID
	JOIN dimCustomers c ON o.customerID = c.customerID
	JOIN dimStaff s     ON o.staffID = s.staffID
) AS sub ;


-- menu best saller top 3
SELECT
		m.menuName AS MENU_NAME,
   	COUNT(m.price) AS QTY,
		'£ ' || SUM(m.price) AS TOTAL_PRICE
FROM dimOrders o
JOIN dimMenu m ON o.menuID = m.menuID
GROUP BY 1
ORDER BY 2 DESC
LIMIT 3;

-- amount of payment
SELECT
		paymentMethod AS PAYMENT_METHOD,
    COUNT(*) AS 'COUNT'
FROM dimOrders o
JOIN dimPayment p ON o.paymentID = p.paymentID
GROUP BY 1
ORDER BY 2 DESC;

-- staff who in probation period 
WITH workDay AS (
	SELECT
      firstname || ' ' || lastname STAFF_NAME,
      hiredate,
	  ROUND(JULIANDAY() - JULIANDAY(hiredate)) AS workDay 
	FROM dimStaff
)

SELECT
		STAFF_NAME,
   	hiredate AS HIRE_DATE ,
    CASE
    	WHEN workDay < 90 THEN 'PROBATION'
        ELSE 'PASS'
    END AS PROBATION_PERIOD
FROM workDay;
