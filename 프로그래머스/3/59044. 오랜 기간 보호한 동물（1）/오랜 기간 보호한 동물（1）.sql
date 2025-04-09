-- 코드를 입력하세요
SELECT I.name, I.datetime
from animal_ins I
left join animal_outs O using (animal_id)
where O.datetime is null
order by I.datetime
limit 3;