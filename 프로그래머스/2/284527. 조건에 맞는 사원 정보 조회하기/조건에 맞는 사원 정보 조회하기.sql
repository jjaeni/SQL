/* HR_GRADE: EMP_NO, YEAR, HALF_YEAR, SCORE
HR_EMPLOYEES: EMP_NO, EMP_NAME, DEPT_ID, POSITION, EMAIL, COMP_TEL, HIRE_DATE, SAL */
/* 22년 평가점수: 상/하반기 점수의 합 */
with best_employee as (
    select emp_no, sum(score) as total_score
    from hr_grade
    group by emp_no
    order by total_score desc
    limit 1
)
select total_score as score, emp_no, emp_name, position, email
from best_employee B
join hr_employees E using (emp_no)