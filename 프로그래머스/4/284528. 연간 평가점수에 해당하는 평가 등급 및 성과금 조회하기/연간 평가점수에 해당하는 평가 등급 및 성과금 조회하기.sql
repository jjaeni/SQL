with employee_grade as (
    select emp_no,
    case when avg(score) >= 96 then 'S'
    when avg(score) >= 90 then 'A'
    when avg(score) >= 80 then 'B'
    else 'C' end as grade
    from hr_grade
    group by emp_no
),
employee_bonus as (
    select e.emp_no, e.emp_name, g.grade,
    case when g.grade = 'S' then e.sal*0.2
    when g.grade = 'A' then e.sal*0.15
    when g.grade = 'B' then e.sal*0.1
    else 0 end as bonus
    from employee_grade g
    join hr_employees e using (emp_no)
)
select *
from employee_bonus
order by emp_no