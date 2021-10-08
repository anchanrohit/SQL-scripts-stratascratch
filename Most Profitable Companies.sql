--Find the 3 most profitable companies in the entire world.
--Output the result along with the corresponding company name.
--Sort the result based on profits in descending order.


select r.company,r.profits
from
(
select *,
rank() over (order by profits desc) as rnk
from forbes_global_2010_2014
order by profits desc
) as r
where r.rnk<=3;