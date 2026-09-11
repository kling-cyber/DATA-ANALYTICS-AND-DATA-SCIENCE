# 1. Create a table named Playlists with columns: id, user_id, playlist_name, and total_likes. Insert at least 8 sample rows with different users and playlists, making sure some playlists have the same user_id.

```sql
CREATE TABLE Playlists (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    playlist_name VARCHAR(255)NOT NULL,
    total_likes INT NOT NULL
)
```
```sql
INSERT INTO Playlists (user_id, playlist_name, total_likes)
VALUES
(1, 'Morning Vibes', 125),
(2, 'Workout Hits', 210),
(1, 'Chill Music', 180),
(3, 'Road Trip', 95),
(2, 'Party Songs', 320),
(4, 'Romantic Hits', 150),
(3, 'Focus Music', 85),
(5, 'Best of 2026', 275);
```
# 2. Write a SQL query using ROW_NUMBER() and the OVER() clause to assign a unique row number to each playlist, ordered by total_likes in descending order.

```sql
SELECT * ,
ROW_NUMBER() OVER(ORDER BY total_likes DESC) AS row_num
FROM Playlists
```
# 3. Use the RANK() function with the OVER() clause to rank all playlists by total_likes, and display the playlist_name, user_id, total_likes, and their rank.

```sql
SELECT playlist_name, user_id, total_likes ,
RANK() OVER(ORDER BY total_likes DESC) AS playlist_rank FROM Playlists ;
```
# 4. Write a SQL query using DENSE_RANK() and PARTITION BY user_id to rank each user's playlists by total_likes, showing playlist_name, user_id, total_likes, and dense rank.

```sql
SELECT playlist_name, user_id, total_likes,
DENSE_RANK() OVER(PARTITION BY user_id ORDER BY total_likes DESC ) AS dense_rank
FROM playlists ;
```
# 5. Imagine you want to show the top 2 playlists per user based on total_likes, like Spotify's 'Your Top Playlists' feature. Write a query using a window function to select only the top 2 playlists for each user.

```SQL
SELECT playlist_name, user_id, total_likes FROM (
SELECT playlist_name, user_id, total_likes,
DENSE_RANK() OVER( PARTITION BY user_id ORDER BY total_likes DESC) AS rating_by_likes 
FROM playlists) AS play_rank 
WHERE rating_by_likes <= 2;
```