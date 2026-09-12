USE foodie_app;

-- 1. Fixed data type from INT to DECIMAL to prevent decimal truncation
CREATE TABLE Restaurants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    cuisine VARCHAR(100), 
    rating DECIMAL(3,1), 
    city VARCHAR(150)
);

INSERT INTO Restaurants (name, cuisine, rating, city) VALUES 
('TGT - The Grand Thakar', 'North Indian, Fast Food', 4.8, 'Rajkot'),
('Dough & Doppio', 'Desserts, Coffee, Tea, Beverages', 4.6, 'Rajkot'),
('Wisteria Cafe', 'Cafe, North Indian', 4.3, 'Surat'),
('The Secret Kitchen', 'North Indian, Chinese', 3.7, 'Rajkot'),
("La Pino'z Pizza", 'Pizza, Pasta, Italian', 4.0, 'Ahmedabad'),
('Swagat Restaurant', 'South Indian, Chinese', 4.2, 'Ahmedabad'); -- Added to naturally satisfy the 'Swa%' query!

-- 2. Finds highly-rated options in specific cities
SELECT name FROM Restaurants 
WHERE city IN ('Ahmedabad', 'Surat') AND rating > 4;

-- 3. Correctly fetches your newly added sample row
SELECT name FROM Restaurants 
WHERE name LIKE 'Swa%';

-- 4. Filters mid-tier ratings cleanly
SELECT name, rating FROM Restaurants 
WHERE rating BETWEEN 3.5 AND 4.5;

-- 5. Fixed from IN to LIKE pattern tracking so comma-separated list values are caught perfectly
SELECT name, cuisine FROM Restaurants 
WHERE cuisine LIKE '%Chinese%' 
   OR cuisine LIKE '%Italian%' 
   OR cuisine LIKE '%South Indian%';
