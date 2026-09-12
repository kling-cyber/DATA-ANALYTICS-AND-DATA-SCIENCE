### Task 5: Database Filtering & Querying

#### 1. Table Schema
We create a `Restaurants` table to capture Zomato data. Note that we use `DECIMAL(3,1)` for the rating instead of an integer to preserve decimal precision (e.g., 4.8).

```sql
CREATE TABLE Restaurants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    cuisine VARCHAR(100), 
    rating DECIMAL(3,1), 
    city VARCHAR(150)
);
```

#### 5. Cuisine Filtering Explanation
Instead of a standard `IN` operator, we use `LIKE` with wildcards (`%`) because cuisines are stored as comma-separated lists in our rows. The standard `IN ('Chinese')` match fails on mixed list entries like `'North Indian, Chinese'`.
