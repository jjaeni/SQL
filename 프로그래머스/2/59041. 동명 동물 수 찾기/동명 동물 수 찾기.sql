select name, cnt as COUNT
from (
    select name, count(name) as cnt
    from animal_ins
    where name is not null
    group by name) A
where A.cnt > 1
order by name
