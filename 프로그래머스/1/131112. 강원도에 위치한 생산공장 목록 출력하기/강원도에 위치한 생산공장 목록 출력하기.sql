-- 코드를 입력하세요
SELECT factory_id, factory_name, address
from food_factory
where instr(tlno, 033) > 0
order by factory_id asc