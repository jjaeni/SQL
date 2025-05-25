with summary_user as (
    select year(S.sales_date) as year,
    month(S.sales_date) as month,
    I.gender,
    user_id
    from online_sale S
    join user_info I using (user_id)
    where I.gender is not null
)
select year, month, gender, count(distinct user_id) as users
from summary_user
group by year, month, gender
order by year asc, month asc, gender asc;