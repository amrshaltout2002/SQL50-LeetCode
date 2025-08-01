select eu.unique_id unique_id, e.name name
from employeeuni eu
right join employees e
on eu.id = e.id