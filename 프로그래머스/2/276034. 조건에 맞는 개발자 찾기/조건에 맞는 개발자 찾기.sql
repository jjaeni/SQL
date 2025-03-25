-- 코드를 작성해주세요
select distinct(D.id), D.email, D.first_name, D.last_name
from developers D
join skillcodes S
on S.name in ('C#', 'python')
and (D.skill_code & S.code)
order by D.id