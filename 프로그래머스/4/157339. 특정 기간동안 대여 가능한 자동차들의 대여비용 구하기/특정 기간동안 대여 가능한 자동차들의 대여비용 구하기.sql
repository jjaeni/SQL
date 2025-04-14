/* gpt 활용
대여기간 오류: 11월에 1건이라도 대여가 잡혀있으면 안됨
할인율 오류: 할인 정책이 없어도 between 500000 and 2000000이기만 하면 됨
렌탈비 오류: 200만원 미만이므로 between 500000 and 1999999 설정
*/
# 자동차 종류 세단, SUV
# 11월 1일부터 11월 30일까지 30일간 대여 가능한 자동차
# 대여 금액이 50만원 이상, 200만원 미만
# 대여 금액 내림차순, 자동차 종류 오름차순, 자동차 id 내림차순
with available_cars as (
    select C.car_id, C.car_type, C.daily_fee
    from car_rental_company_car C
    where C.car_type in ('세단', 'SUV')
    and C.car_id not in (
        select distinct R.car_id
        from car_rental_company_rental_history R
        where R.start_date <= '2022-11-30'
        and R.end_date >= '2022-11-01'
    )
),
discounted_cars as (
    select A.car_id,
    A.car_type,
    A.daily_fee,
    coalesce(D.discount_rate, 0) as discount_rate
    from available_cars A
    left join car_rental_company_discount_plan D
    on A.car_type = D.car_type and D.duration_type = '30일 이상'
)
select car_id,
car_type,
CAST(DAILY_FEE * 30 * (1 - (DISCOUNT_RATE / 100.0)) AS signed) AS FEE
from discounted_cars
where daily_fee * 30 *(1-(discount_rate/100)) between 500000 and 1999999
order by fee desc, car_type asc, car_id desc