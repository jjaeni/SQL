-- MCDP_CD 진료과코드
select MCDP_CD as '진료과코드', count(*) as '5월예약건수'
from appointment
where apnt_ymd like '2022-05%'
group by MCDP_CD
order by count(*) asc, MCDP_CD asc;