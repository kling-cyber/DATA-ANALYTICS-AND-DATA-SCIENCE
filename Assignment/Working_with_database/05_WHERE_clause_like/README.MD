## **Q.1 Create a table called Restaurants with columns: `id, name, cuisine, rating, and city`. Insert at least 5 sample records representing real or fictional restaurants you might find on Zomato.**

```sql
CREATE TABLE Restaurants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    cuisine VARCHAR(100), 
    rating INT ,
    city VARCHAR(150)
);
```
```sql
INSERT INTO Restaurants (name,cuisine,rating,city)
VALUES ('TGT - The Grand Thakar','North Indian, Fast Food',4.8,'Rajkot'),
('Dough & Doppio','Desserts, Coffee, Tea, Beverages',4.6,'Rajkot'),
('Wisteria Cafe','Cafe, North Indian',4.3,'Surat'),
('The Secret Kitchen','North Indian, Chinese',3.7,'Rajkot'),
("La Pino'z Pizza",'Pizza, Pasta, Italian',4.0,'Ahmedabad');
```
## **Q.2 Write a SQL query to find all restaurants in the Restaurants table that have a rating greater than 4.0 and are located in either 'Ahmedabad' or 'Surat'.**

```sql
SELECT name,rating,city FROM Restaurants WHERE city IN ('Ahmedabad','Surat')
AND rating > 4;
```
## **Q.3 Using the LIKE operator, write a query to select all restaurants whose names start with 'Swa' (for example, 'Swagat', 'Swadisht') from the Restaurants table.Use LIKE 'Swa%'.**

```sql
SELECT name FROM Restaurants WHERE name LIKE 'Swa%';
```
## **Q.4 Write a SQL query using the BETWEEN keyword to find all restaurants in the Restaurants table with a rating between 3.5 and 4.5 (inclusive).**

```sql
SELECT name,rating FROM Restaurants 
WHERE rating BETWEEN 3.5 AND 4.5 ;
```
## **Q.5 Write a query to find all restaurants whose cuisine is either 'Chinese', 'Italian', or 'South Indian' using the IN operator.**

```sql
SELECT name , cuisine FROM Restaurants 
WHERE cuisine IN ('Chinese', 'Italian', 'South Indian');
```