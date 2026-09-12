USE foodie_app ;
-- create table
CREATE TABLE playlist (
id INT AUTO_INCREMENT	PRIMARY KEY,
song_name VARCHAR(255) , 
artist VARCHAR(100),
duration INT);
-- inset 1 row
INSERT INTO playlist (song_name,artist ,duration) VALUES  ( 'Maa (Main Kabhi Batlata Nahin)','Shankar Mahadevan',310);
--- check table detail
SELECT song_name,artist ,SEC_TO_TIME(duration) AS duration FROM playlist;
-- inser 3 row 
INSERT INTO playlist (song_name,artist ,duration) VALUES ('Tum Hi Ho','Arijit Singh',262) ,('Kesariya','Arijit Singh',268),('Apna Bana Le','Arijit Singh',261);
-- update atrist name 
SET SQL_SAFE_UPDATES = 0;
UPDATE playlist SET artist = 'Shankar_Mahadevan' WHERE artist ='Shankar Mahadevan';

SET SQL_SAFE_UPDATES = 1;

-- delete 
DELETE FROM playlist WHERE duration < 120 ;

-- update 
UPDATE playlist SET song_name = CONCAT(song_name ,  ' Remix') 
WHERE artist = 'AP Dhillon' AND duration >180;
