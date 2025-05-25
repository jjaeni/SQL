/* first_half, icecream_info */
select I.ingredient_type, sum(total_order) as total_order
from first_half H
join icecream_info I using (flavor)
group by I.ingredient_type
order by total_order asc;