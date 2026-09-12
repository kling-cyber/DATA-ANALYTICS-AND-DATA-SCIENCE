-- TASK 12: CTE

-- QUESTION 1: Select products with a rating above 4.5
WITH all_product AS (
    SELECT *
    FROM Products
    WHERE rating > 4.5
)
SELECT *
FROM all_product;

-- QUESTION 2: Find Ahmedabad restaurants with delivery charges under 50
-- Subquery
SELECT *
FROM restaurants r
WHERE city = 'Ahmedabad'
  AND r.id IN (
      SELECT r2.id
      FROM restaurants r2
      WHERE delivery_charge < 50
  );

-- CTE
WITH ahmd_del_under50 AS (
    SELECT *
    FROM restaurants
    WHERE city = 'Ahmedabad'
      AND delivery_charge < 50
)
SELECT *
FROM ahmd_del_under50;

-- CTE is more readable because the filtering logic is defined separately.

-- QUESTION 3: Top 3 most-followed users and top 3 most-liked posts
WITH most_followed AS (
    SELECT *
    FROM Users
    ORDER BY followers DESC
    LIMIT 3
),
most_liked AS (
    SELECT *
    FROM Posts
    ORDER BY likes DESC
    LIMIT 3
)
SELECT 'User' AS list_type, name, followers AS count
FROM most_followed
UNION ALL
SELECT 'Post' AS list_type, post_name, likes AS count
FROM most_liked;

-- QUESTION 4: Generate the next 7 days starting from today
WITH RECURSIVE seven_days AS (
    SELECT CURDATE() AS today
    UNION ALL
    SELECT today + INTERVAL 1 DAY
    FROM seven_days
    WHERE today < CURDATE() + INTERVAL 6 DAY
)
SELECT *
FROM seven_days;

-- QUESTION 5: Users with more than 1000 followers
WITH follower_morethan_1k AS (
    SELECT *
    FROM Users
    WHERE followers > 1000
)
SELECT *
FROM follower_morethan_1k;