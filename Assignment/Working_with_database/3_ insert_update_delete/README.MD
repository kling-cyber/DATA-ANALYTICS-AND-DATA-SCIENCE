## **Q.1 Create a table called Playlist with columns: `id (INT, primary key)`,` song_name (VARCHAR)`,` artist (VARCHAR)`, and  `duration  (INT, seconds)`. Insert a single row for your current favorite song.**
## **Select Database**
```sql 
USE foodie_app ;
```
```sql
CREATE TABLE playlist (
    id INT AUTO_INCREMENT PRIMARY KEY,
    song_name VARCHAR(255),
    artist VARCHAR(100),
    duration INT
);
```
## **Insert**
```sql
INSERT INTO playlist (song_name, artist, duration)
VALUES ('Maa (Main Kabhi Batlata Nahin)', 'Shankar Mahadevan', 310);
```
 
```sql
SELECT song_name, artist, SEC_TO_TIME(duration) AS duration
FROM playlist;
```
## **Q.2 Insert 3 new rows into the Playlist table for songs you recently listened to on Spotify, including their song_name, artist, and duration.**

```sql
INSERT INTO playlist (song_name, artist, duration)
VALUES
    ('Tum Hi Ho', 'Arijit Singh', 262),
    ('Kesariya', 'Arijit Singh', 268),
    ('Apna Bana Le', 'Arijit Singh', 261);
```

## **Q.3 Update the artist name for one of your Playlist entries to fix a typo (for example, change 'Arjit Singh' to 'Arijit Singh') using the UPDATE statement with a WHERE clause.**

 ```sql
UPDATE playlist
SET artist = 'Shankar_Mahadevan'
WHERE artist = 'Shankar Mahadevan';
```
**Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column. To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect. 0.000 sec**

* it means we can not update any deta if we cant give reference of an unique or primary key with where 'safe mode is restrict us'

**we can do it like this**
```sql
SET SQL_SAFE_UPDATES = 0;

UPDATE playlist
SET artist = 'Shankar_Mahadevan'
WHERE artist = 'Shankar Mahadevan';

SET SQL_SAFE_UPDATES = 1;
```

## **Q.4 Delete a song from the Playlist table where the duration is less than 120 seconds using the DELETE statement and a WHERE clause.**
```sql
DELETE FROM playlist
WHERE duration < 120;
```

## **Q.5 Write an SQL statement that would update the song_name for all songs by 'AP Dhillon' in your Playlist to add '(Remix)' at the end of the name, but only if the duration is more than 180 seconds. Constraint: Combine UPDATE with WHERE to target only the correct rows.**

```sql
UPDATE playlist
SET song_name = CONCAT(song_name, ' ', 'Remix')
WHERE artist = 'AP Dhillon';
```

