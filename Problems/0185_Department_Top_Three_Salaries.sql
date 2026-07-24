-- Problem: 185. Department Top Three Salaries
-- Pattern: CTE + DENSE_RANK() Window Function
--
-- Explanation:
-- CTE computes DENSE_RANK for every employee partitioned by department.
-- Outer query joins Employee, Department and CTE together.
-- WHERE filters to only top 3 ranks per department.
--
-- Query Behavior:
-- PARTITION BY departmentId resets rank for each department.
-- DENSE_RANK handles ties — two employees with same salary get same rank.
-- Window functions can't be used in WHERE directly — CTE solves this.
-- JOIN cte ON e.id = cte.id links the computed ranks back to employees.

WITH cte AS (
    SELECT id, DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC)
    AS rank_
    FROM Employee
)
SELECT
    d.name AS Department,
    e.name AS Employee,
    e.salary AS Salary
FROM Employee e
JOIN Department d ON e.departmentId = d.id
JOIN cte ON e.id = cte.id
WHERE cte.rank_ < 4;
