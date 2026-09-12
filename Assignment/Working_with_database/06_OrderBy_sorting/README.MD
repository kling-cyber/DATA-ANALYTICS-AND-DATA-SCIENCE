## **Q.1 Write an SQL query to display all products from a 'products' table and sort them by price in ascending order**

```sql
SELECT product_name , price FROM products
ORDER BY price ;
```
## **Q.2 Modify your previous query to show the top 5 most expensive products**
```sql
SELECT product_name , price FROM products
ORDER BY price DESC LIMIT 5;
```
## **Q.3 Given a 'movies' table with columns 'title', 'release_year', and 'rating', write an SQL query to list all movies sorted first by release_year in descending order (latest first), then by rating in descending order (highest rated first).**

```sql
SELECT title, release_year, rating FROM movies 
ORDER BY release_year DESC, rating DESC;
```

**RESULT**

| title   | release_year | rating |
| ------- | -----------: | -----: |
| Movie A |         2026 |    9.2 |
| Movie B |         2026 |    8.5 |
| Movie C |         2025 |    9.5 |
| Movie D |         2025 |    7.8 |
| Movie E |         2024 |    8.9 |

## **Q.4 Write an SQL query to display the first 10 restaurants from a 'restaurants' table, sorted alphabetically by name, just like Zomato's A-Z listing.**

```sql
SELECT Name FROM restaurants
ORDER BY name LIMIT 10;
```
## **Q.5 Suppose you want to display the top 3 trending songs from a 'songs' table based on play_count, but if two songs have the same play_count, the more recently added song should come first. Write the SQL query to achieve this.**

```sql
SELECT song_name ,added_date, Play_count FROM songs
ORDER BY Play_count DESC ,added_date DESC LIMIT 3 ;
```
