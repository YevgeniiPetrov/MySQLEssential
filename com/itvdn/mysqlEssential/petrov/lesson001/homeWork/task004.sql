/* ������� 4
�� ������� 3 ������� 2 �������� id �����������, �������� ������� ������ 10000.*/

select 
	ewd.id as employee_id
from 
	mydb.employee_work_data ewd
where 
	ewd.salary > 10000;
	