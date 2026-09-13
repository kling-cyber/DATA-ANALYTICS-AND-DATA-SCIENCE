-- TASK 17: SQL PROJECT - ZOMATO RESTAURANT ANALYSIS

-- QUESTION 1: Create Restaurant table and insert sample restaurants
CREATE TABLE Restaurant (
    id INT PRIMARY KEY,
    name VARCHAR(150),
    cuisine VARCHAR(100),
    location VARCHAR(150),
    average_rating DECIMAL(3,1)
);

INSERT INTO Restaurant (id, name, cuisine, location, average_rating)
VALUES
(1, 'Truffles', 'Continental', 'Bangalore', 4.5),
(2, 'Meghana Foods', 'Biryani', 'Bangalore', 4.4),
(3, 'MTR', 'South Indian', 'Bangalore', 4.6),
(4, 'Toit', 'Italian', 'Bangalore', 4.3),
(5, 'Nagarjuna', 'Andhra', 'Bangalore', 4.2);

-- QUESTION 2: Count restaurants by cuisine type
SELECT cuisine, COUNT(*) AS restaurant_count
FROM Restaurant
GROUP BY cuisine
ORDER BY restaurant_count DESC;

-- QUESTION 3: Create Review table and insert sample reviews
CREATE TABLE Review (
    id INT PRIMARY KEY,
    restaurant_id INT,
    user_name VARCHAR(100),
    rating DECIMAL(3,1),
    review_date DATE,
    FOREIGN KEY (restaurant_id) REFERENCES Restaurant(id)
);

INSERT INTO Review (id, restaurant_id, user_name, rating, review_date)
VALUES
(1, 1, 'Rahul', 5.0, '2026-06-01'),
(2, 1, 'Priya', 4.5, '2026-06-05'),
(3, 2, 'Amit', 4.0, '2026-06-08'),
(4, 2, 'Neha', 4.5, '2026-06-12'),
(5, 3, 'Arjun', 5.0, '2026-06-15'),
(6, 3, 'Sneha', 4.5, '2026-06-18'),
(7, 4, 'Karan', 4.0, '2026-06-20'),
(8, 4, 'Meera', 4.5, '2026-06-22'),
(9, 5, 'Ravi', 5.0, '2026-06-25'),
(10, 5, 'Pooja', 4.5, '2026-06-28');

-- QUESTION 4: Average review rating for each restaurant
SELECT r.name,
       r.cuisine,
       AVG(rv.rating) AS average_review_rating
FROM Restaurant r
JOIN Review rv
    ON r.id = rv.restaurant_id
GROUP BY r.id, r.name, r.cuisine
ORDER BY average_review_rating DESC;

-- QUESTION 5: Rank restaurants by average review rating within each cuisine
SELECT name,
       cuisine,
       average_review_rating,
       RANK() OVER (
           PARTITION BY cuisine
           ORDER BY average_review_rating DESC
       ) AS rating_rank
FROM (
    SELECT r.name,
           r.cuisine,
           AVG(rv.rating) AS average_review_rating
    FROM Restaurant r
    JOIN Review rv
        ON r.id = rv.restaurant_id
    GROUP BY r.id, r.name, r.cuisine
) AS restaurant_ratings;
