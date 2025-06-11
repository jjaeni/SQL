select price_group, count(price_group) as products
from (
    select truncate(price/10000, 0)*10000 as price_group
    from product
) A
group by 1
order by 1