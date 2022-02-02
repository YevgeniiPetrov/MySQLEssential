/* Задание 3
Задайте свои индексы на таблицах, созданных в предыдущем домашнем задании и обоснуйте их
необходимость.*/

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

-- Задайте свои индексы на таблицах, созданных в предыдущем домашнем задании и обоснуйте их необходимость.
/* В примерах таблиц выше, на мой взгляд, нет необходимости создания индексов, т. к. в каждой 
из этих таблиц есть первичный ключ, который и является индексом. Но для примера рассмотрим 
некоторые примеры создания других индексов: 
1. Создание индекса по имени (first_name) в таблице employee - это может пригодиться для быстрого поиска
сотрудников, у которых одинаковые имена: */

create index first_name on employee(first_name);

explain 
select 
	*
from 
	employee e 
where 
	e.first_name = 'Максим';

/*2. Создание индекса по зарплате (salary) в таблице post - это может пригодиться для быстрого поиска 
должностей, у которых одинаковая зарплата: */

create index salary on post(salary);

explain 
select 
	*
from 
	post p
where 
	p.salary = 10000;
