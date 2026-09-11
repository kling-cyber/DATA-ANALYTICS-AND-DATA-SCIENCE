# 1. Import a CSV file of food delivery orders (with columns like order_id, restaurant_name, customer_name, order_amount, order_date) into a new SQL table named FoodOrders using your database tool of choice.
```python
import sqlite3
import pandas as pd

df = pd.read_csv('C:\\web\\Data_analytics\\Assignment\\Working_with_database\\16_SQL_project_sales_analysis\\orders.csv')

conn = sqlite3.connect('foodie.db')  
df.to_sql('FoodOrders', conn, if_exists='replace', index=False) 

result = pd.read_sql_query(
    "SELECT * FROM FoodOrders",
    conn
)
`
print(result)
conn.close()

```

# 2. Write SQL statements to create a table called TopSongs with columns: song_id, song_title, artist, streams, and release_date, then insert at least 5 records representing popular tracks from Spotify.

```sql
CREATE TABLE TopSongs (
    song_id INT PRIMARY KEY AUTO_INCREMENT,
    song_title VARCHAR(150) NOT NULL,
    artist VARCHAR(100) NOT NULL,
    streams INT NOT NULL,
    release_date DATE NOT NULL
);
```
```sql
INSERT INTO TopSongs (song_title, artist, streams, release_date)
VALUES
('Blinding Lights', 'The Weeknd', 5000000000, '2019-11-29'),
('Shape of You', 'Ed Sheeran', 4000000000, '2017-01-06'),
('Someone Like You', 'Adele', 3000000000, '2011-01-24'),
('As It Was', 'Harry Styles', 3000000000, '2022-04-01'),
('Stay', 'The Kid LAROI & Justin Bieber', 3000000000, '2021-07-09');
```

# 3. Write an SQL query to find the top 3 customers who ordered the most from the FoodOrders table based on total order_amount, and display their names and total spent.

```sql
SELECT customer_name, SUM(order_amount) AS total_spent FROM FoodOrders GROUP BY customer_name
ORDER BY total_spent DESC LIMIT 3;
```


# 4. Generate a product performance report by writing an SQL query that lists each restaurant_name from FoodOrders, the number of orders, and the total order_amount, ordered by total order_amount descending.<br><em><strong>Hint:</strong> Use GROUP BY and ORDER BY clauses.</em>

```sql
SELECT restaurant_name, COUNT(order_id) AS number_of_orders,SUM(order_amount) AS total_order_amount FROM FoodOrders GROUP BY restaurant_name
ORDER BY total_order_amount DESC ;
```

# 5. Create an SQL query that calculates two KPIs for the FoodOrders table: (1) average order_amount and (2) total number of unique customers, and format the output for dashboard display (two columns: kpi_name, kpi_value).

```sql
SELECT 'average_order_amount' AS kpi_name,
AVG(order_amount) AS kpi_value 
FROM FoodOrders

UNION ALL
SELECT 'number_of_costomers' AS kpi_name,
COUNT( DISTINCT customer_name) AS kpi_value
FROM FoodOrders
```

