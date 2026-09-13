-- TASK 16: SQL PROJECT - SALES ANALYSIS

-- QUESTION 1: Create FoodOrders and import the CSV data
CREATE TABLE FoodOrders (
    order_id INT PRIMARY KEY,
    restaurant_name VARCHAR(150),
    customer_name VARCHAR(150),
    order_amount DECIMAL(10,2),
    order_date DATE
);

LOAD DATA LOCAL INFILE 'orders.csv'
INTO TABLE FoodOrders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id, restaurant_name, customer_name, order_amount, order_date);

-- QUESTION 2: Create TopSongs and insert 5 popular tracks
CREATE TABLE TopSongs (
    song_id INT PRIMARY KEY AUTO_INCREMENT,
    song_title VARCHAR(150) NOT NULL,
    artist VARCHAR(100) NOT NULL,
    streams BIGINT NOT NULL,
    release_date DATE NOT NULL
);

INSERT INTO TopSongs (song_title, artist, streams, release_date)
VALUES
('Blinding Lights', 'The Weeknd', 5000000000, '2019-11-29'),
('Shape of You', 'Ed Sheeran', 4000000000, '2017-01-06'),
('Someone Like You', 'Adele', 3000000000, '2011-01-24'),
('As It Was', 'Harry Styles', 3000000000, '2022-04-01'),
('Stay', 'The Kid LAROI & Justin Bieber', 3000000000, '2021-07-09');

-- QUESTION 3: Top 3 customers by total order amount
SELECT customer_name,
       SUM(order_amount) AS total_spent
FROM FoodOrders
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 3;

-- QUESTION 4: Restaurant performance report
SELECT restaurant_name,
       COUNT(order_id) AS number_of_orders,
       SUM(order_amount) AS total_order_amount
FROM FoodOrders
GROUP BY restaurant_name
ORDER BY total_order_amount DESC;

-- QUESTION 5: Dashboard KPIs
SELECT 'average_order_amount' AS kpi_name,
       AVG(order_amount) AS kpi_value
FROM FoodOrders

UNION ALL

SELECT 'number_of_customers' AS kpi_name,
       COUNT(DISTINCT customer_name) AS kpi_value
FROM FoodOrders;