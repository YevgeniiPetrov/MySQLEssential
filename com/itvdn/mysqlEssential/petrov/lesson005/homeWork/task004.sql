/* Задание 4
Сделайте выборку при помощи вложенных запросов для таких заданий:
1) Получите контактные данные сотрудников (номера телефонов, место жительства).
2) Получите информацию о дате рождения всех холостых сотрудников и их номера.
3) Получите информацию обо всех менеджерах компании: дату рождения и номер телефона.*/

-- 1) Получите контактные данные сотрудников (номера телефонов, место жительства).
select 
	concat(e.last_name, ' ', e.first_name, ' ', e.middle_name) as "ФИО",
	e.phone as "Номер телефона",
	(
		select
			epd.address
		from 
			employee_personal_data epd 
		where 
			epd.employee_id = e.id
	) as "Место жительства"
from 
	employee e;
    
-- 2) Получите информацию о дате рождения всех холостых сотрудников и их номера.
select 
	concat(e.last_name, ' ', e.first_name, ' ', e.middle_name) as "ФИО",
    (
		select
			epd.date_of_birth
		from 
			employee_personal_data epd 
		where 
			epd.employee_id = e.id
	) as "Дата рождения",
	e.phone as "Номер телефона"
from 
	employee e
where 
	e.id in (
		select
			epd.employee_id
		from 
			employee_personal_data epd
		where 
			epd.married = false
	);
        
-- 3) Получите информацию обо всех менеджерах компании: дату рождения и номер телефона.
select 
	concat(e.last_name, ' ', e.first_name, ' ', e.middle_name) as "ФИО",
	(
		select
			epd.date_of_birth
		from 
			employee_personal_data epd 
		where 
			epd.employee_id = e.id
	) as "Дата рождения",
	e.phone as "Номер телефона"
from 
	employee e
where 
	e.post_id in (
		select
			p.id
		from 
			post p
		where 
			p.title = 'Менеджер'
	);
