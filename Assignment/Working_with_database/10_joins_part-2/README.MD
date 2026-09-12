## 1.Create two tables: Influencers and Collaborations Write a SQL FULL JOIN query to list all influencers and show their collaboration partner names if any, including influencers with no collaborations.

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
    influencer2_id INT,
    collab_date DATE
);
```

# full join
- MySQL does not support `FULL OUTER JOIN` directly, so we can simulate the required result with `LEFT JOIN` and `UNION`.
- The two parts check both influencer columns so that either collaborator can be shown with their partner.

```sql
SELECT
    i.name AS influencer_name,
    partner.name AS collaboration_partner,
    c.collab_date
FROM Influencers i
LEFT JOIN Collaborations c
    ON i.id = c.influencer1_id
LEFT JOIN Influencers partner
    ON c.influencer2_id = partner.id

UNION

SELECT
    i.name AS influencer_name,
    partner.name AS collaboration_partner,
    c.collab_date
FROM Influencers i
LEFT JOIN Collaborations c
    ON i.id = c.influencer2_id
LEFT JOIN Influencers partner
    ON c.influencer1_id = partner.id;
```

## 2.Using a SELF JOIN, write a query on a table called Playlists (id, user_id, playlist_name, parent_playlist_id) to display each playlist alongside its parent playlist name.

```sql
SELECT
    child.id,
    child.playlist_name AS playlist_name,
    parent.playlist_name AS parent_playlist_name
FROM Playlists child
LEFT JOIN Playlists parent
    ON child.parent_playlist_id = parent.id;
```

## 3. Given three tables: Users (id, username), Orders (id, user_id, order_date), and Payments (id, order_id, amount), write a SQL query using multiple JOINs to display each username, their order date, and payment amount, showing all users even if they have no orders or payments.

```sql
SELECT
    u.id,
    u.username,
    o.order_date,
    p.amount
FROM Users u
LEFT JOIN Orders o
    ON u.id = o.user_id
LEFT JOIN Payments p
    ON o.id = p.order_id;
```

## 4. You notice that your JOIN query between Zomato's Restaurants and Reviews tables is returning duplicate rows for some restaurants. Modify your query to eliminate duplicates and explain in one line why the duplicates were happening.

- The duplicates happen because one restaurant can have many reviews, so the one-to-many JOIN produces one row for each review.

```sql
SELECT DISTINCT
    r.restaurant_id,
    r.restaurant_name
FROM Restaurants r
INNER JOIN Reviews rw
    ON r.restaurant_id = rw.restaurant_id;
```

## 5. Write two different JOIN queries on a Products and Categories table to list all products with their category names, but use different join conditions in each. Briefly explain which join condition is more efficient and why.

# Query 1: Join using the product's foreign key
```sql
SELECT
    p.id,
    p.name AS product_name,
    c.name AS category_name
FROM Products p
INNER JOIN Categories c
    ON p.category_id = c.id;
```

# Query 2: Join using the category's primary key first
```sql
SELECT
    p.id,
    p.name AS product_name,
    c.name AS category_name
FROM Products p
LEFT JOIN Categories c
    ON c.id = p.category_id
    AND c.name IS NOT NULL;
```

- Query 1 is more efficient and appropriate when only products with a valid category are required because it uses the primary-key/foreign-key equality directly.
- In practice, the database optimizer may produce the same execution plan for logically equivalent join conditions, especially when the relevant columns are indexed.
