--You’re given a table of rental property searches by users. The table consists of search results and outputs host information for searchers. Find the minimum, average, maximum rental prices for each host’s popularity rating. The host’s popularity rating is defined as below:
--   0 reviews: New
 -- 1 to 5 reviews: Rising
   -- 6 to 15 reviews: Trending Up
    --16 to 40 reviews: Popular
    --more than 40 reviews: Hot

with host_id_table as 
(
SELECT *, 
CONCAT(price, room_type, host_since, zipcode,number_of_reviews) AS host_id
FROM airbnb_host_searches
), filtered_table as 
(
select host_id,price,number_of_reviews
from host_id_table
), host_pop_rating_table as 
(
SELECT host_id,
        price,
        (CASE
             WHEN number_of_reviews = 0 THEN 'New'
             WHEN number_of_reviews BETWEEN 1 AND 5 THEN 'Rising'
             WHEN number_of_reviews BETWEEN 6 AND 15 THEN 'Trending Up'
             WHEN number_of_reviews BETWEEN 16 AND 40 THEN 'Popular'
             WHEN number_of_reviews > 40 THEN 'Hot'
         END) as host_pop_rating
         from filtered_table
)
SELECT host_pop_rating,
       MIN(price) AS min_price,
       AVG(price) AS avg_price,
       MAX(price) AS max_price
from host_pop_rating_table
group by host_pop_rating;
