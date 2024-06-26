-- A company's executives are interested in seeing who earns the most money in each of the company's departments. A high earner in a department is an employee who has a salary in the top three unique salaries for 
-- that department.Write a solution to find the employees who are high earners in each of the departments. Return the result table in any order.

with cte as
(
select e.*, d.name as Department 
from employee e
inner join department d
on e.departmentId= d.id
)
select Department, name as Employee, salary as Salary 
from 
(
    select *,
    dense_rank() over(partition by departmentId order by salary desc) as sal_rank 
    from cte) t
where sal_rank < 4
