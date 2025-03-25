-- 코드를 작성해주세요
select I1.item_id, I1.item_name, I1.rarity
from (
    select *
    from item_info
    join item_tree using (item_id)
    ) I1
join item_info I2
on I1.parent_item_id = i2.item_id
where I2.rarity = 'rare'
order by I1.item_id desc