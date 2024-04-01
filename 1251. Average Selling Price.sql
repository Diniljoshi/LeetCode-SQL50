-- Write a solution to find the average selling price for each product. average_price should be rounded to 2 decimal places.
-- Return the result table in any order.
-- The result format is in the following exa

select p.product_id ,ifnull(round(sum(u.units*p.price)/sum(u.units),2),0) as average_price
from prices p
left join UnitsSold u
on p.product_id = u.product_id and u.purchase_date between p.start_date and p.end_date
group by 1;
