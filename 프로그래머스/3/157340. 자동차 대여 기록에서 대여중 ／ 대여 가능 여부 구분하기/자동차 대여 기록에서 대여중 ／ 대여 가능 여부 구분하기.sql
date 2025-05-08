-- 코드를 입력하세요
with available_rental as (
    select car_id,
    case when start_date > '2022-10-16' or end_date < '2022-10-16' then '0'
    else '1'
    end as available
    from car_rental_company_rental_history
)
select car_id,
case when sum(available) = 1 then '대여중'
else '대여 가능' end as availability
from available_rental
group by car_id
order by car_id desc