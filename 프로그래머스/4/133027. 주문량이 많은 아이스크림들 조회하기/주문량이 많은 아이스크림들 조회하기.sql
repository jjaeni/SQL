/*
first_half 상반기 주문정보 july 7월 주문 정보
7월 아이스크림 총 주문량과 상반기의 아이스크림 총 주문량을 더한 값이 큰 순서대로 상위 3개의 맛을 조회하는 SQL문 작성
*/
select flavor
from (
    select * from first_half
    union all
    select * from july
    ) T
group by flavor
order by sum(total_order) desc
limit 3