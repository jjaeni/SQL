-- used_goods_board used_goods_user
with total_price as (
    select U.user_id, U.nickname, sum(price) as total_sales
    from used_goods_board B
    join used_goods_user U on (B.writer_id = U.user_id)
    where B.status = 'done'
    group by B.writer_id
)
select *
from total_price
where total_sales >= 700000
order by total_sales