/* author_id join */
select B.book_id, A.author_name, date_format(B.published_date, '%Y-%m-%d') as published_date
from (select *
     from book
     where category = '경제') B
join author A using (author_id)
order by B.published_date;