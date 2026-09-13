# 1. Install the sqlite3 module in Python and write a script to create a new database called foodie.db with a table Restaurants (id, name, cuisine, rating).

- SQLite3 is included in Python's standard library, so no separate installation is required.

# 2. Write a query to fetch all restaurants with a rating above 4.0, then print their names.

```sql
SELECT name
FROM Restaurants
WHERE rating > 4.0;
```

# 3. Write Python code to load all rows from the Restaurants table in foodie.db into a Pandas DataFrame and display the top 2 rows using DataFrame.head().

# 4. Add a new column 'delivery_charge' to your DataFrame, setting it to 50 for all restaurants, and then calculate a new column 'final_rating' as rating + (0.1 if cuisine is 'Italian').

```sql
ALTER TABLE Restaurants
ADD COLUMN delivery_charge DECIMAL(10,2) DEFAULT 50;

ALTER TABLE Restaurants
ADD COLUMN final_rating DECIMAL(3,2);

UPDATE Restaurants
SET final_rating = rating + CASE
    WHEN cuisine = 'Italian' THEN 0.1
    ELSE 0
END;
```

# 5. Automate a daily summary: Write a Python script that connects to foodie.db, fetches all restaurants with rating above 4.5, loads them into a DataFrame, and saves the result as a CSV file named top_rated_restaurants.csv.
