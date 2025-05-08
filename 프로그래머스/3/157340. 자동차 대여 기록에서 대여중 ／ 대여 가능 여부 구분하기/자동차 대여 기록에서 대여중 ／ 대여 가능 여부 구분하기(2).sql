-- GPT 클린코드 수정 ver.
with rental_status as (
  select car_id,
  case when '2022-10-16' between start_date and end_date then 1
  else 0 end as is_rented
  from car_rental_company_rental_history
)
select
  car_id,
  case when sum(is_rented) > 0 then '대여중'
  else '대여 가능' end as availability
from rental_status
group by car_id
order by car_id desc;
