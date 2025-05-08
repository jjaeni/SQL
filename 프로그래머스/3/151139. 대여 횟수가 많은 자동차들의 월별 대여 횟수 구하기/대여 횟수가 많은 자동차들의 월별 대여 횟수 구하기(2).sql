-- 기존 코드 -> 클린 코드로 수정
with filtered_rentals as ( #CTE 이름은 목적을 드러내도록
  select
    car_id,
    start_date,
    count(*) over (partition by car_id) as rental_count #cnt->rental_count 변수명 직관적으로 / 필요한 컬럼만 명시적 선택
  from car_rental_company_rental_history
  where start_date >= '2022-08-01' and start_date < '2022-11-01'
)

select
  month(start_date) as month,
  car_id,
  count(*) as records
from filtered_rentals
where rental_count >= 5
group by month(start_date), car_id
order by month, car_id desc;
