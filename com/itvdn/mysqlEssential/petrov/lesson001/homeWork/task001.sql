/* Задание
Используя MySQL Workbench создать пустую базу данных автомобилей. 
Заполнить таблицу данными (id(Autoincrement), марка, модель, объем двигателя, цена, макс. скорость).*/

create database cars;

use cars;

create table cars 
	(
		id int auto_increment not null,
		mark varchar(32) not null,
		model varchar(32) not null,
		engine_capacity double not null,
		price double null,
		speed int not null,
		primary key (id)
	);
	
insert into cars 
	(mark, model, engine_capacity, price, speed)
values 
	('BMW', '320d', 2.4, 35000, 250),
	('Audi', 'A5', 3.0, 50000, 240),
	('Porsche', '911', 3.0, 100000, 285); 
	