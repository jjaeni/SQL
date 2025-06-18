/* A: front end + python
B: C#
C: other front end */
with skill_codes as (
    select max(case when name='python' then code end) as python,
    max(case when name='c#' then code end) as csharp,
    sum(case when category='front end' then code else 0 end) as frontend
    from skillcodes
),
developer_grades as (
    select
    case when (d.skill_code & s.frontend)>0 and (d.skill_code & s.python)>0 then 'A'
    when (d.skill_code & s.csharp) > 0 then 'B'
    when (d.skill_code & s.frontend) > 0 then 'C' else null end as grade,
    d.id, d.email
    from developers d, skill_codes s
)
select *
from developer_grades
where grade is not null
order by grade, id