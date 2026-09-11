## 1.Create two tables: Influencers and Collaborations Write a SQL FULL JOIN query to list all influencers and show their collaboration partner names if any, including influencers with no collaborations..

```sql
CREATE TABLE Influencers(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
);
```
```sql
CREATE TABLE Collaborations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    influencer1_id INT NOT NULL,
    influencer2_id INT ,
    collab_date DATE
);
```
# full join
- sql not support `full outer join` so we write as below
```sql
SELECT * FROM Influencers i
LEFT JOIN Collaborations c
ON i.id = C.influencer1_id
UNION
SELECT * FROM Influencers i
RIGHT JOIN Collaborations c
ON i.id = C.influencer1_id
```
## 2.Using a SELF JOIN, write a query on a table called Playlists (id, user_id, playlist_name, parent_playlist_id) to display each playlist alongside its parent playlist name.

```sql
SELECT p.id ,
       p.playlist_name as playlist_name,
       pr.playlist_name as parent_playlist_name
FROM Playlists p
LEFT JOIN Playlists pr
ON p.id = pr.parent_playlist_id ;
```

## 3. Given three tables: Users (id, username), Orders (id, user_id, order_date), and Payments (id, order_id, amount), write a SQL query using multiple JOINs to display each username, their order date, and payment amount, showing all users even if they have no orders or payments.

```sql
SELECT 
u.id , u.username , o.order_date , p.amount
FROM Users u
LEFT JOIN Orders o
ON u.id = o.user_id
LEFT JOIN Payments p
ON o.id = p.order_id ;
```
## 4. You notice that your JOIN query between Zomato's Restaurants and Reviews tables is returning duplicate rows for some restaurants. Modify your query to eliminate duplicates and explain in one line why the duplicates were happening.

- a restaurant have many review from different user so join write one row for each user rewiew
```sql
SELECT 
r.restaurant_id ,
r.restaurant_name,
FROM restaurants r
LEFT JOIN reviews rw
ON r.restaurant_id = rw.restaurant_id ;
GROUP BY  r.restaurant_id
```
# Modify Quary
- we can use `distinct` so we can see restaurant once 
- we will also use `group by` inplace of `distinct`
```sql
SELECT 
DISTINCT r.restaurant_id ,
r.restaurant_name,
FROM restaurants r
LEFT JOIN reviews rw
ON r.restaurant_id = rw.restaurant_id ;
GROUP BY  r.restaurant_id
```
## 5. Write two different JOIN queries on a Products and Categories table to list all products with their category names, but use different join conditions in each. Briefly explain which join condition is more efficient and why.

# `LEFT JOIN`
```sql
SELECT p.id ,p.name , c.name
FROM  Products p
LEFT JOIN Categories c
ON p.category_id = c.id ;
```

# `LEFT JOIN`
```sql
SELECT p.id ,p.name , c.name
FROM  Products p
RIGHT JOIN Categories c
ON p.category_id = c.id ;
```
# `LEFT JOIN` is best suitalbe here beacuse of we get all product with their category and product haven't catgory still apper while cateogry without prduct is not make sense.


