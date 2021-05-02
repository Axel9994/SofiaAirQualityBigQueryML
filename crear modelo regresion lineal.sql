CREATE MODEL
  `airquality.reg_lineal_pollution_p1` OPTIONS( model_type='LINEAR_REG',
    DATA_SPLIT_METHOD='CUSTOM',
    DATA_SPLIT_COL='SPLIT',
    input_label_cols=['P1'] ) AS
SELECT
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
  P2,
  FALSE AS split
FROM
  `airquality.airquality_data`
WHERE
  split_column < 0.7
UNION ALL
SELECT
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
  P2,
  TRUE AS split
FROM
  `airquality.airquality_data`
WHERE
  split_column >= 0.7