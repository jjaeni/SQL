-- 코드를 입력하세요
select distinct flavor
from first_half fh
join icecream_info ii using (flavor)
where total_order > 3000
and ingredient_type = 'fruit_based'