--Calculate the total revenue from each customer in March 2019. 

--Output the revenue along with the customer id and sort the results based on the revenue in descending order.

select cust_id,sum(total_order_cost)
from orders
where order_date::text like '2019-03%'
group by cust_id
order by sum(total_order_cost) desc
;
