--Find the date with the highest total energy consumption from the Facebook data centers. 
--Output the date along with the total energy consumption across all data centers.

with union_table as 
(
select * from 
fb_eu_energy
union all 
select * from 
fb_asia_energy
union all 
select * from 
fb_na_energy
), total_table as  
(
select date,sum(consumption) as total_consumption
from union_table
group by date
order by sum(consumption) desc
)
select date,total_consumption
from total_table
where total_consumption=
(select max(total_consumption)
from total_table)
;



