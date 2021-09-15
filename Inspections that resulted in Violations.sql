--You're given a dataset of health inspections. 
--Count the number of inspections that resulted in a violation for 'Roxanne Cafe' for each year. If an inspection resulted in a violation, there will be a value in the 'violation_id' column. Output the number of inspections by year in ascending order.


select  count(inspection_id),extract(year from inspection_date)as yr
from sf_restaurant_health_violations
where business_name like '%Roxanne%'
group by extract(year from inspection_date);