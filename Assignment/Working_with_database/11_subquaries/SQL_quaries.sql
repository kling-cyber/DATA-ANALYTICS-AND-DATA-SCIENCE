-- TASK 11: SUBQUERIES

-- QUESTION 1
SELECT restaurant_name, rating
FROM Restaurants
WHERE rating > (SELECT AVG(rating) FROM Restaurants);

-- QUESTION 2
SELECT user_name,
       (SELECT COUNT(*)
        FROM Orders o
        WHERE o.user_id = u.user_id) AS total_order_count
FROM Users u;

-- QUESTION 3
SELECT title
FROM Movies
WHERE movie_id IN (
    SELECT movie_id
    FROM Reviews
    WHERE rating = 5
);

-- QUESTION 4
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
