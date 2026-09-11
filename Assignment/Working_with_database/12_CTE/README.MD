# 1.  Create a CTE using the WITH clause to select all products with a rating above 4.5 from a 'Products' table, similar to how Flipkart or Myntra might highlight top-rated items.

```sql
WITH all_product AS (
    SELECT * FROM Products WHERE rating > 4.5 
)
SELECT * FROM all_product ;
```

# 2.  Rewrite a query that finds all restaurants in 'Ahmedabad' with delivery charges under 50 from a 'Restaurants' table, first using a subquery and then using a CTE. Compare both queries for readability.>
- *Subquery*

```sql
SELECT * FROM restaurants r WHERE city = 'Ahmedabad' AND r.id IN (
    SELECT r2.id FROM restaurants r2 
    WHERE delivery_charge < 50
);
```
- *CTE*
```sql
with ahmd_del_under50 as (
     SELECT * FROM restaurants where city = 'Ahmedabad' and delivery_charge < 50
)

SELECT * FROM ahmd_del_under50;
```

- We see here `CTE` is more readable

# 3. Using two CTEs in a single query, find the top 3 most-followed users and the top 3 most-liked posts from a 'Users' and 'Posts' table (think Instagram-style data). Output both lists in the same result set.

```sql
WITH most_followed as (
SELECT * FROM Users ORDER BY followers DESC LIMIT 3
),
most_liked AS (
    SELECT * FROM Posts ORDER BY likes DESC LIMIT 3 
)

SELECT name ,followers FROM most_followed
UNION
SELECT post_name , likes FROM most_liked ;
```

# 4. Write a recursive CTE that generates a list of dates for the next 7 days starting from today, similar to how BookMyShow shows available dates for movie bookings.<br><br><em><strong>Hint:</strong> Use a base case for today and recursion to add one day at a time.</em>

```sql
WITH RECURSIVE seven_days AS 
( SELECT CURDATE() AS today
UNION ALL
SELECT today + INTERVAL + 1 DAY 
FROM seven_days 
WHERE today < CURDATE() + INTERVAL + 6 DAY
)
SELECT * FROM seven_days
```

# 5. Given a messy SQL query that finds all users with more than 1000 followers from a 'Users' table, refactor it to use a CTE for better clarity and maintainability.

```sql
WITH follower_morethan_1k AS (
    SELECT * FROM Users WHERE followers > 1000 
)
SELECT * FROM follower_morethan_10k ;
```
