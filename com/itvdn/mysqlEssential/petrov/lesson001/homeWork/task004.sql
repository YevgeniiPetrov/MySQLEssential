/* Задание 4
Из задания 3 таблицы 2 получить id сотрудников, зарплата которых больше 10000.*/

select 
	ewd.id as employee_id
from 
	mydb.employee_work_data ewd
where 
	ewd.salary > 10000;
	