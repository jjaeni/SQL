--내꺼 gpt 도움받아 수정한 코드
WITH available_car AS (
    SELECT *
    FROM car_rental_company_car
    WHERE car_type IN ('SUV', '세단')
      AND car_id NOT IN (
          SELECT car_id
          FROM car_rental_company_rental_history
          WHERE start_date <= '2022-11-30'
            AND end_date >= '2022-11-01'
      )
),
rental_fee AS (
    SELECT 
        A.car_id,
        A.car_type,
        (A.daily_fee * 30) * (1 - (COALESCE(P.discount_rate, 0) / 100.0)) AS fee
    FROM available_car AS A
    LEFT JOIN car_rental_company_discount_plan AS P
      ON A.car_type = P.car_type
     AND P.duration_type = '30일 이상'
)
SELECT DISTINCT
    car_id,
    car_type,
    CAST(fee AS INTEGER) AS fee
FROM rental_fee
WHERE fee BETWEEN 500000 AND 1999999
ORDER BY fee DESC, car_type ASC, car_id DESC;
