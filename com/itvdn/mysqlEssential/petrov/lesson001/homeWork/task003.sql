/* Задание 3
В созданной базе данных (из задания 2) создать 3 таблицы:
1-я содержит имена и номера телефонов сотрудников некой компании,
2-я содержит ведомости об их зарплате, и должностях,
3-я содержит информацию о семейном положении, дате рождения и месте проживания.*/

use mydb;

create table employee 
(
	id int auto_increment not null,
	name varchar(128) not null,
	phone varchar(16),
	primary key (id)
);

create table employee_work_data
(
	id int,
	salary int not null,
	position varchar(32) not null,
	primary key (id),
	foreign key (id) references employee(id)
);

create table employee_personal_data
(
	id int,
	married boolean not null,
	date_of_birth date not null,
	address varchar(128),
	primary key (id),
	foreign key (id) references employee(id)
);

insert into employee 
	(name, phone)
values 
	('Иванов Иван Иванович', '+380000000000'),
	('Сидоров Фёдор Александрович', '+380111111111'),
	('Петров Петр Алексеевич', '+380222222222');
	
insert into employee_work_data
	(id, salary, position)
values 
	(1, 12000, 'Електрик'),
	(2, 9000, 'Водитель'),
	(3, 13000, 'Сантехник');
	
insert into employee_personal_data
	(id, married, date_of_birth, address)
values 
	(1, false, str_to_date('21.05.1993', '%d.%m.%YYYY'), 'ул. Победы, 47, кв. 93'),
	(2, true, str_to_date('14.08.1978', '%d.%m.%YYYY'), 'ул. Шевченко, 5, кв. 10'),
	(3, true, str_to_date('27.11.1981', '%d.%m.%YYYY'), 'ул. Франко, 89, кв. 47');
	