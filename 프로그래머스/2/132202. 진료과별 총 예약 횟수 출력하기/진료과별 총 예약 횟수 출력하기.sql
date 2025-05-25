-- MCDP_CD 진료과코드 환자 수이므로 distinct 필요
select MCDP_CD as '진료과코드', count(distinct PT_NO) as '5월예약건수'
from appointment
where apnt_ymd like '2022-05%'
group by MCDP_CD
order by 5월예약건수 asc, 진료과코드 asc;
