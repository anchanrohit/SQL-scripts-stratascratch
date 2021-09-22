--Find the top 5 states with the most 5 star businesses. Output the state name along with the number of 5-star businesses and order records by the number of 5-star businesses in descending order. In case there are ties in the number of businesses, return all the unique states. If two states have the same result, sort them in alphabetical order.


with rnkquery as (
select state,count(stars) as cnt,
rank() over (order by count(stars) desc) as rnk
from yelp_business
where stars=5
group by state
order by 2 desc,state asc
)
select state,cnt
from rnkquery
where rnk<=5
order by 2 desc,state asc;