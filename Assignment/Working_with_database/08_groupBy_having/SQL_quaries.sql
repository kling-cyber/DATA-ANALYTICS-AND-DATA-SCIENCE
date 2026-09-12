USE foodie_app;

-- TASK 8: GROUP BY & HAVING

-- QUESTION 1: Create Orders table and insert sample records
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    payment_method VARCHAR(30) CHECK (payment_method IN ('UPI', 'Card', 'Wallet', 'COD')),
    amount DECIMAL(10,2)
);

INSERT INTO Orders (user_id, payment_method, amount)
VALUES
(1, 'Card', 500.00),
(1, 'UPI', 1250.50),
(2, 'Card', 2300.00),
(5, 'Wallet', 750.75),
(4, 'COD', 1500.00),
(5, 'UPI', 450.25),
(6, 'Card', 3200.80),
(3, 'Wallet', 999.99),
(8, 'COD', 1800.50),
(11, 'UPI', 2750.00),
(15, 'Card', 650.40);

-- QUESTION 2: Count orders placed using each payment method
SELECT payment_method, COUNT(order_id) AS Total_orders
FROM Orders
GROUP BY payment_method;

-- QUESTION 3: Find the total amount spent by each user
SELECT user_id, SUM(amount) AS total_amount
FROM Orders
GROUP BY user_id;

-- QUESTION 4: Show payment methods with average order amount greater than 300
SELECT payment_method, AVG(amount) AS average_amount
FROM Orders
GROUP BY payment_method
HAVING AVG(amount) > 300;

-- QUESTION 5: WHERE filters rows before grouping, while HAVING filters groups after grouping
SELECT *
FROM Orders
WHERE amount > 300;

SELECT payment_method, AVG(amount) AS average_amount
FROM Orders
GROUP BY payment_method
HAVING AVG(amount) > 300;

-- WHERE and HAVING can also be used together
SELECT payment_method, AVG(amount) AS average_amount
FROM Orders
WHERE amount > 100
GROUP BY payment_method
HAVING AVG(amount) > 300;