-- Problem: 197. Rising Temperature
-- Pattern: LAG() Window Function + CTE
--
-- Explanation:
-- CTE computes previous day's temperature and date using LAG().
-- WHERE filters where today's temperature exceeds yesterday's
-- AND the dates are exactly 1 day apart.
--
-- Query Behavior:
-- LAG(temperature, 1) and LAG(recordDate, 1) both look one row back.
-- DATEDIFF(recordDate, lag_date) = 1 handles non-consecutive date gaps.
-- Without DATEDIFF check, rows with missing dates between them
-- would incorrectly pass the temperature comparison.

WITH cte AS (
    SELECT id,
           temperature,
           recordDate,
           LAG(temperature, 1) OVER (ORDER BY recordDate ASC) AS lag1,
           LAG(recordDate, 1) OVER (ORDER BY recordDate ASC) AS lag_date
    FROM Weather
)
SELECT id AS Id
FROM cte
WHERE temperature > lag1
AND DATEDIFF(recordDate, lag_date) = 1;
