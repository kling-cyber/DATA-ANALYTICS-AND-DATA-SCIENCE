1. # Create a SQL query using a subquery in the WHERE clause to find all restaurants from a 'Restaurants' table whose average rating is higher than the average rating of all restaurants in the city.

```sql
SELECT * FROM Restaurants r 
WHERE r.rating > ( select avg(r2.rating) from Restaurants r2 
WHERE r.city = r2.city);
```
2. # Write a SQL query that uses a subquery in the SELECT statement to display each user's name from a 'Users' table along with the total number of orders they have placed from an 'Orders' table.

```sql
SELECT u.name , (SELECT  COUNT(*) FROM orders o
WHERE u.id = o.user_id) AS number_of_orders 
FROM Users u ;
```
3. # Given a 'Movies' table and a 'Reviews' table, write a SQL query using IN with a subquery to list all movies that have at least one review with a rating of 5 stars, as seen in BookMyShow's top-rated section.

```sql
SELECT m.movie_name  FROM Movies m
WHERE m.id IN (
    SELECT r.movie_id FROM Reviews r
    WHERE rating = 5
); 
```
4. # Write a nested SQL query to find the names of all sellers from a 'Sellers' table on a Flipkart-style platform who have sold products in every category listed in a 'Categories' table. Use nested subqueries to compare seller's categories with the complete list of categories.

```sql
SELECT name FROM sallers s 
WHERE ( SELECT COUNT (DISTINCT p.category) FROM product p 
WHERE p.saller_id = s.id )= 
( SELECT COUNT(*) FROM category) ;
```
