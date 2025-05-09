-- 코드를 입력하세요
select car_type, count(*) as cars
from car_rental_company_car
where find_in_set('통풍시트', options) > 0
or find_in_set('열선시트', options) > 0
or find_in_set('가죽시트', options) > 0
group by car_type
order by car_type