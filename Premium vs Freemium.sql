--Find the total number of downloads for paying and non-paying users by date. Include only records where non-paying customers have more downloads than paying customers. The output should be sorted by earliest date first and contain 3 columns date, non-paying downloads, paying downloads.

with nonpaying as
(
select sum(df.downloads) as non_paying,date
from ms_user_dimension ud
left join ms_acc_dimension ac on ac.acc_id=ud.acc_id
left join ms_download_facts df on df.user_id=ud.user_id
where paying_customer='no'
group by date
order by date
), paying as 
(
select sum(df.downloads) as paying_cnt,date
from ms_user_dimension ud
left join ms_acc_dimension ac on ac.acc_id=ud.acc_id
left join ms_download_facts df on df.user_id=ud.user_id
where paying_customer='yes'
group by date
order by date
)
select a1.date,a1.non_paying,a2.paying_cnt
from nonpaying a1
join paying a2 on a1.date=a2.date
where a1.non_paying>a2.paying_cnt
;