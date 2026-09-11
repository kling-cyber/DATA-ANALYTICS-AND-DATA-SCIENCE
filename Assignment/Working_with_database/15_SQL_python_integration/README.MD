# 1. Install the sqlite3 module in Python and write a script to create a new database called foodie.db with a table Restaurants (id, name, cuisine, rating).

- SQLite3 is included in Python's standard library, so no separate installation is required.
- check it 
```
python -c "import sqlite3; print(sqlite3.sqlite_version)"
```
## create database and table 

```python
import sqlite3
# Create/connect to database
connection = sqlite3.connect("foodie.db")
cursor = connection.cursor()
# create table
cursor.execute("""
create table restaurants (id INTEGER AUTO_INCREMENT PRIMARY KEY,
name VARCHAR (100) NOT NULL,cuisine VARCHAR(50) NOT NULL,
rating DECIMAL(2,2))
""")
# save changes
connection.commit()

# close connection
connection.close() # if you don't write query then close connetion else not close it

print("foodie.db created successfully")
print("restaurants table created successfully")
```
# 2. Using sqlite3 in Python, insert three sample restaurants into the Restaurants table in foodie.db and write a query to fetch all restaurants with a rating above 4.0, then print their names.

```python
cursor.execute(""" insert into restaurants (name, cuisine, rating) values 
("The Italian Place", "Italian", 4.5),("Chinese Delight", "Chinese", 4.2),("punjabi dhaba", "Indian", 4.8)
""")


connection.commit()
print("Data inserted successfully")

```
- print restaurants with rating morethan 4
```python
cursor.execute(""" select * from restaurants where rating > 4
""")
results = cursor.fetchall()
for row in results:
    print(row)
print("Query executed successfully")
```

# 3.Write Python code to load all rows from the Restaurants table in foodie.db into a Pandas DataFrame and display the top 2 rows using DataFrame.head(). 

```python
df = pd.read_sql_query("select * from restaurants", connection)
print(df.head(2))
```

# 4. Add a new column 'delivery_charge' to your DataFrame, setting it to 50 for all restaurants, and then calculate a new column 'final_rating' as rating + (0.1 if cuisine is 'Italian').<br><strong>Hint:</strong> Use DataFrame.apply() or a lambda function for the conditional logic.

```python
df["delivery_charge"] = 50

df["final_rating"] = df.apply(lambda row: row["rating"] + 0.1 if row["cuisine"] == "Italian" else row["rating"], axis=1)

print(df)
```
- *output*
|  | id |              name|  cuisine|  rating | delivery_charge|  final_rating|
|0  | 1  |The Italian Place  |Italian   |  4.5     |          50     |      4.6|
|1  | 2  |  Chinese Delight  |Chinese   |  4.2     |          50     |      4.2|
|2  | 3  |    punjabi dhaba  | Indian   |  4.8     |          50     |      4.8|

# 5. Automate a daily summary: Write a Python script that connects to foodie.db, fetches all restaurants with rating above 4.5, loads them into a DataFrame, and saves the result as a CSV file named top_rated_restaurants.csv.


```python
import sqlite3
import pandas as pd 
connection = sqlite3.connect("foodie.db")
query = """
select * from restaurants where rating > 4.5
"""

df = pd.read_sql_query(query, connection)

df.to_csv("highly_rated_restaurants.csv", index=False)
connection.close()
print("Data exported to highly_rated_restaurants.csv successfully")

```