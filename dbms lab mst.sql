CREATE DATABASE SMS;
USE SMS;


CREATE TABLE customer (
    c_id INT PRIMARY KEY,
    c_name VARCHAR(20) NOT NULL,
    c_email VARCHAR(50) UNIQUE
);

INSERT INTO customer (c_id, c_name, c_email)
VALUES
(1, 'RAHUL', 'rahul@gmail.com'),
(2, 'AMIT', 'amit@gmail.com'),
(3, 'AMAN', 'aman@gmail.com'),
(4, 'RAVI', 'ravi@gmail.com'),
(5, 'ARSH', 'arsh@gmail.com');

CREATE TABLE orders (
    o_id INT PRIMARY KEY,
    c_id INT NOT NULL,
    o_name VARCHAR(30) NOT NULL,
    o_quantity INT CHECK (o_quantity > 0),
    o_amount DECIMAL(10,2) NOT NULL CHECK (o_amount > 0),
    o_status VARCHAR(15) DEFAULT 'Pending',
    FOREIGN KEY (c_id) REFERENCES customer(c_id)
);

INSERT INTO orders (o_id, c_id, o_name, o_quantity, o_amount, o_status)
VALUES
(25, 1, 'Biscuits', 5, 6000, 'Done'),
(26, 2, 'Chocolate', 3, 5000, 'Done'),
(35, 3, 'Dry fruits', 8, 12000, 'Done'),
(48, 4, 'Muesli', 10, 4000, 'Done'),
(55, 5, 'Chips', 5, 2000, 'Done');

SELECT * FROM customer;

SELECT * FROM orders;

SELECT * FROM orders
WHERE o_amount > 5000;

SELECT c_id, SUM(o_amount) AS Total_Amount
FROM orders
GROUP BY c_id;

SELECT c_id, SUM(o_amount) AS Total_Amount
FROM orders
GROUP BY c_id
HAVING SUM(o_amount) > 10000;

SELECT AVG(o_amount) AS Average_Amount
FROM orders;

UPDATE orders
SET o_status = 'Pending'
WHERE o_id = 35;

DELETE FROM orders
WHERE o_id = 55;

ALTER TABLE orders
ADD o_number INT;


SELECT * FROM orders;