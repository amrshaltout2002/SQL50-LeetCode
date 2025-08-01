select name, bonus
from employee e
left join bonus b
on e.empId = b.empId
where e.empId not in (select empId from bonus where bonus > 1000)
