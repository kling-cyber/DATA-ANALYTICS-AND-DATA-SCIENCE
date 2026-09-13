# 1. Create a SQL table called Restaurant with columns: id, name, cuisine, location, and average_rating. Insert at least 5 sample rows representing popular restaurants from Zomato.

- *CREATE TABLE*
```sql
CREATE TABLE Restaurant (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    cuisine VARCHAR(80) NOT NULL,
    location VARCHAR(100) NOT NULL,
    average_rating DECIMAL(2,1)
);
```
- *INSERT DATA*
```sql
INSERT INTO Restaurant 
(name, cuisine, location, average_rating)
VALUES
('The Spice Route', 'Indian', 'Mumbai', 4.5),
('Pizza Paradise', 'Italian', 'Delhi', 4.2),
('Dragon House', 'Chinese', 'Bangalore', 4.3),
('Burger Hub', 'Fast Food', 'Ahmedabad', 4.0),
('Royal Thali', 'Gujarati', 'Rajkot', 4.7);
```

# 2. Write a SQL query to generate a report showing the number of restaurants for each cuisine type from your Restaurant table, ordered by the count in descending order.<br><strong>Hint:</strong> Use GROUP BY and ORDER BY.

```sql
SELECT cuisine , COUNT(id) AS number_of_restaurants
FROM Restaurant GROUP BY cuisine ORDER BY number_of_restaurants DESC ;
```

# 3. Add a new table called Review with columns: id, restaurant_id, user_name, rating, and review_date. Insert at least 10 sample reviews, linking them to restaurants using restaurant_id.

- *CREATE TABLE*
```sql
CREATE TABLE Review (
    id INT PRIMARY KEY AUTO_INCREMENT,
    restaurant_id INT NOT NULL,
    user_name VARCHAR(100) NOT NULL,
    rating DECIMAL(2,1) NOT NULL,
    review_date DATE NOT NULL,
    FOREIGN KEY (restaurant_id) REFERENCES Restaurant(id)
);
```
- *INSERT DATA*
```sql
INSERT INTO Review
(restaurant_id, user_name, rating, review_date)
VALUES
(1, 'Rahul Patel', 4.5, '2026-01-10'),
(1, 'Priya Shah', 4.0, '2026-01-18'),
(2, 'Amit Mehta', 4.5, '2026-02-05'),
(2, 'Neha Joshi', 4.0, '2026-02-14'),
(3, 'Rohan Shah', 4.5, '2026-03-08'),
(3, 'Anjali Patel', 3.5, '2026-03-20'),
(4, 'Vivek Desai', 4.0, '2026-04-12'),
(5, 'Pooja Patel', 4.5, '2026-05-03'),
(5, 'Karan Patel', 5.0, '2026-06-15'),
(5, 'Meera Shah', 4.5, '2026-06-22');
```
# 4. Write a SQL query using a JOIN to display each restaurant's name, cuisine, and its average review rating (from the Review table), ordered by highest average rating first.<br><strong>Hint:</strong> Use JOIN and GROUP BY with aggregate functions.

```sql
SELECT r.name, r.cuisine ,AVG(rw.rating) avg_rating FROM Restaurant r
INNER JOIN Review rw
ON r.id = rw.restaurant_id 
GROUP BY r.id, r.name, r.cuisine  ORDER BY avg_rating DESC;
```

# 5. Use a window function to rank restaurants by their average review rating within each cuisine type, showing the restaurant name, cuisine, average rating, and rank.<br><br><em><strong>Hint:</strong> Use the RANK() or DENSE_RANK() window function partitioned by cuisine.</em>

```sql
SELECT 	r.name , r.cuisine , AVG(rw.rating) AS AVG_rating ,
DENSE_RANK() OVER( PARTITION BY r.cuisine ORDER BY AVG(rw.rating) DESC ) AS RANK_number
FROM Restaurant r
JOIN review rw
ON rw.restaurant_id = r.id
GROUP BY r.name , r.cuisine
ORDER BY AVG_rating DESC ;
```
- Here we use `DENSE_RANK` beacuse it not skip series if same value found
