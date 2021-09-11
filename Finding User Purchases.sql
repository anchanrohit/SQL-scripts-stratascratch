--Write a query that'll identify returning active users. 
--A returning active user is a user that has made a second purchase within 7 days of any other of their purchases. Output a list of user_ids of these returning active users.

--find difference by dates using window function 
--filter on records that have diff <7 days 

with temptable as 
(
select *,
created_at-lag(created_at) over (partition by user_id order by created_at asc) as filter
from amazon_transactions
order by user_id asc,created_at asc
)
select distinct user_id
from temptable
where filter <7
;