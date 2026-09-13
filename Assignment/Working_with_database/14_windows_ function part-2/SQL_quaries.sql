-- TASK 14: WINDOW FUNCTIONS PART 2

-- QUESTION 1: Create Orders table and insert sample rows
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10,2)
);

INSERT INTO Orders (user_id, order_date, total_amount) VALUES
(1, '2026-01-05', 1250.00),
(2, '2026-01-08', 850.50),
(3, '2026-01-12', 2100.75),
(1, '2026-01-15', 675.00),
(4, '2026-01-20', 3200.00),
(5, '2026-02-02', 1450.25),
(2, '2026-02-10', 980.00),
(3, '2026-02-15', 560.50),
(6, '2026-02-18', 2750.00),
(4, '2026-02-25', 1125.75);

-- QUESTION 2: Show each user's previous order amount
SELECT order_id, order_date,
       LAG(total_amount) OVER (
           PARTITION BY user_id
           ORDER BY order_date
       ) AS previous_amount
FROM Orders;

-- QUESTION 3: Show each user's next order amount
SELECT order_id, order_date,
       LEAD(total_amount) OVER (
           PARTITION BY user_id
           ORDER BY order_date
       ) AS next_order_amount
FROM Orders;

-- QUESTION 4: Calculate the running total for each user
SELECT order_id, order_date, total_amount,
       SUM(total_amount) OVER (
           PARTITION BY user_id
           ORDER BY order_date
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS running_total
FROM Orders;

-- QUESTION 5: Calculate a 3-order moving average for each user
SELECT order_id, order_date, user_id, total_amount,
       SUM(total_amount) OVER (
           PARTITION BY user_id
           ORDER BY order_date
           ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
       ) /
       COUNT(total_amount) OVER (
           PARTITION BY user_id
           ORDER BY order_date
           ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
       ) AS moving_avg
FROM Orders;