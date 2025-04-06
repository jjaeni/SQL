/* 크기 내림차순 상위 25% critical
50% high
75% medium
100% low */
with ecoli_size as (
    select id, ntile(4) over(order by size_of_colony desc) as tile
    from ecoli_data
)
select ID,
    case tile when 1 then 'CRITICAL'
    when 2 then 'HIGH'
    when 3 then 'MEDIUM'
    when 4 then 'LOW' end as COLONY_NAME
from ecoli_size
order by id;