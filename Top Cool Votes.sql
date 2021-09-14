--Find the business and the review_text that received the highest number of  'cool' votes.
--Output the business name along with the review text.

with temp as 
(
select business_name,review_text,
sum(cool) over (partition by business_name) as sum_cool
from yelp_reviews
order by 3 desc
)
select business_name,review_text
from temp
where sum_cool=(select max(sum_cool) from temp);
