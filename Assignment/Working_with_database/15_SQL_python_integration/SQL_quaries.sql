-- TASK 15: SQL QUERIES

-- QUESTION 2: Fetch restaurants with a rating above 4.0 and print their names
SELECT name
FROM Restaurants
WHERE rating > 4.0;

-- QUESTION 4: Add delivery charge and calculate final rating
ALTER TABLE Restaurants
ADD COLUMN delivery_charge DECIMAL(10,2) DEFAULT 50;

ALTER TABLE Restaurants
ADD COLUMN final_rating DECIMAL(3,2);

UPDATE Restaurants
SET final_rating = rating + CASE
    WHEN cuisine = 'Italian' THEN 0.1
    ELSE 0
END;

SELECT id, name, cuisine, rating, delivery_charge, final_rating
FROM Restaurants;
