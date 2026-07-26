-- Problem: 570. Managers with at Least 5 Direct Reports
-- Pattern: Self Join + GROUP BY + HAVING
--
-- Explanation:
-- Inner subquery groups employees by managerId and filters
-- those who appear as a manager 5 or more times.
-- Outer query joins back to Employee to retrieve the manager's name.
--
-- Query Behavior:
-- GROUP BY collapses rows into a virtual table of managerIds.
-- HAVING filters after grouping — WHERE cannot filter aggregates.
-- COUNT(*) counts all rows in group regardless of NULL.
-- JOIN back to original table is required — grouped result
-- loses all columns except the grouped one and aggregates.

SELECT e.name
FROM Employee e
JOIN (
    SELECT managerId
    FROM Employee
    GROUP BY managerId
    HAVING COUNT(*) >= 5
) m ON e.id = m.managerId;
