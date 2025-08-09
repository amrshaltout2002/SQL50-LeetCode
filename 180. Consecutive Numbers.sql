select distinct l1.num ConsecutiveNums
from logs l1
left join logs l2 on l1.num = l2.num
left join logs l3 on l2.num = l3.num
where l1.id = l2.id+1 and l2.id = l3.id+1