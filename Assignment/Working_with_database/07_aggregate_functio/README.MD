## **Q.1 Create a table called Orders with columns: order_id, user_name, total_amount, and order_date. Insert 5 sample rows with different users and order amounts, including at least one NULL value for total_amount.**

```sql
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(70) NOT NULL,
    total_amount DECIMAL(10,2),
    order_date DATE 
);
```
```sql
INSERT INTO Orders (user_name, total_amount, order_date)
VALUES ('Jaydeep', 1250.50, '2026-08-01'),
('Rahul', NULL, '2026-08-02'),
('Amit', 850, '2026-08-03'),
('Priya', 2100.75, '2026-08-04'),
('Neha', 560.25, '2026-08-05');
```

## **Q.2 Write a SQL query to count how many orders were placed by each user in the Orders table, displaying user_name and the number of orders as order_count.** 

```sql
SELECT user_name, COUNT(order_date) AS order_count FROM Orders
GROUP BY user_name;
```
## **Q.3 Write a SQL query to calculate the average total_amount of all orders in the Orders table, making sure to ignore any NULL values.**
- Aggrigation Function Automatically ignore `NULL` valus so we can not use any condtion function

```sql
    SELECT AVG(total_amount) AS Average FROM Orders; 
```
## **Q.4 Suppose you are building a Flipkart-style dashboard: Write a SQL query to find the highest and lowest order amounts (MAX and MIN) from the Orders table, and display both values in a single result row.**

```sql
SELECT MAX(total_amount) AS highest_amount_order ,
MIN(total_amount) AS Lowest_amount_order FROM Orders;
```
## **Q.5 Write a SQL query to calculate the total sales (SUM of total_amount) for all orders, but only include orders where total_amount is not NULL.**

```sql
SELECT SUM(total_amount) AS total_sales FROM Orders;
```
- **As Per Question Use a WHERE clause to filter out NULL values before applying the SUM function.**

```sql
SELECT SUM(total_amount) AS total_sales FROM Orders
WHERE total_amount IS NOT NULL ;
```
