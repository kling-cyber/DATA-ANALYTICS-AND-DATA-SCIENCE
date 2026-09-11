## **Create a table called Orders with columns: order_id, user_id, payment_method, and amount. Insert at least 8 sample records representing different users and payment methods (like UPI, Card, Wallet, COD).**

```sql 
TABLE CREATE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NUll,
    payment_method VARCHAR(30) CHECK (payment_method IN('UPI', 'Card', 'Wallet', 'COD' )),
    amount DECIMAL (10,2) 
    );
```
## **insert Data** 
```sql
INSERT INTO Orders (user_id, payment_method,amount) 
VALUES (1,'card',)
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
```
## **Write an SQL query to count how many orders were placed using each payment_method in the Orders table.**

```sql
SELECT payment_method , COUNT(order_id) AS Total_orders
FROM Orders 
GROUP BY payment_method ;
```

## **Write an SQL query to find the total amount spent by each user_id in the Orders table. Display user_id and their total spend.**

```sql
SELECT user_id, SUM(amount) AS total_amount
FROM Orders;
```

## **Write an SQL query to show only those payment methods where the average order amount is greater than 300, using GROUP BY and HAVING.Use AVG(amount) in your HAVING clause.**

```sql
SELECT payment_method , AVG(amount) FROM Orders
GROUP BY payment_method HAVING AVG(amount) > 300;
```
## **Explain the difference between WHERE and HAVING by giving one example query for each, using the Orders table. Your examples should show a scenario where WHERE and HAVING filter different things.**

## Difference Between WHERE and HAVING
*WHERE Filter data according to contion on before gruop by*
```sql
SELECT * FROM Orders
WHERE amount > 300;
```

*HAVING Is use use to filter data after group by*
```sql
SELECT payment_method , AVG(amount) FROM Orders
GROUP BY payment_method HAVING AVG(amount) > 300;
```
**We can use WHERE and HAVING togather**

```sql
SELECT payment_method , AVG(amount) FROM Orders
WHERE amount > 100 
GROUP BY payment_method HAVING AVG(amount) > 300;
```
## **execution concept**
```
1. FROM Orders
       ↓
2. WHERE amount > 100
       ↓
   Remove individual orders ≤ 100
       ↓
3. GROUP BY payment_method
       ↓
   Create groups: UPI, Card, Wallet, COD
       ↓
4. AVG(amount)
       ↓
   Calculate average for each group
       ↓
5. HAVING AVG(amount) > 300
       ↓
   Keep only groups with average > 300
```


| WHERE | HAVING |
|---|---|
| Filters **Rows** | Filters **Groups** |
| Used **Before `GROUP BY`** | Used **After `GROUP BY`** |
| Normally used with **individual columns** | Commonly used with **aggregate functions** |
| Cannot use aggregate functions directly | Can use aggregate functions |