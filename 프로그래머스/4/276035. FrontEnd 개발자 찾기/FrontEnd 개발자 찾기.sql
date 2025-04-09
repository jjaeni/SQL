/* skillcodes developers */
select distinct D.id, D.email, D.first_name, D.last_name
from developers D
join (select *
     from skillcodes
     where category like 'Front%') S
on (D.skill_code & S.code)>0
order by id;