--You have a table of in-app purchases by user. Users that make their first in-app purchase are placed in a marketing campaign where they see call-to-actions for more in-app purchases. Find the number of users that made additional in-app purchases due to the success of the marketing campaign.

--The marketing campaign doesn't start until one day after the initial in-app purchase so users that make multiple purchases on the same day do not count, nor do we count users that make only the same purchases over time.

with filtered_query
as 
(select user_id,count(distinct created_at),count(distinct product_id)
from marketing_campaign
group by user_id
having count(distinct created_at)!=1
and count(distinct product_id)!=1
)
select count(distinct user_id)
from filtered_query;
