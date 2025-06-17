-- 호선, 순번, 노선, 역 이름, 역 사이 거리, 노선별 누계 거리
select ROUTE,
concat(round(sum(d_between_dist), 1), 'km') as TOTAL_DISTANCE,
concat(round(avg(d_between_dist), 2), 'km') as AVERAGE_DISTANCE
from subway_distance
group by route
order by sum(d_between_dist) desc