-- Write a solution to find the second highest salary from the Employee table.

select salary
from
(
select salary, dense_rank() over(order by salary) as SecondHighestSalary
from Employee
) as a
where SecondHighestSalary = 2


-Alternative Method
select(
select salary 
from Employee
order by salary desc
limit 1,1                       -- limit 1, offset 1
) as SecondHighestSalary 

