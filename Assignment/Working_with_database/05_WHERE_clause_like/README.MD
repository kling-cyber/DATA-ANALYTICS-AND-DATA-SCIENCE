### Task 5: WHERE Clause & LIKE Assignment Solutions

#### Q1. Table Structure
The table is built to model a restaurant system. We use `DECIMAL(3,1)` for the rating instead of an integer to preserve scores like 4.8 and 4.6.
```sql
CREATE TABLE Restaurants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    cuisine VARCHAR(100), 
    rating DECIMAL(3,1),
    city VARCHAR(150)
);
```

#### Q2. Filtering Cities and Ratings
```sql
SELECT name FROM Restaurants WHERE city IN ('Ahmedabad','Surat') AND rating > 4;
```

#### Q3. Name Search Pattern
```sql
SELECT name FROM Restaurants WHERE name LIKE 'Swa%';
```

#### Q4. Rating Range
```sql
SELECT name,rating FROM Restaurants WHERE rating BETWEEN 3.5 AND 4.5;
```

#### Q5. Cuisine Filter Explanation
Instead of using a basic `IN` query, we use wildcards with `LIKE` to match sub-strings. Because rows have combined items (e.g., 'Pizza, Pasta, Italian'), a strict `IN ('Italian')` statement will skip them.
```sql
SELECT name, cuisine FROM Restaurants 
WHERE cuisine LIKE '%Chinese%' 
   OR cuisine LIKE '%Italian%' 
   OR cuisine LIKE '%South Indian%';
```

---

Save both files in VS Code, go to your Source Control sidebar, and push them up together. Are you ready to dive into checking your **Task 6 (OrderBy)** files next?
