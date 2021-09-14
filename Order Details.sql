--Find order details made by Jill and Eva.
--Consider the Jill and Eva as first names of customers.
--Output the order date, details and cost along with the first name.
--Order records based on the customer id in ascending order

select o.order_date,o.order_details,o.total_order_cost,c.first_name
from customers c 
left join orders o on o.cust_id=c.id
where c.first_name in ('Jill','Eva')
order by o.cust_id asc;