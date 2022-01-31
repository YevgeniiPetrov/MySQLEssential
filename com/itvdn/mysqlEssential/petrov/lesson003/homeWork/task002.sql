/* Задание 2
Нормализируйте данную таблицу: */

create database military;

use military;

create table post
(
	id int auto_increment not null,
	title varchar(32) not null,
	primary key(id)
);

create table location_type
(
	id int auto_increment not null,
	title varchar(32) not null,
	primary key(id)
);

create table location
(
	id int auto_increment not null,
	number int not null,
	location_type_id int not null,
	primary key(id),
	foreign key (location_type_id) references location_type(id)
);

create table organization_unit_type
(
	id int auto_increment not null,
	title varchar(32) not null,
	primary key(id)
);

create table organization_unit
(
	id int auto_increment not null,
	number int not null,
	organization_unit_type_id int not null,
	primary key(id),
	foreign key (organization_unit_type_id) references organization_unit_type(id)
);

create table military
(
	id int auto_increment not null,
	first_name varchar(32) not null,
	middle_name varchar(32),
	last_name varchar(32) not null,
	post_id int,
	primary key(id),
	foreign key (post_id) references post(id)
);

create table military_location
(
	military_id int not null,
	location_id int not null,
	primary key(military_id, location_id),
	foreign key (military_id) references military(id),
	foreign key (location_id) references location(id)
);

create table military_organization_unit
(
	military_id int not null,
	organization_unit_id int not null,
	primary key(military_id, organization_unit_id),
	foreign key (military_id) references military(id),
	foreign key (organization_unit_id) references organization_unit(id)
);

create table weapon_type
(
	id int auto_increment not null,
	title varchar(32) not null,
	primary key(id)
);

create table weapon
(
	id int auto_increment not null,
	number int not null,
	weapon_type_id int not null,
	primary key(id),
	foreign key (weapon_type_id) references weapon_type(id)
);

create table weapon_from_to
(
	id int auto_increment not null,
	weapon_id int not null,
	military_id_from int not null,
	military_id_to int not null,
	primary key(id),
	foreign key (weapon_id) references weapon(id),
	foreign key (military_id_from) references military(id),
	foreign key (military_id_to) references military(id)
);

insert into post
	(title)
values
	('Майор'),
	('Подполковник');

insert into location_type
	(title)
values
	('Офис');

insert into location
	(number, location_type_id)
values
	(201, 1),
	(205, 1),
	(221, 1);

insert into organization_unit_type
	(title)
values
	('Взвод');

insert into organization_unit
	(number, organization_unit_type_id)
values
	(200, 1),
	(212, 1),
	(222, 1),
	(232, 1);

insert into military
	(last_name, first_name, middle_name, post_id)
values
	('Петров', 'Владимир', 'Андреевич', null),
	('Лодарев', 'Петр', 'Сергеевич', null),
	('Леонтьев', 'Кирилл', 'Васильевич', null),
	('Духов', 'Роман', 'Максимович', null),
	('Буров', 'Олег', 'Сереевич', 1),
	('Рыбаков', 'Николай', 'Генадиевич', 1),
	('Деребанов', 'Вячеслав', 'Ярославович', 2);

insert into military_location
	(military_id, location_id)
values
	(1, 2),
	(2, 3),
	(3, 1);

insert into military_organization_unit
	(military_id, organization_unit_id)
values
	(1, 3),
	(2, 4),
	(3, 2),
	(4, 1);

insert into weapon_type
	(title)
values 
	("АК-47"),
	("Глок20");

insert into weapon
	(number, weapon_type_id)
values
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 2),
	(6, 2),
	(7, 2);

insert into weapon_from_to
	(weapon_id, military_id_from, military_id_to)
values 
	(1, 5, 1),
	(5, 6, 1),
	(2, 7, 2),
	(6, 6, 2),
	(3, 5, 3),
	(7, 6, 3),
	(4, 5, 4);

-- Вывод таблицы результатов
select 
	concat(
		mt.last_name, ' ', 
		mt.first_name, ' ', 
		mt.middle_name,
		case
			when lt.title is not null then concat(', ', lt.title, ' ', l.number)
			else ''
		end) as "ФИО",
	ou.number as "Взвод",
	wt.title as "Оружие",
	concat(
		mf.last_name, ' ', 
		mf.first_name, ' ', 
		mf.middle_name, ', ',
		p.title) as "Оружие выдал"
from 
	weapon_from_to wft
	join weapon w on w.id = wft.weapon_id
	join weapon_type wt on wt.id = w.weapon_type_id
	join military mt on mt.id = wft.military_id_to
	left join military_location ml on ml.military_id = mt.id
	left join location l on l.id = ml.location_id
	left join location_type lt on lt.id = l.location_type_id
	join military_organization_unit mou on mou.military_id = mt.id
	join organization_unit ou on ou.id = mou.organization_unit_id
	join military mf on mf.id = wft.military_id_from
	join post p on p.id = mf.post_id
order by 
	1 desc,
	3;
	