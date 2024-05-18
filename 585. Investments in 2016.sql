-- Write a solution to report the sum of all total investment values in 2016 tiv_2016, for all policyholders who:
-- have the same tiv_2015 value as one or more other policyholders, and
-- are not located in the same city as any other policyholder (i.e., the (lat, lon) attribute pairs must be unique).
-- Round tiv_2016 to two decimal places.


select round(sum(tiv_2016),2) as tiv_2016
from Insurance
where tiv_2015 in 
(select tiv_2015 
from Insurance 
group by 1 
having count(*) > 1) 
and concat(lat,lon) in (
select concat(lat,lon)
from Insurance
group by 1 
having count(*) < 2)
