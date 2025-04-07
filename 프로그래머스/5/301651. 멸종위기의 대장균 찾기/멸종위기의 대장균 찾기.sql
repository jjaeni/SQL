-- GPT 사용
with recursive generation_info as (
    select id, 1 as generation
    from ecoli_data
    where parent_id is null
    union all
    select e.id, g.generation+1
    from ecoli_data e
    join generation_info g
    on e.parent_id = g.id
)
select count(*) as count, generation
from generation_info g
where not exists (
    select 1
    from ecoli_data e
    where e.parent_id = g.id)
group by generation
order by generation;