# 1. Create a table called Orders with columns: order_id, user_id, order_date, and total_amount. Insert at least 7 sample rows representing different users and dates.

```sql
CREATE TABLE Orders (
order_id INT AUTO_INCREMENT PRIMARY KEY,
user_id INT NOT NULL,
order_date DATE NOT NULL,
total_amount DECIMAL(10,2));
```
# *INSERT DATA*

```sql
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
```
# 2. Write a SQL query using the LAG() function to show each user's order_id, order_date, and the total_amount of their previous order (if any), ordered by user and date.Use PARTITION BY user_id and ORDER BY order_date in your window function.

```sql
SELECT order_id, order_date, 
LAG(total_amount) OVER(PARTITION BY user_id ORDER BY order_date) AS previous_amount FROM Orders ;
```

# 3. Using the same Orders table, write a SQL query with the LEAD() function to display each order_id, order_date, and the next order's total_amount for the same user.

```sql
SELECT order_id, order_date, 
LEAD(total_amount) OVER(PARTITION BY user_id ORDER BY order_date) AS next_order_amount FROM Orders ;
```
# 4. Write a SQL query to calculate the running total of total_amount for each user, showing order_id, order_date, total_amount, and a column running_total that accumulates the sum as you move through each user's orders.<br><br><em> Use SUM(total_amount) OVER (PARTITION BY user_id ORDER BY order_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW).</em>

```sql
SELECT order_id, order_date, total_amount, SUM(total_amount) OVER(PARTITION BY user_id 
ORDER BY order_date
ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total FROM Orders ;
```

# 5. Write a SQL query to calculate a 3-order moving average of total_amount for each user, showing order_id, order_date, total_amount, and moving_avg columns.<br><br><em><strong>Constraint:</strong> Use SUM() OVER() with ROWS BETWEEN 2 PRECEDING AND CURRENT ROW to compute the moving average.</em>

```sql
SELECT order_id, order_date, user_id, total_amount,
SUM(total_amount) OVER(
    PARTITION BY user_id
    ORDER BY order_date
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
) /
COUNT(total_amount) OVER(
    PARTITION BY user_id
    ORDER BY order_date
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
) AS moving_avg
FROM Orders;
```
