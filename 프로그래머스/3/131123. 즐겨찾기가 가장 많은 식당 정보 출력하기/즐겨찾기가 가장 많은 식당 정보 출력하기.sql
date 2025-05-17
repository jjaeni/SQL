-- max(favorites) 기준 Join
select A.food_type, A.rest_id, A.rest_name, B.favorites
from rest_info A
join (
    select food_type, max(favorites) as favorites
    from rest_info 
    group by food_type) B
on (A.favorites = B.favorites and A.food_type = B.food_type)
order by food_type desc;