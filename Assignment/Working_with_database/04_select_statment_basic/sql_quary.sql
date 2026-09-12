USE music_detail_app ;
-- create table
CREATE TABLE MusicPlaylist (
id INT AUTO_INCREMENT	PRIMARY KEY,
song_name VARCHAR(255) , 
artist VARCHAR(100),
genre VARCHAR(100),
duration INT);


-- add data 
INSERT INTO MusicPlaylist (song_name,artist,genre,duration) VALUES (
'Maa Main Kabhi Batlata Nahin','Shankar Mahadevan','Bollywood',310),
('Tum Hi Ho','Arijit Singh','Bollywood',262),
('Kesariya','Arijit Singh','Bollywood',268),
('Excuses',	'AP Dhillon','Punjabi Pop',157),
('Apna Bana Le','Arijit Singh','Bollywood',261);

-- show only 3 row

SELECT song_name,artist from MusicPlaylist LIMIT 3;

-- find restaurant where we placed order distinct only
SELECT DISTINCT restaurant FROM FoodOrders WHERE order_date IS NOT NULL;

	
SELECT food_item AS Dish , order_date AS Date_Ordered FROM FoodOrders ;

SELECT DISTINCT food_item, restaurant FROM FoodOrders LIMIT 2;

