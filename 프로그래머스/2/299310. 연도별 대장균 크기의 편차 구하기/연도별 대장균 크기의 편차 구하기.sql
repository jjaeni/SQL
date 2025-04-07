/* 편차: 연도별 큰 대장균 크기 - 각 대장균 크기
연도 오름차순, 대장균 크기 편차 오름차순 정렬
YEAR YEAR_DEV ID
*/
with year_colony as (
    select id, size_of_colony, year(differentiation_date) as year
    from ecoli_data
    order by year
)
select C1.YEAR, C2.max_size-C1.size_of_colony as YEAR_DEV, C1.ID
from year_colony C1
left join (select year, max(size_of_colony) as MAX_SIZE
           from year_colony
           group by year) C2
on (C1.year=C2.year)
order by year, year_dev