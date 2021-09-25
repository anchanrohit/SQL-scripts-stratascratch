Find the popularity percentage for each user on Facebook. The popularity percentage is defined as the total number of friends the user has divided by the total number of users on the platform, then converted into a percentage by multiplying by 100.
Output each user along with their popularity percentage. Order records in ascending order by user id.
The 'user1' and 'user2' column are pairs of friends.

with user_friend_table 
as (
select user1,user2
from facebook_friends
union 
select user2 as user1,user1 as user2
from facebook_friends
order by user1 asc
),
total_users as
(
select count(distinct user1) total_count
from user_friend_table
),
total_friends as 
(
select user1,
count(user1) over (partition by user1 order by user1) as friends_total
from user_friend_table
) 
select distinct user1,(tf.friends_total/tu.total_count::float)*100 as percent
from total_friends tf
left join total_users tu
on 1=1
order by 1;