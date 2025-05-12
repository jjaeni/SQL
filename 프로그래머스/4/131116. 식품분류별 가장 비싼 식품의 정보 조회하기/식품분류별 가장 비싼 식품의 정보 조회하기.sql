-- 맛있는배추김치 맛있는마조유 맛있는김치찌개 맛있는허니버터칩
with filtered_category as (
    select category, max(price) as max_price
    from food_product
    where category in ('과자', '국', '김치', '식용유')
    group by category
)
select P.category, C.max_price, P.product_name
from food_product P
join filtered_category C
on (P.price = C.max_price) and (P.category = C.category)
order by C.max_price desc