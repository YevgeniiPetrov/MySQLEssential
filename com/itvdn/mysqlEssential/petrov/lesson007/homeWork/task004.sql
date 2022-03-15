/* Задание 4
Создайте функции / процедуры для таких заданий:
	1) Требуется узнать контактные данные сотрудников (номера телефонов, место жительства).
	2) Требуется узнать информацию о дате рождения всех не женатых сотрудников и номера
телефонов этих сотрудников.
	3) Требуется узнать информацию о дате рождения всех сотрудников с должностью менеджер и
номера телефонов этих сотрудников. */

-- Процедура - 1) Требуется узнать контактные данные сотрудников (номера телефонов, место жительства):
delimiter |  
create procedure getEmployeesPersonalData1()
begin
    select 
		concat(e.last_name, ' ', e.first_name, ' ', e.middle_name) as full_name,
		e.phone as phone,
		epd.address as address
	from 
		employee e
		join employee_personal_data epd on epd.employee_id = e.id;
end; |

call getEmployeesPersonalData1();

-- Процедура - 2) Требуется узнать информацию о дате рождения всех не женатых сотрудников и номера телефонов этих сотрудников:
create procedure getEmployeesPersonalData2()
begin
    select 
		concat(e.last_name, ' ', e.first_name, ' ', e.middle_name) as full_name,
		epd.date_of_birth as date_of_birth,
		e.phone as phone
	from 
		employee e 
		join employee_personal_data epd on epd.employee_id = e.id
	where 
		epd.married = false;
end; |

call getEmployeesPersonalData2();

-- Процедура - 3) Требуется узнать информацию о дате рождения всех сотрудников с должностью менеджер и номера телефонов этих сотрудников
create procedure getEmployeesPersonalData3()
begin
	select 
		concat(e.last_name, ' ', e.first_name, ' ', e.middle_name) as full_name,
		epd.date_of_birth as date_of_birth,
		e.phone as phone
	from 
		employee e 
		join post p on p.id = e.post_id
		join employee_personal_data epd on epd.employee_id = e.id
	where 
		p.title = 'Менеджер';
end; |

call getEmployeesPersonalData3();
