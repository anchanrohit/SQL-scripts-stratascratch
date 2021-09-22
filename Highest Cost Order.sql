--Find the customer with the highest total order cost between 2019-02-01 to 2019-05-01. If customer had more than one order on a certain day, sum the order costs on daily basis. Output their first name, total cost of their items, and the date.

with sumquery as 
(
select sum(total_order_cost) as totalcost,order_date,cust_id
from orders
group by order_date,cust_id
order by cust_id asc
)
select sq.totalcost,sq.order_date,c.first_name
from sumquery sq
left join customers c on c.id=sq.cust_id
where to_char(sq.order_date,'YYYY-MM-DD') >= '2019-02-01'
and to_char(sq.order_date,'YYYY-MM-DD') <= '2019-05-01'
order by 1 desc
limit 1;