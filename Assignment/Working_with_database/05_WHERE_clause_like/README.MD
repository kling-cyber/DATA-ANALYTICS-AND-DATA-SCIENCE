### Task 5: WHERE Clause & LIKE Assignment Solutions

#### Q1. Table Structure
The table is built to model a restaurant system. We use `DECIMAL(3,1)` for the rating so values like 4.8 and 4.6 are preserved.
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
SELECT name
FROM Restaurants
WHERE city IN ('Ahmedabad', 'Surat')
  AND rating > 4;
```

#### Q3. Name Search Pattern
```sql
SELECT name
FROM Restaurants
WHERE name LIKE 'Swa%';
```

#### Q4. Rating Range
```sql
SELECT name, rating
FROM Restaurants
WHERE rating BETWEEN 3.5 AND 4.5;
```

#### Q5. Cuisine Filter Using IN
```sql
SELECT name, cuisine
FROM Restaurants
WHERE cuisine IN ('Chinese', 'Italian', 'South Indian');
```

---

The queries above match the assignment requirements directly, including the required use of `IN` for Q5.
