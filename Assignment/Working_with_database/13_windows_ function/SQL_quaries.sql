-- TASK 13: WINDOW FUNCTIONS PART 1

-- QUESTION 1: Create Playlists table and insert sample rows
CREATE TABLE Playlists (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    playlist_name VARCHAR(255) NOT NULL,
    total_likes INT NOT NULL
);

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

-- QUESTION 2: Assign a unique row number ordered by total_likes descending
SELECT *,
       ROW_NUMBER() OVER (ORDER BY total_likes DESC) AS row_num
FROM Playlists;

-- QUESTION 3: Rank all playlists by total_likes
SELECT playlist_name, user_id, total_likes,
       RANK() OVER (ORDER BY total_likes DESC) AS playlist_rank
FROM Playlists;

-- QUESTION 4: Rank each user's playlists by total_likes using DENSE_RANK
SELECT playlist_name, user_id, total_likes,
       DENSE_RANK() OVER (
           PARTITION BY user_id
           ORDER BY total_likes DESC
       ) AS dense_rank
FROM Playlists;

-- QUESTION 5: Select exactly the top 2 playlists for each user
SELECT playlist_name, user_id, total_likes
FROM (
    SELECT playlist_name, user_id, total_likes,
           ROW_NUMBER() OVER (
               PARTITION BY user_id
               ORDER BY total_likes DESC
           ) AS row_num
    FROM Playlists
) AS play_rank
WHERE row_num <= 2;