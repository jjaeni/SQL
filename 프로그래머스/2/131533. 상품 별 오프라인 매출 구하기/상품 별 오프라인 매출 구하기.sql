/* product_id */
SELECT P.product_code, sum(P.price*O.sales_amount) as SALES
from product P
join offline_sale O using (product_id)
group by P.product_code
order by SALES desc, product_code