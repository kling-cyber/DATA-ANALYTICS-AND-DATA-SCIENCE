# S4.
## You are managing a food delivery database with three tables: orders, restaurants and customers. A business team asks for a report showing every restaurant's name and total revenue, including restaurants that have not yet received any orders.

- Q. Explain which SQL JOIN type must be used to include restaurants with zero orders and describe what would happen if an INNER JOIN were used instead. Justify your choice of join type in terms of how it handles unmatched rows between the two tables.

```sql
SELECT r.name,
       COALESCE(SUM(o.order_value), 0) AS total_revenue
FROM restaurants r
LEFT JOIN orders o
    ON o.restaurant_id = r.restaurant_id
GROUP BY r.restaurant_id, r.name;
```
- I use `LEFT JOIN` because it keeps all rows from the left table, `restaurants`, even when there is no matching record in the `orders` table. This allows us to see restaurants with zero orders.
- `COALESCE` replaces the `NULL` result for restaurants with no orders with `0`, making the report easier to read.
- If we use `INNER JOIN`, only restaurants having matching rows in both tables will be returned, so restaurants with zero orders will not appear.

# S5
## You are working on a food delivery analytics dashboard. Management wants to rank all delivery agents within each city by their number of completed deliveries for the current month, and also display how each agent's count compares to the agent ranked directly above them in that city.

- Q. Identify the two SQL window functions you would use, one for ranking and one for retrieving the previous row's value, and explain why using window functions with `PARTITION BY` produces more accurate and maintainable results for this requirement than a `GROUP BY` with a self-join or correlated subquery approach.

```sql
WITH agent_deliveries AS (
    SELECT name,
           city,
           COUNT(*) AS total_deliveries
    FROM delivery
    WHERE status = 'Completed'
      AND MONTH(delivery_date) = MONTH(CURDATE())
      AND YEAR(delivery_date) = YEAR(CURDATE())
    GROUP BY city, name
)
SELECT name,
       city,
       total_deliveries,
       DENSE_RANK() OVER (
           PARTITION BY city
           ORDER BY total_deliveries DESC
       ) AS ranking,
       LAG(total_deliveries) OVER (
           PARTITION BY city
           ORDER BY total_deliveries DESC
       ) AS previous_value
FROM agent_deliveries;
```

- `DENSE_RANK()` ranks the delivery agents within each city.
- `LAG()` retrieves the delivery count of the previous agent in the ranking order.
- `PARTITION BY city` makes both calculations independent for each city. Window functions are more maintainable because the ranking and previous-row comparison can be performed directly without complex self-joins or correlated subqueries.
- The `status = 'Completed'` condition ensures that only completed deliveries are counted, matching the requirement.

# S6
## You are optimising a SQL report for a food delivery operations team. The report first identifies the top 5 restaurant categories by total order count, and then retrieves the full order details only for restaurants belonging to those top categories. A colleague has written this as a deeply nested subquery inside the WHERE clause.

- Q. Compare using a CTE (`WITH` clause) versus a nested subquery for this two-step requirement. Evaluate the trade-offs in terms of readability, ability to reuse the intermediate result, and debuggability. In what specific situation would you prefer the nested subquery over a CTE?

### CTE approach

```sql
WITH top_five_categories AS (
    SELECT r.category
    FROM restaurants r
    JOIN orders o
        ON o.restaurant_id = r.restaurant_id
    GROUP BY r.category
    ORDER BY COUNT(o.order_id) DESC
    LIMIT 5
)
SELECT o.*
FROM orders o
JOIN restaurants r
    ON r.restaurant_id = o.restaurant_id
JOIN top_five_categories t
    ON t.category = r.category;
```

### Nested subquery approach

```sql
SELECT o.*
FROM orders o
JOIN restaurants r
    ON r.restaurant_id = o.restaurant_id
WHERE r.category IN (
    SELECT r2.category
    FROM restaurants r2
    JOIN orders o2
        ON o2.restaurant_id = r2.restaurant_id
    GROUP BY r2.category
    ORDER BY COUNT(o2.order_id) DESC
    LIMIT 5
);
```

- A `CTE` makes the two-step logic easier to read because the intermediate result has a meaningful name such as `top_five_categories`.
- A CTE is also easier to reuse if the intermediate result is needed more than once, and it is easier to debug because the CTE can be tested separately.
- A nested subquery is preferable when the intermediate result is used only once and the condition is small and simple. In that situation, a CTE can add unnecessary structure to an otherwise straightforward query.
