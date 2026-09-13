# 1. Write an SQL query to find the top 5 highest-rated restaurants in Koramangala that serve North Indian cuisine, using the Zomato Bangalore dataset.

```sql
SELECT name, cuisines, rate
FROM restaurants
WHERE Location = 'Koramangala'
  AND cuisines LIKE '%North Indian%'
  AND rate IS NOT NULL
ORDER BY CAST(SUBSTRING_INDEX(rate, '/', 1) AS DECIMAL(3,1)) DESC
LIMIT 5;
```

# 2. Using SQL, calculate the average cost for two people for each cuisine type and list the 3 most expensive cuisines to eat in Bangalore.

```sql
SELECT cuisines,
       ROUND(AVG(CAST(REPLACE(`approx_cost(for two people)`, ',', '') AS DECIMAL(10,2))), 2) AS avg_cost_for_two_people
FROM restaurants
WHERE `approx_cost(for two people)` IS NOT NULL
GROUP BY cuisines
ORDER BY avg_cost_for_two_people DESC
LIMIT 3;
```

# 3. Find all restaurants that offer online delivery but have a rating below 3.0, and suggest a marketing strategy to improve their ratings based on your findings.

```sql
SELECT name, online_order, rate, votes, cuisines
FROM restaurants
WHERE online_order = 'Yes'
  AND rate IS NOT NULL
  AND CAST(SUBSTRING_INDEX(rate, '/', 1) AS DECIMAL(3,1)) < 3.0;
```

Marketing strategy:
- Improve food quality and value for money based on customer feedback.
- Improve packaging so food reaches customers in good condition.
- Use short-term discounts and offers to attract customers after service quality improves.
- Encourage genuine customer reviews to identify recurring issues and measure improvement.

# 4. Write an SQL query to segment restaurants into three market segments based on average cost for two: budget (below 400), mid-range (400-800), and premium (above 800). Count how many restaurants fall into each segment.

```sql
WITH segment_rest AS (
    SELECT `approx_cost(for two people)` AS cost_for_two,
           CASE
               WHEN CAST(REPLACE(`approx_cost(for two people)`, ',', '') AS DECIMAL(10,2)) > 800 THEN 'premium'
               WHEN CAST(REPLACE(`approx_cost(for two people)`, ',', '') AS DECIMAL(10,2)) >= 400 THEN 'mid-range'
               WHEN CAST(REPLACE(`approx_cost(for two people)`, ',', '') AS DECIMAL(10,2)) > 0 THEN 'budget'
           END AS segment
    FROM restaurants
    WHERE `approx_cost(for two people)` IS NOT NULL
)
SELECT segment,
       COUNT(*) AS number_restaurants
FROM segment_rest
GROUP BY segment;
```

# 5. Use ChatGPT or Copilot to help you write an SQL query that lists the top 10 most popular restaurant chains (by number of outlets) in the dataset, then run and validate the query yourself.

```sql
SELECT name,
       COUNT(*) AS number_of_outlets
FROM restaurants
GROUP BY name
ORDER BY number_of_outlets DESC
LIMIT 10;
```

Validation:
- `GROUP BY name` groups restaurants with the same name, which is used as a chain proxy in this dataset.
- `COUNT(*)` counts the number of outlets represented by each restaurant name.
- `ORDER BY number_of_outlets DESC` sorts from the highest outlet count to the lowest.
- `LIMIT 10` returns only the top 10 results.
