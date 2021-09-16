--Find the rate of processed tickets for each type.

with total_count_table as 
(
select count(*) as total_count, type
from facebook_complaints
group by type
), processed_table as
(
select count(*) as processed_count, type
from facebook_complaints
where processed=TRUE
group by type
)
select t.type,p.processed_count::float/t.total_count::float as rate
from total_count_table t
inner join processed_table p on p.type=t.type;


