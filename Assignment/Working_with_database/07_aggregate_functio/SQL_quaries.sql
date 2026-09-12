-- Select your active working database
USE music_detail_app;

-- QUESTION 1: Table Creation with Mixed Null Sample Data

CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(100) NOT NULL,
    total_amount DECIMAL(10,2), -- Matches your standard price format
    order_date DATE
);

INSERT INTO Orders (user_name, total_amount, order_date) VALUES 
('Kavish', 450.00, '2026-09-10'),
('Rahul', NULL, '2026-09-11'),       -- Intentional NULL row as per requirements
('Kavish', 250.50, '2026-09-11'),
('Amit', 620.00, '2026-09-12'),
('Suresh', 120.00, '2026-09-12');

-- Real-world check statement to verify data state
SELECT * FROM Orders;

-- QUESTION 2: Grouped Transaction Count Per User

SELECT user_name, COUNT(order_id) AS order_count 
FROM Orders 
GROUP BY user_name;

-- QUESTION 3: Average Order Evaluation (Natively Drops NULLs)

SELECT AVG(total_amount) AS average_amount 
FROM Orders;

-- QUESTION 4: Dashboard Min/Max Calculations on a Single Output Row

SELECT MAX(total_amount) AS highest_order, MIN(total_amount) AS lowest_order 
FROM Orders;

-- QUESTION 5: Total Revenue Aggregation with explicit Filter Cleaning

SELECT SUM(total_amount) AS total_sales 
FROM Orders 
WHERE total_amount IS NOT NULL;
