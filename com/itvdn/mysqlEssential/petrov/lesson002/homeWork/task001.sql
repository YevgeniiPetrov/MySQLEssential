/* Задание
Спроектируйте базу данных для системы отдела кадров.*/

create database human_resources;

use human_resources;

create table recruiters
(
	id int auto_increment not null,
	first_name varchar(32) not null,
	middle_name varchar(32),
	last_name varchar(32) not null,
	email varchar(32) unique not null,
	phone varchar(16) unique not null,
	primary key(id)
);

create table candidates
(
	id int auto_increment not null,
	recruiter_id int,
	first_name varchar(32) not null,
	middle_name varchar(32),
	last_name varchar(32) not null,
	email varchar(32) unique not null,
	phone varchar(16) unique not null,
	primary key(id),
	foreign key (recruiter_id) references recruiters(id)
);

insert into recruiters
	(first_name, middle_name, last_name, email, phone)
values	
	('Анна', 'Вадимовна', 'Иванова', 'ivanova@company.com', '+380931111111'),
	('Юлия', 'Андреевна', 'Сидорова', 'sidorova@company.com', '+380672222222'),
	('Надежда', 'Игоревна', 'Петрова', 'petrova@company.com', '+380503333333');

insert into candidates
	(recruiter_id, first_name, middle_name, last_name, email, phone)
values 
	(1, 'Максим', 'Олегович', 'Петров', 'petrov@gmail.com', '+380634444444'),
	(2, 'Андрей', 'Алексеевич', 'Иванов', 'ivanov@gmail.com', '+380965555555'),
	(1, 'Олег', 'Александрович', 'Сидоров', 'sidorov@ukr.net', '+380507777777'),
	(1, 'Игорь', 'Александрович', 'Кузнецов', 'kuznetsov@ukr.net', '+380509999999'),
	(3, 'Виктор', 'Иванович', 'Скворцов', 'skvortsov@ukr.net', '+380938888888');
