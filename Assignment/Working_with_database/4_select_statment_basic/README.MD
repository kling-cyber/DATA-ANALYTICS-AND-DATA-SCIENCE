## **Q.1 Create a table named `MusicPlaylist` with columns: `id, song_name`,` artist`,`genre`, and `duration`. Insert at least 5 records representing songs from your favorite Spotify playlist, then write a SELECT statement to retrieve all columns for all songs.**
## **Select Database**
```sql
USE music_detail_app ;
```
## **create table**
```sql
CREATE TABLE MusicPlaylist (
id INT AUTO_INCREMENT	PRIMARY KEY,
song_name VARCHAR(255) , 
artist VARCHAR(100),
genre VARCHAR(100),
duration INT);
```

## **add data** 
```sql
INSERT INTO MusicPlaylist (song_name,artist,genre,duration) VALUES 
('Maa Main Kabhi Batlata Nahin','Shankar Mahadevan','Bollywood',310),
('Tum Hi Ho','Arijit Singh','Bollywood',262),
('Kesariya','Arijit Singh','Bollywood',268),
('Excuses',	'AP Dhillon','Punjabi Pop',157),
('Apna Bana Le','Arijit Singh','Bollywood',261);
```
```sql
SELECT * FROM MusicPlaylist
```
## **Q.2 Write a SQL query to display only the song_name and artist columns from the MusicPlaylist table, showing just the first 3 records using the LIMIT keyword.**   

```sql
SELECT song_name,artist FROM MusicPlaylist LIMIT 3;
```

## **Q.3 Suppose you have a table named FoodOrders with columns: id, restaurant, food_item, and order_date. Write a SQL query to list all unique restaurant names where you have placed orders, using the DISTINCT keyword.**

```sql
SELECT DISTINCT restaurant FROM FoodOrders WHERE order_date IS NOT NULL;
```
## **Q.4 Write a SQL query on the `FoodOrders` table to select `food_item` as `'Dish'` and `order_date` as `'Date Ordered'`, displaying only these two columns with the column aliases in the output.**

```sql
SELECT food_item AS Dish , order_date AS Date_Ordered FROM FoodOrders ;
```


## **Q.5 You tried running this query: SELECT DISTINCT food_item, restaurant FROM FoodOrders LIMIT 2, but it returns an error or doesn't work as expected. Identify and fix the mistake in the query.Hint: Check the correct placement and usage of the LIMIT keyword in SQL syntax.**
```sql
SELECT DISTINCT food_item, restaurant FROM FoodOrders LIMIT 2,
```
- Error Code: 1064. You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1	0.000 sec
## **Correct Query** 
```sql
SELECT DISTINCT food_item, restaurant FROM FoodOrders LIMIT 2;
```
