select *
from ml.predict(
    model airquality.reg_lineal_pollution_p1,
    (
        select
            lat,
            lon,
            year,
            month,
            day,
            hour,
            pressure,
            temperature,
            humidity,
            P1,
            P2
        from airquality.airquality_data
        where split_column >= 0.7
    )
)