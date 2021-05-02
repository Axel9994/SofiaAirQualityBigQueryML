create table airquality.airquality_data
partition by date(timestamp)
as
select w.lat,
       w.lon,
       w.timestamp,
       EXTRACT(DAY from w.timestamp) as day,
       EXTRACT(MONTH from w.timestamp) as month,
       EXTRACT(YEAR from w.timestamp) as year,
       EXTRACT(HOUR from w.timestamp) as hour,
       w.pressure,
       w.temperature,
       w.humidity
       p.P1,
       p.P2,
       rand() as split_column
from airquality.weather_table w
inner join airquality.pollution_table P
on w.timestamp = p.timestamp and w.location = p.location
where w.lat is not null and w.lon is not null and w.timestamp is not null
and w.pressure is not null and w.temperature is not null and w.humidity is not null
and p.P1 is not null and p.P2 is not null