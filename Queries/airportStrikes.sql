select ar.airport_name, count(ar.airport_name) as strikes
from airport ar
join aircraftairportbridge aab
on ar.airport_id = aab.airport_id
join birdstrikedetails bs
on aab.record_id = bs.record_id
group by ar.airport_name
order by strikes desc

