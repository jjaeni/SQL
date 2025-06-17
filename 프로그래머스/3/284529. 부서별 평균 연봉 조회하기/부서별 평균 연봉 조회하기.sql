-- hr_department, hr_employees
select dept_id, dept_name_en, avg_sal
from hr_department d
join (
    select dept_id, round(avg(sal)) as avg_sal
    from hr_employees
    group by dept_id) e using(dept_id)
order by avg_sal desc