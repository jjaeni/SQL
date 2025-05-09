/* author(author_id) book book_sales(book_id) */
select A.author_id, A.author_name, B.category, sum(B.price*BS.sales) as total_sales
from (select *
      from book_sales S
      where sales_date like '2022-01%') BS
join book B using (book_id)
join author A using (author_id)
group by A.author_id, B.category
order by A.author_id, B.category desc