/* animal_id, animal_type, name*/
SELECT I.animal_id, I.animal_type, I.name
from animal_ins I
join animal_outs O using (animal_id)
where I.sex_upon_intake like 'Intact%' and O.sex_upon_outcome not like 'Intact%'
order by animal_id