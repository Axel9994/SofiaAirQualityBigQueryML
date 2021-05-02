bq load \
    --source_format=CSV \
    --skip_leading_rows=1 \
    --autodetect \
    airquality.weather_table \
    gs://air_quality_ml/*_bme280sof.csv 


bq load \
    --source_format=CSV \
    --skip_leading_rows=1 \
    --autodetect \
    airquality.pollution_table \
    gs://air_quality_ml/*_sds011sof.csv