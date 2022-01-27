/* Задание 5
Из задания 3 сотрудник по id 1 был не женат, женился изменить данные в третьей таблице о семейном положении.*/

use mydb;

update 
	employee_personal_data
set 
	married = true
where 
	id = 1;
	