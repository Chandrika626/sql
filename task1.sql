CREATE TABLE customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(20),
    city VARCHAR(20),
    phone_number BIGINT
);
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    food_item VARCHAR(20),
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    order_date DATE DEFAULT (CURRENT_DATE),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);
INSERT INTO customers (customer_id, customer_name, city, phone_number) VALUES
(1, 'Aarav Sharma', 'Hyderabad', '9876543210'),
(2, 'Priya Reddy', 'Vijayawada', '9876543211'),
(3, 'Rahul Kumar', 'Guntur', '9876543212'),
(4, 'Sneha Patel', 'Visakhapatnam', '9876543213'),
(5, 'Vikram Singh', 'Warangal', '9876543214'),
(6, 'Anjali Gupta', 'Tirupati', '9876543215'),
(7, 'Kiran Rao', 'Nellore', '9876543216'),
(8, 'Meera Joshi', 'Kakinada', '9876543217'),
(9, 'Rohan Das', 'Rajahmundry', '9876543218'),
(10, 'Pooja Verma', 'Ongole', '9876543219');
INSERT INTO orders (order_id, customer_id, food_item, quantity, price, order_date) VALUES
(101, 1, 'Pizza', 2, 500, CURRENT_DATE),
(102, 2, 'Burger', 1, 150, CURRENT_DATE),
(103, 3, 'Biryani', 3, 750, CURRENT_DATE),
(104, 4, 'Dosa', 2, 120, CURRENT_DATE - INTERVAL 1 DAY),
(105, 5, 'Idli', 4, 160, CURRENT_DATE - INTERVAL 2 DAY),
(106, 6, 'Pasta', 1, 250, CURRENT_DATE - INTERVAL 3 DAY),
(107, 7, 'Noodles', 2, 220, CURRENT_DATE - INTERVAL 4 DAY),
(108, 8, 'Fried Rice', 1, 180, CURRENT_DATE - INTERVAL 5 DAY),
(109, 9, 'Paneer Curry', 2, 400, CURRENT_DATE - INTERVAL 6 DAY),
(110, 10, 'Puri', 3, 150, CURRENT_DATE - INTERVAL 7 DAY),
(111, 1, 'Sandwich', 2, 140, CURRENT_DATE - INTERVAL 8 DAY),
(112, 2, 'Pizza', 1, 250, CURRENT_DATE - INTERVAL 9 DAY),
(113, 3, 'Burger', 2, 300, CURRENT_DATE - INTERVAL 10 DAY),
(114, 4, 'Biryani', 1, 250, CURRENT_DATE - INTERVAL 11 DAY),
(115, 5, 'Dosa', 3, 180, CURRENT_DATE - INTERVAL 12 DAY),
(116, 6, 'Pasta', 2, 500, CURRENT_DATE - INTERVAL 13 DAY),
(117, 7, 'Noodles', 1, 110, CURRENT_DATE - INTERVAL 14 DAY),
(118, 8, 'Fried Rice', 2, 360, CURRENT_DATE - INTERVAL 15 DAY),
(119, 9, 'Paneer Curry', 1, 200, CURRENT_DATE - INTERVAL 16 DAY),
(120, 10, 'Cancelled Order', 1, 0, CURRENT_DATE);
ALTER TABLE customer
ADD PRIMARY KEY (customer_id);
SHOW CREATE TABLE customer;
DESC customer;
SELECT *
FROM orders
WHERE order_date = CURRENT_DATE;
SELECT order_id, customer_id, food_item, quantity, price
FROM orders
WHERE order_date = CURRENT_DATE;
SELECT *
FROM orders
WHERE order_date >= CURRENT_DATE - INTERVAL 7 DAY;
UPDATE orders
SET quantity = 5
WHERE order_id = 101;
UPDATE customer
SET city = 'Hyderabad'
WHERE customer_id = 1;
DELETE FROM orders
WHERE food_item = 'Cancelled Order';
DELETE FROM customer
WHERE customer_id NOT IN (
    SELECT customer_id
    FROM orders
);
DELETE FROM customer
WHERE customer_id NOT IN (
    SELECT customer_id
    FROM orders
);
SELECT c.customer_name, o.food_item
FROM customer c
JOIN orders o
ON c.customer_id = o.customer_id;
SELECT c.customer_name,
       SUM(o.quantity * o.price) AS total_spent
FROM customer c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;
SELECT *
FROM orders
ORDER BY price DESC
LIMIT 1;
SELECT *
FROM orders
ORDER BY price ASC
LIMIT 1;
SELECT CURRENT_DATE,
       CURRENT_TIME,
       CURRENT_TIMESTAMP;
       SELECT order_id,
       order_date,
       DATEDIFF(CURRENT_DATE, order_date) AS days_difference
FROM orders;
SELECT c.customer_name,
       o.food_item,
       o.quantity,
       o.order_date,
       (o.quantity * o.price) AS total_bill
FROM customer c
JOIN orders o
ON c.customer_id = o.customer_id
ORDER BY o.order_date DESC;
