# 1. Write an SQL query to find the top 5 highest-rated restaurants in Koramangala that serve North Indian cuisine, using the Zomato Bangalore dataset.

```sql
SELECT name, cuisine ,rate FROM restaurants
WHERE Location = 'Koramangala'
AND cuisine LIKE '%North indian%'
ORDER BY rate DESC LIMIT 5 ;
```
# 2. Using SQL, calculate the average cost for two people for each cuisine type and list the 3 most expensive cuisines to eat in Bangalore.

```sql
SELECT  cuisine, ROUND(AVG(cost_for_two),2) AS avg_cost_for_two_people FROM restaurants
GROUP BY cuisine 
ORDER BY avg_cost_for_two_people DESC
LIMIT 3 ;
```

# 3. Find all restaurants that offer online delivery but have a rating below 3.0, and suggest a marketing strategy to improve their ratings based on your findings.<br><br><em><strong>Hint:</strong> Look for patterns in location, cuisine, or price that might explain the low ratings.</em>

```sql
SELECT name, online_order,rate, votes, cuisines FROM restaurants 
WHERE online_order = 'Yes'
AND CAST(SUBSTRING_INDEX(rate, '/', 1) AS DECIMAL(3,1)) < 3.0 ;
```
- Improve quality of food compate to rate ( add value for money)
- Use better packaging to food reaches customers in good condition.
- after that give sort time discount and offer to attract customrs 
- ask every customer for reviw and encounter only genuine review 

# 4. Write an SQL query to segment restaurants into three market segments based on average cost for two: budget (below 400), mid-range (400-800), and premium (above 800). Count how many restaurants fall into each segment.

```sql
WITH segment_rest AS(
SELECT cuisine, CASE
WHEN cost_for_two > 800 THEN 'premium'
WHEN cost_for_two > 400 THEN 'mid-range'
WHEN cost_for_two > 0 THEN 'budget'
END AS segment 
FROM restaurants
)

SELECT  segment , COUNT(segment) AS number_restaurants FROM  segment_rest
GROUP BY segment ;
```

# 5. Use ChatGPT or Copilot to help you write an SQL query that lists the top 10 most popular restaurant chains (by number of outlets) in the dataset, then run and validate the query yourself.<br><strong>Hint:</strong> Search for 'SQL group by count example' if you get stuck.

```sql
SELECT name,
    COUNT(*) AS number_of_outlets
FROM restaurants
GROUP BY name
ORDER BY number_of_outlets DESC
LIMIT 10;
```
- *Validation*
- `GROUP BY name` group all restaurants having same name/chain restaurant
- `COUNT(*)` count number or outlet each group  or name
- `ORDER BY DESC` arrange column from highest count to lowest count
- `LIMIT 10` show only top 10 records