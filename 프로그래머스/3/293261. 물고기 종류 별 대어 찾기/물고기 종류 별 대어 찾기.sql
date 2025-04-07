/* id, fish_type, length, time
fish_type, fish_name */
with max_fish_type as (
    select fish_type, max(length) as length
    from fish_info
    group by fish_type
),
max_fish_name as (
    select I.id, N.fish_name, M.length
    from max_fish_type M
    join fish_info I
    on (M.fish_type = I.fish_type and M.length = I.length)
    
    join fish_name_info N
    on (M.fish_type = N.fish_type)
)
select *
from max_fish_name
order by id;