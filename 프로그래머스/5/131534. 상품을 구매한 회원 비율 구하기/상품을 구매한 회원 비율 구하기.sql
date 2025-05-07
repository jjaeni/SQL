-- 코드를 입력하세요
with user_filter as (
    select *
    from user_info
    where joined like '2021-%'
),
user_cnt as (
    select count(user_id) as cnt
    from user_filter
),
user_sale as (
    select year(S.sales_date) as year, month(S.sales_date) as month, count(distinct(F.user_id)) as purchased_users
    from user_filter F
    join online_sale S using (user_id)
    group by year(S.sales_date), month(S.sales_date)
)
select US.year, US.month, US.purchased_users, round(US.purchased_users/C.cnt, 1) as purchased_ratio
from user_sale US, user_cnt C
order by US.year, US.month