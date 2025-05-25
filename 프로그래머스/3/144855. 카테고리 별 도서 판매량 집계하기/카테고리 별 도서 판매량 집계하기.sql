select b.category, sum(S.sales)
from book B
join book_sales S using (book_id)
where S.sales_date like '2022-01%'
group by B.category
order by B.category