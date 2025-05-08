/* 5회 이상 대여 자동차의 월별 ID별 대여 횟수(컬럼명: RECORDS)
month asc id desc */
with rental_filter as (
    select *, count(*) over (partition by car_id) as cnt
    from car_rental_company_rental_history
    where start_date >= '2022-08-01' and start_date < '2022-11-01'
)
select month(start_date) as month, car_id, count(*) as RECORDS
from rental_filter
where cnt >= 5
group by month(start_date), car_id
order by month, car_id desc