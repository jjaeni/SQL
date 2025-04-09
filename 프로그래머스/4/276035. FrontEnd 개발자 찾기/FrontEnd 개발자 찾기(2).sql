/* Edit through GPT*/
select D.id, D.email, D.first_name, D.last_name
from developers D
where exists (select 1
              from skillcodes S
              where S.category like 'Front%' and (D.skill_code & S.code) > 0)
order by D.id;
