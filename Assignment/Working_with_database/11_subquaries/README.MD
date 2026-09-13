# TASK 11: SUBQUERIES

## QUESTION 1
Find all restaurants whose average rating is higher than the average rating of all restaurants in the city.

```sql
SELECT restaurant_name, rating
FROM Restaurants
WHERE rating > (SELECT AVG(rating) FROM Restaurants);
```

## QUESTION 2
Display each user's name and their total order count using a subquery in SELECT.

```sql
SELECT user_name,
       (SELECT COUNT(*)
        FROM Orders o
        WHERE o.user_id = u.user_id) AS total_order_count
FROM Users u;
```

## QUESTION 3
List movies that have at least one 5-star review using IN with a subquery.

```sql
SELECT title
FROM Movies
WHERE movie_id IN (
    SELECT movie_id
    FROM Reviews
    WHERE rating = 5
);
```

## QUESTION 4
Find sellers who sold products in every category in Categories using nested subqueries.

```sql
SELECT s.seller_id, s.seller_name
FROM Sellers s
WHERE (
    SELECT COUNT(DISTINCT p.category_id)
    FROM Products p
    WHERE p.seller_id = s.seller_id
) = (
    SELECT COUNT(*)
    FROM Categories
);
```
