/* Задание 2
Спроектируйте базу данных для оптового склада, у которого есть поставщики товаров, персонал, постоянные заказчики. 
Поля таблиц продумать самостоятельно.*/

create database warehouse;

use warehouse;

create table providers
(
	id int auto_increment not null,
	title varchar(32) not null,
	email varchar(32) unique not null,
	phone varchar(16) unique not null,
	primary key(id)
);

create table staff
(
	id int auto_increment not null,
	first_name varchar(32) not null,
	middle_name varchar(32),
	last_name varchar(32) not null,
	email varchar(32) unique not null,
	phone varchar(16) unique not null,
	primary key(id)
);

create table clients
(
	id int auto_increment not null,
	first_name varchar(32) not null,
	middle_name varchar(32),
	last_name varchar(32) not null,
	email varchar(32) unique not null,
	phone varchar(16) unique not null,
	primary key(id)
);

create table goods
(
	id int auto_increment not null,
	provider_id int,
	title varchar(64) not null,
	primary key(id),
	foreign key (provider_id) references providers(id)
);

create table orders
(
	id int auto_increment not null,
	number int not null,
	client_id int,
	good_id int,
	manager_id int,
	primary key(id),
	foreign key (client_id) references clients(id),
	foreign key (good_id) references goods(id),
	foreign key (manager_id) references staff(id)
);

insert into providers
	(title, email, phone)
values	
	('Sony', 'sales_department@sony.com', '+380931111111'),
	('Xiaomi', 'sales_department@xiaomi.com', '+380672222222'),
	('Apple', 'sales_department@apple.com', '+380503333333');

insert into staff
	(first_name, middle_name, last_name, email, phone)
values	
	('Анна', 'Вадимовна', 'Иванова', 'ivanova@company.com', '+380931111111'),
	('Юлия', 'Андреевна', 'Сидорова', 'sidorova@company.com', '+380672222222'),
	('Надежда', 'Игоревна', 'Петрова', 'petrova@company.com', '+380503333333');

insert into clients
	(first_name, middle_name, last_name, email, phone)
values 
	('Максим', 'Олегович', 'Петров', 'petrov@gmail.com', '+380634444444'),
	('Андрей', 'Алексеевич', 'Иванов', 'ivanov@gmail.com', '+380965555555'),
	('Олег', 'Александрович', 'Сидоров', 'sidorov@ukr.net', '+380507777777'),
	('Игорь', 'Александрович', 'Кузнецов', 'kuznetsov@ukr.net', '+380509999999'),
	('Виктор', 'Иванович', 'Скворцов', 'skvortsov@ukr.net', '+380938888888');

insert into goods
	(provider_id, title)
values 
	(1, 'Мобильный телефон Sony Xperia 5'),
	(2, 'Мобильный телефон Xiaomi 11T'),
	(2, 'Мобильный телефон Xiaomi 11 Lite 5G NE'),
	(3, 'Мобильный телефон Apple iPhone 11'),
	(3, 'Мобильный телефон Apple iPhone 10');
	
insert into orders
	(number, client_id, good_id, manager_id)
values
	(1, 1, 2, 3),
	(2, 3, 1, 3),
	(3, 2, 2, 1),
	(4, 1, 3, 2),
	(5, 2, 1, 1);
