## 1.Create two tables in your database: 'restaurants' (id, name, city) and 'dishes' (id, restaurant_id, dish_name, price). Insert  restaurants and dishes for each restaurant.

```sql
use foodie_app;
CREATE TABLE restautants (
id INT AUTO_INCREMENT PRIMARY KEY ,
restaurant_name VARCHAR(100),
city VARCHAR(100));
```
```sql
CREATE TABLE dishes (
id INT AUTO_INCREMENT PRIMARY KEY,
restaurant_id INT NOT NULL ,
dish_name VARCHAR(150),
price DECIMAL(5,2));
```
**INSERT DATA**

```sql
INSERT INTO restautants (restaurant_name,
city ) VALUES
('Indian Accent','New Delhi'),
('Bukhara', 'New Delhi'),
('Peter Cat','Kolkata'),
('Britannia & Co.','Mumbai'),
('Trishna','Mumbai'),
('Karavalli','Bengaluru'),
('Mavalli Tiffin Rooms','Bengaluru'),
('Dakshin','Chennai'),
('Koshy','Bengaluru'),
('Kanha','Jaipur');
```
```sql
INSERT INTO dishes (restaurant_id ,dish_name,price )
VALUES
(1, 'Butter Chicken', 450.00),(1, 'Garlic Naan', 120.00),(1, 'Paneer Tikka', 320.00),

(2, 'Dal Bukhara', 550.00),(2, 'Tandoori Chicken', 650.00),(2, 'Chicken Tikka', 480.00),

(3, 'Chicken Chelo Kebab', 380.00),(3, 'Mutton Biryani', 450.00),(3, 'Fish Fry', 350.00),

(4, 'Prawn Koliwada', 520.00),(4, 'Chicken Biryani', 420.00),(4, 'Butter Garlic Prawns', 650.00),

(5, 'Hyderabadi Biryani', 350.00),(5, 'Haleem', 280.00),(5, 'Chicken 65', 300.00),

(6, 'Masala Dosa', 180.00),(6, 'Idli Sambar', 120.00),(6, 'Medu Vada', 140.00),

(7, 'Paneer Butter Masala', 320.00),(7, 'Veg Biryani', 280.00),(7, 'Cheese Dosa', 220.00),

(8, 'Rajasthani Thali', 450.00),(8, 'Dal Baati Churma', 380.00),(8, 'Gatte Ki Sabzi', 250.00),

(9, 'Masala Chai', 80.00),(9, 'Chicken Kebab', 350.00),(9, 'Mutton Curry', 420.00),

(10, 'Pav Bhaji', 180.00),(10, 'Chole Bhature', 220.00),(10, 'Paneer Kadhai', 300.00);
```
## Write an SQL INNER JOIN query to display each dish along with its restaurant name and city.

```sql
SELECT r.restaurant_name , d.dish_name FROM restautants r
INNER JOIN dishes d
ON r.id = d.restaurant_id ;
```
## Write an SQL LEFT JOIN query to list all restaurants and their dishes, showing restaurants even if they currently have no dishes on the menu.

```sql
SELECT r.restaurant_name,d.dish_name FROM restautants r 
LEFT JOIN dishes d
ON r.id = d.restaurant_id ; 
```
## Write an SQL RIGHT JOIN query to display all dishes and their restaurant names, including any dishes that might not be linked to a restaurant (simulate a data error where a dish has a restaurant_id that doesn't match any restaurant).

```sql
SELECT r.restaurant_name,d.dish_name FROM restautants r 
RIGHT JOIN dishes d
ON r.id = d.restaurant_id ; 
```

## Given this scenario: You want to show a list of all playlists and the songs inside them, like Spotify. Explain which JOIN type (INNER, LEFT, or RIGHT) you would use to show all playlists, even if some are empty, and write the SQL query for it.

- I use `INNER JOIN` beacause of we wan't all playlist even list is empty

```sql
SELECT 
p.playlist_name,
s.song_name
FROM playlists p
LEFT JOIN songs s
ON p.playlist_id = s.playlist_id;
```