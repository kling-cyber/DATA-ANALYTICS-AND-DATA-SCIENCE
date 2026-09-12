-- TASK 6: ORDER BY & SORTING

-- Q1. Display all products sorted by price in ascending order
SELECT product_name, price
FROM products
ORDER BY price ASC;

-- Q2. Display the top 5 most expensive products
SELECT product_name, price
FROM products
ORDER BY price DESC
LIMIT 5;

-- Q3. Sort movies by latest release year first,
-- then by highest rating first
SELECT title, release_year, rating
FROM movies
ORDER BY release_year DESC, rating DESC;

-- Q4. Display the first 10 restaurants alphabetically by name
SELECT name
FROM restaurants
ORDER BY name ASC
LIMIT 10;

-- Q5. Display the top 3 trending songs by play count.
-- If play counts are tied, the more recently added song comes first.
SELECT song_name, added_date, play_count
FROM songs
ORDER BY play_count DESC, added_date DESC
LIMIT 3;
