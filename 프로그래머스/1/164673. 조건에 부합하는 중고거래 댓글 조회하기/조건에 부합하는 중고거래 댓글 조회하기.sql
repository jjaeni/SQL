-- 코드를 입력하세요
SELECT ugb.title, board_id, ugr.reply_id, ugr.writer_id, ugr.contents, date_format(ugr.created_date, '%Y-%m-%d') as created_date
from used_goods_board ugb
join used_goods_reply ugr using (board_id)
where year(ugb.created_date) = '2022'
and month(ugb.created_date) = '10'
order by ugr.created_date asc, ugb.title asc