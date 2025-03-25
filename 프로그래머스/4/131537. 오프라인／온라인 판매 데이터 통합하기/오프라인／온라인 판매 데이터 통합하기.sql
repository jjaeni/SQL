-- 코드를 입력하세요
select date_format(sales_date, '%Y-%m-%d'), product_id, user_id, sales_amount
from (select sales_date, product_id, user_id, sales_amount
from online_sale
where sales_date between '2022-03-01' and '2022-03-31'
union all
select sales_date, product_id, NULL as user_id, sales_amount
from offline_sale
where sales_date between '2022-03-01' and '2022-03-31') as sales
order by sales_date asc, product_id asc, user_id asc