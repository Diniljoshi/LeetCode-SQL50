-- Write a solution to get the names of products that have at least 100 units ordered in February 2020 and their amount. Return the result table in any order.


select product_name, sum(unit) as unit
from Products p
join Orders o
on p.product_id = o.product_id
where year(order_date) = '2020' and month(order_date) = '02'
group by product_name
having unit >= 100
