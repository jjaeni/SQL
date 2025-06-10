-- 시간대 정렬
select hour, count(hour) as count
from (
    select *, hour(datetime) as hour
    from animal_outs
) as A
where hour >= 9 and hour < 20
group by hour
order by hour