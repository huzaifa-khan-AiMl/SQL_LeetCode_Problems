-- Problem: 181. Employees Earning More Than Their Managers
-- Pattern: Self Join
--
-- Explanation:
-- We join the Employee table with itself.
-- 'e' represents the employee, 's' represents the manager.
-- We link them via e.managerId = s.id
-- Then filter where the employee's salary exceeds the manager's salary.
--
-- Query Behavior:
-- Self join creates a combined row pairing each employee with their manager.
-- ON condition determines who is employee and who is manager — order matters.
-- WHERE then filters this combined table row by row.

SELECT
    e.name AS Employee
FROM Employee e
JOIN Employee s
ON e.managerId = s.id
WHERE e.salary > s.salary;
