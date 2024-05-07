-- Write a solution to fix the names so that only the first character is uppercase and the rest are lowercase.
-- Return the result table ordered by user_id.
-- The result format is in the following example.
  
select user_id, concat(ucase(left(name,1)),lcase(substring(name,2))) as name
from Users
order by 2
