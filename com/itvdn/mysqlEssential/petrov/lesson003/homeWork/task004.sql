/* Задание 4
Сделайте выборку при помощи JOIN’s для таких заданий:
1)Получите контактные данные сотрудников (номера телефонов, место жительства).
2)Получите информацию о дате рождения всех холостых сотрудников и их номера.
3)Получите информацию обо всех менеджерах компании: дату рождения и номер телефона.*/

use my_joins_db;

-- 1)Получите контактные данные сотрудников (номера телефонов, место жительства).
select 
	concat(e.last_name, ' ', e.first_name, ' ', e.middle_name) as "ФИО",
    e.phone as "Номер телефона",
    epd.address as "Место жительства"
from 
	employee e
    join employee_personal_data epd on epd.employee_id = e.id;
    
-- 2)Получите информацию о дате рождения всех холостых сотрудников и их номера.
select 
	concat(e.last_name, ' ', e.first_name, ' ', e.middle_name) as "ФИО",
    epd.date_of_birth as "Дата рождения",
    e.phone as "Номер телефона"
from 
	employee e 
    join employee_personal_data epd on epd.employee_id = e.id
where 
	epd.married = false;
    
-- 3)Получите информацию обо всех менеджерах компании: дату рождения и номер телефона.
select 
	concat(e.last_name, ' ', e.first_name, ' ', e.middle_name) as "ФИО",
    epd.date_of_birth as "Дата рождения",
    e.phone as "Номер телефона"
from 
	employee e 
    join post p on p.id = e.post_id
    join employee_personal_data epd on epd.employee_id = e.id
where 
	p.title = 'Менеджер';