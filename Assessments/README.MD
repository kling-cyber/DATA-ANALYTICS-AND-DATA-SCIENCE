# S4.
## You are managing a food delivery database with three tables: orders , restaurants and customers. A business team asks for a report showing every restaurant's name and total revenue, including restaurants that have not yet received any orders

- Q . Explain which SQL JOIN type must be used to include restaurants with zero orders and describe what would    happen if an INNER JOIN were used instead. Justify your choice of join type in terms of how it handles unmatched rows between the two tables.


```sql
SELECT r.name , COALESCE(SUM(o.order_value),0) AS total_revenue FROM  restaurants r
LEFT JOIN orders o
ON o.restaurant_id = r.restaurant_id
GROUP BY r.name ;
```
- I use `LEFT JOIN` here bacause of left join keep all data from left table`restaurants` even if there is no matching record in `orders` table so we see restaurants with zeor orders. 
- also we use `COALESCE` for replace null value to 0 for better visibility and aggrigation function we will run on it

- if i use `INNER JOIN` then join show only data who is common in both table so we can't see restaurant with zero orders 

# S5
## You are working on a food delivery analytics dashboard. Management wants to rank all delivery agents within each city by their number of completed deliveries for the current month, and also display how each agent's count compares to the agent ranked directly above them in that city

- Q Identify the two SQL window functions you would use — one for ranking and one for 
retrieving the previous row's value — and explain why using window functions with PARTITION BY
produces more accurate and maintainable results for this requirement than a GROUP BY with a
self-join or correlated subquery approach.

```sql
WITH agent_deliveries AS (
SELECT name, city , COUNT(*) AS total_deliveries
FROM delivery
WHERE MONTH(delivery_date) = MONTH(CURDATE())
AND  YEAR(delivery_date) = YEAR(CURDATE())
GROUP BY city ,name
)

SELECT name, city ,total_deliveries ,
DENSE_RANK() OVER(PARTITION BY city ORDER BY total_deliveries DESC ) AS ranking,
LAG(total_deliveries) OVER(PARTITION BY city ORDER BY total_deliveries DESC ) AS previous_value
FROM agent_deliveries ;
```

- Windows function with `PARTITION BY` are more maintainable because they perform ranking and row to row comparision directly within each city without complex complex selft join and co-related subquery.

- this selft join and corelated query saperately write query for each output like
- find agent above
- comparing delivery count
- calculate ranking
- saperating calculation by city 
- so it became hard to maintain and longer

# S 6
## You are optimising a SQL report for a food delivery operations team. The report first identifies the top 5 restaurant categories by total order count, and then retrieves the full order details only for restaurants belonging to those top categories. A colleague has written this as a deeply nested subquery inside the WHERE clause.
 
- Compare using a CTE (WITH clause) versus a nested subquery for this two-step
requirement. Evaluate the trade-offs in terms of readability, ability to reuse the intermediate
result, and debuggability. In what specific situation would you prefer the nested subquery over a
CTE?

```sql
WITH top_five_cuisine AS(
SELECT  r.cuisine , COUNT(o.order_id) AS total_order
FROM restaurants r
INNER JOIN orders o
ON o.rest_id = r.id
GROUP BY  r.cuisine 
ORDER BY total_order DESC
LIMIT 5
) 

SELECT * FROM top_five_cuisine
```

```sql
select * from orders where rest_id in(
    select rest_id from  restaurants
     where cuisine in( 
      SELECT r.cuisine  
       FROM restaurants r
       INNER JOIN orders o
       ON o.rest_id = r.id
       GROUP BY  r.cuisine 
       ORDER BY COUNT(o.order_id) DESC
       LIMIT 5 
   )
);
```
- `CTE` is easy to maintain if we wan't another requirment like we only want some column instead of full order details. by changing last line we gett it
- in nested query we need to change query strucuture so same result
