USE foodie_app;

-- Q1. Create the Restaurants table
CREATE TABLE Restaurants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    cuisine VARCHAR(100),
    rating DECIMAL(3,1),
    city VARCHAR(150)
);

-- Sample restaurant records
INSERT INTO Restaurants (name, cuisine, rating, city) VALUES
('TGT - The Grand Thakar', 'North Indian, Fast Food', 4.8, 'Rajkot'),
('Dough & Doppio', 'Desserts, Coffee, Tea, Beverages', 4.6, 'Rajkot'),
('Wisteria Cafe', 'Cafe, North Indian', 4.3, 'Surat'),
('The Secret Kitchen', 'North Indian, Chinese', 3.7, 'Rajkot'),
("La Pino'z Pizza", 'Pizza, Pasta, Italian', 4.0, 'Ahmedabad'),
('Swagat Restaurant', 'South Indian', 4.2, 'Ahmedabad');

-- Q2. Restaurants with rating > 4.0 in Ahmedabad or Surat
SELECT name
FROM Restaurants
WHERE city IN ('Ahmedabad', 'Surat')
  AND rating > 4.0;

-- Q3. Restaurant names starting with 'Swa'
SELECT name
FROM Restaurants
WHERE name LIKE 'Swa%';

-- Q4. Restaurants with ratings between 3.5 and 4.5 inclusive
SELECT name, rating
FROM Restaurants
WHERE rating BETWEEN 3.5 AND 4.5;

-- Q5. Restaurants serving Chinese, Italian, or South Indian cuisine
SELECT name, cuisine
FROM Restaurants
WHERE cuisine IN ('Chinese', 'Italian', 'South Indian');
