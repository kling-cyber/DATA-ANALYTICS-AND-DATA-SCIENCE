USE music_detail_app;
-- QUESTION 1: Create 'restaurants' and 'dishes' relational tables
CREATE TABLE restaurants_list (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL
);

CREATE TABLE dishes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    restaurant_id INT,
    dish_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

-- Inserting at least 3 restaurants and 2-3 dishes for each
INSERT INTO restaurants_list (name, city) VALUES 
('TGT - The Grand Thakar', 'Rajkot'), 
('Wisteria Cafe', 'Surat'), 
("La Pino'z Pizza", 'Ahmedabad');

INSERT INTO dishes (restaurant_id, dish_name, price) VALUES 
(1, 'Gujarati Thali', 320.00), 
(1, 'Khandvi', 90.00),
(2, 'Sizzler', 450.00), 
(2, 'Pasta', 280.00),
(3, 'Cheese Burst Pizza', 350.00),
(99, 'Ghost Burger', 190.00); -- Simulated orphaned dish (ID 99 doesn't exist in restaurants)

-- QUESTION 2: Zomato-style INNER JOIN

SELECT d.dish_name, d.price, r.name AS restaurant_name, r.city 
FROM dishes d
INNER JOIN restaurants_list r ON d.restaurant_id = r.id;


-- QUESTION 3: LEFT JOIN showing restaurants even with an empty menu

SELECT r.name AS restaurant_name, r.city, d.dish_name, d.price 
FROM restaurants_list r
LEFT JOIN dishes d ON r.id = d.restaurant_id;


-- QUESTION 4: RIGHT JOIN capturing unlinked data errors

SELECT r.name AS restaurant_name, d.dish_name, d.price 
FROM restaurants_list r
RIGHT JOIN dishes d ON r.id = d.restaurant_id;


-- QUESTION 5: Spotify Scenario Playlist JOIN Choice (Answered in your .md)

-- We use a LEFT JOIN starting from Playlists to track empty listings cleanly.
