-- Write a solution to find managers with at least five direct reports.
-- Return the result table in any order.


SELECT e1.name 
FROM Employee e1 
JOIN Employee e2 ON e1.id = e2.managerId 
GROUP BY e2.managerId 
HAVING COUNT(*) >= 5;


select name
from Employee
where id in 
(
    select managerId
    from employee 
    group by 1
    having count(*) >=5
);
