USE foodie_app;

-- TASK 10: JOINS PART 2

-- QUESTION 1: FULL JOIN simulation for Influencers and Collaborations
-- MySQL does not support FULL OUTER JOIN directly, so LEFT JOIN + UNION is used.
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

-- QUESTION 2: SELF JOIN to display each playlist and its parent playlist
SELECT
    child.id,
    child.playlist_name AS playlist_name,
    parent.playlist_name AS parent_playlist_name
FROM Playlists child
LEFT JOIN Playlists parent
    ON child.parent_playlist_id = parent.id;

-- QUESTION 3: Multiple JOINs showing all users, even without orders or payments
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

-- QUESTION 4: Eliminate duplicate restaurant rows caused by multiple reviews
SELECT DISTINCT
    r.restaurant_id,
    r.restaurant_name
FROM Restaurants r
INNER JOIN Reviews rw
    ON r.restaurant_id = rw.restaurant_id;

-- QUESTION 5: Query 1 using the product foreign key
SELECT
    p.id,
    p.name AS product_name,
    c.name AS category_name
FROM Products p
INNER JOIN Categories c
    ON p.category_id = c.id;

-- QUESTION 5: Query 2 using the category primary key in the join condition
SELECT
    p.id,
    p.name AS product_name,
    c.name AS category_name
FROM Products p
LEFT JOIN Categories c
    ON c.id = p.category_id
    AND c.name IS NOT NULL;

-- Query 1 is more efficient and appropriate when only products with
-- a valid category are required because it uses the primary-key/foreign-key equality directly.
