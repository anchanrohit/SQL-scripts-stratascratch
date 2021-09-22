--Given a table of purchases by date, calculate the month-over-month percentage change in revenue. The output should include the year-month date (YYYY-MM) and percentage change, rounded to the 2nd decimal point, and sorted from the beginning of the year to the end of the year.
--The percentage change column will be populated from the 2nd month forward and can be calculated as ((this month's revenue - last month's revenue) / last month's revenue)*100.


with temp1 as 
(
select sum(value) as revenue, to_char(created_at,'YYYY-MM') as month
from sf_transactions
group by 2
order by 2
), temp2 as
(
select month,revenue,
lag(revenue) over (order by month asc) as lag_revenue
from temp1
)
select month,round(((revenue-lag_revenue)/lag_revenue)*100,2) as percentchange
from temp2;