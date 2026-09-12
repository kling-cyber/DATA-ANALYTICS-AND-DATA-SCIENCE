-- 1. Create and select the correct database
CREATE DATABASE music_streaming_app;
USE music_streaming_app;

-- 2. Create the playlists table exactly as requested
CREATE TABLE playlists (
    playlist_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    created_by VARCHAR(100) NOT NULL
);

-- 3. Insert three sample rows (ensuring one is created by 'Amit' for Q4)
INSERT INTO playlists (playlist_id, name, created_by) VALUES 
(1, 'Bollywood Hits', 'Amit'),
(2, 'Chill Vibes', 'Rahul'),
(3, 'Workout Mix', 'Suresh');

-- 4. Select query to display all playlists created by 'Amit'
SELECT * FROM playlists 
WHERE created_by = 'Amit';
