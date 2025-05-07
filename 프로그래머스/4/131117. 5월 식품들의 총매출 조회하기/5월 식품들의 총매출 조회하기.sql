-- 코드를 입력하세요
with order_product as (
    SELECT P.product_id, P.product_name, P.price*O.amount as SALES
    from food_product P
    join food_order O using (product_id)
    where O.produce_date like '2022-05-%'
)
select product_id, product_name, sum(SALES) as TOTAL_SALES
from order_product
group by product_name
order by sum(SALES) desc, product_id