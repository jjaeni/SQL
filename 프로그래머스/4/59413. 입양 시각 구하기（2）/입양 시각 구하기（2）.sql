select A.hour, ifnull(B.cnt, 0) as count
from (
    select @N:=@N+1 as hour
    from animal_outs, (select @N:=-1 from dual) NN
    limit 24
) A
left join (
    select hour(datetime) as hour, count(hour(datetime)) as cnt
    from animal_outs
    group by hour(datetime)
) B using (hour)