/* Задание 4
Создайте представления для таких заданий:
1.Необходимо узнать контактные данные сотрудников (номера телефонов, место жительства).
2.Необходимо узнать информацию о дате рождения всех не женатых сотрудников и номерателефонов этих сотрудников.
3.Необходимо узнать информацию о дате рождения всех сотрудников с должностью менеджери номера телефонов этих сотрудников.*/

-- База данных из предыдущего домашнего задания
create database my_subqueries_db;

use my_subqueries_db;

create table employee
(
	id int auto_increment not null,
	first_name varchar(32) not null,
	middle_name varchar(32),
	last_name varchar(32) not null,
	phone varchar(16) unique not null,
	primary key(id)
);

create table post 
(
	id int auto_increment not null,
	title varchar(32) unique not null,
	salary int not null,
	primary key(id)
);

alter table employee
add post_id int not null;

alter table employee
add constraint fk_employee_post 
	foreign key(post_id) references post(id);

create table employee_personal_data
(
	employee_id int,
	married boolean,
	date_of_birth date not null,
	address varchar(128),
	primary key(employee_id),
	foreign key(employee_id) references employee(id)
);

insert into post
	(title, salary)
values
	('Главный директор', 20000),
	('Менеджер', 15000),
	('Рабочий', 10000);

insert into employee
	(first_name, middle_name, last_name, phone, post_id)
values	
	('Анна', 'Вадимовна', 'Иванова', '+380931111111', 2),
	('Максим', 'Олегович', 'Петров', '+380634444444', 1),
	('Юлия', 'Андреевна', 'Сидорова', '+380672222222', 3),
	('Виктор', 'Иванович', 'Скворцов', '+380503333333', 2);

insert into employee_personal_data
	(employee_id, married, date_of_birth, address)
values 
	(1, false, str_to_date('21.05.1993', '%d.%m.%YYYY'), 'ул. Победы, 47, кв. 93'),
	(2, true, str_to_date('14.08.1978', '%d.%m.%YYYY'), 'ул. Шевченко, 5, кв. 10'),
	(3, null, str_to_date('27.11.1981', '%d.%m.%YYYY'), 'ул. Франко, 89, кв. 47'),
	(4, true, str_to_date('10.06.1990', '%d.%m.%YYYY'), 'ул. Шевченко, 197, кв. 89');

-- Представление - 1.Необходимо узнать контактные данные сотрудников (номера телефонов, место жительства).
create view employee_personal_data_1
as
select 
	concat(e.last_name, ' ', e.first_name, ' ', e.middle_name) as full_name,
	e.phone as phone,
	epd.address as address
from 
	employee e
	join employee_personal_data epd on epd.employee_id = e.id;

select
	*
from 
	employee_personal_data_1;

-- Представление - 2.Необходимо узнать информацию о дате рождения всех не женатых сотрудников и номерателефонов этих сотрудников.

create view employee_personal_data_2
as 
select 
	concat(e.last_name, ' ', e.first_name, ' ', e.middle_name) as full_name,
	epd.date_of_birth as date_of_birth,
	e.phone as phone
from 
	employee e 
	join employee_personal_data epd on epd.employee_id = e.id
where 
	epd.married = false;

select
	*
from 
	employee_personal_data_2;

-- Представление - 3.Необходимо узнать информацию о дате рождения всех сотрудников с должностью менеджер и номера телефонов этих сотрудников.
create view employee_personal_data_3
as 
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

select
	*
from 
	employee_personal_data_3;
