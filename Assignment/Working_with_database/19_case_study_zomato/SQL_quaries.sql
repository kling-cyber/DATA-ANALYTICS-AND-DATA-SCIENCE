-- TASK 19: ZOMATO BANGALORE CASE STUDY

-- QUESTION 1: Top 5 highest-rated North Indian restaurants in Koramangala
SELECT name, cuisines, rate
FROM restaurants
WHERE Location = 'Koramangala'
  AND cuisines LIKE '%North Indian%'
  AND rate IS NOT NULL
ORDER BY CAST(SUBSTRING_INDEX(rate, '/', 1) AS DECIMAL(3,1)) DESC
LIMIT 5;

-- QUESTION 2: Top 3 most expensive cuisines by average cost for two people
SELECT cuisines,
       ROUND(AVG(CAST(REPLACE(`approx_cost(for two people)`, ',', '') AS DECIMAL(10,2))), 2) AS avg_cost_for_two_people
FROM restaurants
WHERE `approx_cost(for two people)` IS NOT NULL
GROUP BY cuisines
ORDER BY avg_cost_for_two_people DESC
LIMIT 3;

-- QUESTION 3: Restaurants offering online delivery with rating below 3.0
SELECT name, online_order, rate, votes, cuisines
FROM restaurants
WHERE online_order = 'Yes'
  AND rate IS NOT NULL
  AND CAST(SUBSTRING_INDEX(rate, '/', 1) AS DECIMAL(3,1)) < 3.0;

-- Marketing strategy:
-- 1. Improve food quality and value for money based on customer feedback.
-- 2. Improve packaging so food reaches customers in good condition.
-- 3. Use short-term discounts and offers after service quality improves.
-- 4. Encourage genuine customer reviews to identify recurring issues.

-- QUESTION 4: Segment restaurants by average cost for two people
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

-- QUESTION 5: Top 10 most popular restaurant chains by number of outlets
SELECT name,
       COUNT(*) AS number_of_outlets
FROM restaurants
GROUP BY name
ORDER BY number_of_outlets DESC
LIMIT 10;
