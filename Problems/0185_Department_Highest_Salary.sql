-- Problem: 185. Department Highest Salary
-- Pattern: Correlated Subquery
--
-- Explanation:
-- JOIN Employee and Department to get department names alongside employee data.
-- WHERE filters to only employees whose salary equals the max salary
-- in their own department using a correlated subquery.
-- The subquery runs once per row in the outer query.
--
-- Query Behavior:
-- Correlated subquery references the outer query's departmentId.
-- e2 alias is required to distinguish inner Employee from outer Employee.
-- Multiple employees can appear if they share the department's max salary.
-- Employee.salary is explicit even though unambiguous — good habit with JOINs.

SELECT
    Department.name AS Department,
    Employee.name AS Employee,
    Employee.salary AS Salary
FROM Employee
INNER JOIN Department
ON Employee.departmentId = Department.id
WHERE Employee.salary = (
    SELECT MAX(salary)
    FROM Employee e2
    WHERE e2.departmentId = Employee.departmentId
);
