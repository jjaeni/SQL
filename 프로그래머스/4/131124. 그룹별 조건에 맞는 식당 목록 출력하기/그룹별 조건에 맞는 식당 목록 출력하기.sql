-- with 구문 밖의 select절부터 gpt 도움
with review_cnt as (
    select count(*) over (partition by M.member_id) as cnt, M.member_name,
    R.review_text, date_format(R.review_date, '%Y-%m-%d') as REVIEW_DATE
    from member_profile M
    join rest_review R using (member_id)
)
select member_name, review_text, REVIEW_DATE
from review_cnt
where cnt = (select max(cnt) from review_cnt)
order by review_date, review_text;
