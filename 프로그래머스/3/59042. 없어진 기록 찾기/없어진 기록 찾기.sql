/* animal_id */
SELECT O.animal_id, O.name
from animal_ins I
right join animal_outs O using (animal_id)
where I.datetime is null
order by O.animal_id, O.name;