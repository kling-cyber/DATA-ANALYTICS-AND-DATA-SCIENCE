USE foodie_app ;

CREATE TABLE Restaurants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    cuisine VARCHAR(100), 
    rating INT ,
    city VARCHAR(150)
);

INSERT INTO Restaurants (name,cuisine,rating,city)
VALUES ('TGT - The Grand Thakar','North Indian, Fast Food',4.8,'Rajkot'),
('Dough & Doppio','Desserts, Coffee, Tea, Beverages',4.6,'Rajkot'),
('Wisteria Cafe','Cafe, North Indian',4.3,'Surat'),
('The Secret Kitchen','North Indian, Chinese',3.7,'Rajkot'),
("La Pino'z Pizza",'Pizza, Pasta, Italian',4.0,'Ahmedabad');

SELECT name FROM Restaurants WHERE city IN ('Ahmedabad','Surat')
AND rating > 4;

SELECT name FROM Restaurants WHERE name LIKE 'Swa%';

SELECT name,rating FROM Restaurants WHERE rating BETWEEN 3.5 AND 4.5 ;

SELECT name , cuisine FROM Restaurants 
WHERE cuisine IN ('Chinese', 'Italian', 'South Indian');