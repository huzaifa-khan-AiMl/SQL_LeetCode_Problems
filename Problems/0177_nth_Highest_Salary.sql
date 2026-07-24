-- Problem: 177. Nth Highest Salary
-- Pattern: LIMIT + OFFSET + DECLARE variable
--
-- Explanation:
-- OFFSET skips the top N-1 salaries.
-- LIMIT 1 picks the next one — that's the Nth highest.
-- DECLARE M is required because MySQL doesn't allow expressions
-- like N-1 directly inside LIMIT/OFFSET.
--
-- Query Behavior:
-- DECLARE creates a local variable inside the function scope.
-- SET assigns N-1 to M before the query runs.
-- DISTINCT ensures duplicate salaries don't affect the ranking.
-- Returns NULL automatically if fewer than N distinct salaries exist.
-- Note: BEGIN...END, DECLARE, SET are MySQL function concepts —
-- not relevant to ML work, but tests LIMIT/OFFSET understanding.

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
    DECLARE M INT;
    SET M = N - 1;
    RETURN (
        SELECT DISTINCT salary
        FROM Employee
        ORDER BY salary DESC
        LIMIT 1 OFFSET M
    );
END
