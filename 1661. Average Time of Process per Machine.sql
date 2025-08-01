select a1.machine_id, round(cast(avg((a2.timestamp - a1.timestamp))as numeric), 3) processing_time 
from activity a1
join activity a2
on a1.machine_id = a2.machine_id
where a1.activity_type = 'start' and a2.activity_type = 'end'
group by a1.machine_id