-- TASK 18: INTERVIEW QUESTIONS

-- QUESTION 1: Artists who uploaded more than 3 songs
SELECT artist_name,
       COUNT(song_id) AS number_of_song
FROM songs
GROUP BY artist_name
HAVING COUNT(song_id) > 3;

-- QUESTION 2: Total order amount for each user
SELECT u.username,
       COALESCE(SUM(o.amount), 0) AS total_order_amount
FROM users u
LEFT JOIN orders o
    ON o.user_id = u.user_id
GROUP BY u.username;

-- QUESTION 3: Restaurants rated above the overall average
SELECT name, rating
FROM restaurants
WHERE rating > (
    SELECT AVG(rating)
    FROM restaurants
);

-- QUESTION 4: Transaction amount and running total for each user
SELECT user_id,
       amount,
       transaction_date,
       SUM(amount) OVER (
           PARTITION BY user_id
           ORDER BY transaction_date
       ) AS running_total
FROM transactions;

-- QUESTION 5: Query optimization suggestions
-- 1. Create a composite index on (category, price) to speed up filtering on both columns.
-- 2. Select only the required columns instead of SELECT * to reduce the amount of data read and returned.
