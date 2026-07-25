-- Problem: 180. Consecutive Numbers
-- Pattern: LAG() Window Function + CTE
--
-- Explanation:
-- CTE computes the previous two rows' num values using LAG().
-- Outer query filters where current num equals both lagged values.
-- If all three are equal, the number appears three times consecutively.
--
-- Query Behavior:
-- LAG(num, 1) looks one row back, LAG(num, 2) looks two rows back.
-- ORDER BY id ensures rows are compared in sequence.
-- Window functions can't be used in WHERE — CTE solves this.
-- First two rows will have NULL lags — automatically excluded by WHERE.

WITH cte AS (
    SELECT id,
           num,
           LAG(num, 1) OVER (ORDER BY id) AS lag1,
           LAG(num, 2) OVER (ORDER BY id) AS lag2
    FROM Logs
)
SELECT DISTINCT num AS ConsecutiveNums
FROM cte
WHERE num = lag1 AND num = lag2;
