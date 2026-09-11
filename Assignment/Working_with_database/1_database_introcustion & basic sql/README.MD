## Q.1 create a new database named 'music_streaming_app' using the command line or GUI tool of your choice.
```sql CREATE DATABASE music_streaming_app;```
## Q.2 Inside the 'music_streaming_app' database, create a table called 'playlists' with columns: playlist_id (integer, primary key), name (varchar), and created_by (varchar).
```sql USE music_streaming_app;

  CREATE TABLE playlist (
     playlist_id INT AUTO_INCREMENT PRIMARY KEY,
     name VARCHAR(50) NOT NULL,
     created_by VARCHAR(50) NOT NULL);
```
## Q.3 Insert three sample rows into the 'playlists' table representing playlists like 'Bollywood Hits', 'Chill Vibes', and 'Workout Mix', each created by a different user.
```sql INSERT INTO playlist (playlist_id,name,created_by) 
     VALUES ( NULL ,'Bollywood Hits','jaydeep'),
     (NULL,'Chill Vibes','kuldeep'),
     (NULL, 'Workout Mix','rajdeep' );
```
## Q.4 Write an SQL SELECT query to display all playlists created by the user 'anyone_name' from the 'playlists' 

```sql SELECT name , created_by FROM playlist WHERE created_by = 'jaydeep';```
## Q.5 Open ChatGPT or Copilot and ask it to explain the difference between a table, a row, and a column in SQL using an example from a food delivery app like Zomato. Paste the explanation you receive into your assignment.
-
**Example:** 
- restaurants table
- restaurant_id	restaurant_name	city	rating
- 101	Pizza Palace	Rajkot	4.5
- 102	Spice Hub	Ahmedabad	4.2
- 103	Burger Point	Surat	4.0<br>
### **1. Table**

A **table** stores related information in a structured format.

Here, the entire `restaurants` table contains information about restaurants.

```sql
CREATE TABLE restaurants (
    restaurant_id INT,
    restaurant_name VARCHAR(100),
    city VARCHAR(50),
    rating DECIMAL(2,1)
);
```

Think of a **table** as one complete spreadsheet.

---

### **2. Column**

A **column** represents one type or category of information.

For example:

- `restaurant_id`
- `restaurant_name`
- `city`
- `rating`

Each column has a specific purpose.

| Column | Meaning |
|---|---|
| `restaurant_id` | Unique ID of the restaurant |
| `restaurant_name` | Restaurant's name |
| `city` | Restaurant's city |
| `rating` | Restaurant's rating |

Think of a **column** as one field or attribute.

---

### **3. Row**

A **row** represents one complete record.

**Example:**

```text
101 | Pizza Palace | Rajkot | 4.5
```

This is one row representing one restaurant.

Another row:

```text
102 | Spice Hub | Ahmedabad | 4.2
```

This represents another restaurant.

Think of a **row** as one complete record.

---

### **Easy Way to Remember**

```text
TABLE
│
├── COLUMN → What information are we storing?
│   ├── restaurant_id
│   ├── restaurant_name
│   ├── city
│   └── rating
│
├── ROW → One restaurant's complete information
│
└── ROW → Another restaurant's complete information
```

---

### **In One Sentence**

> A **table** is a collection of related data, a **column** represents a specific type of data, and a **row** represents one complete record.

For a Zomato-style database, you might eventually have separate tables such as:

- `restaurants`
- `customers`
- `orders`
- `menu_items`
- `payments`
