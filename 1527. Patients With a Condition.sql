-- Write a solution to find the patient_id, patient_name, and conditions of the patients who have Type I Diabetes. Type I Diabetes always starts with DIAB1 prefix.
-- Return the result table in any order.
-- The result format is in the following example.

select *
from Patients 
where conditions like 'DIAB1%' OR conditions LIKE '% DIAB1%';
