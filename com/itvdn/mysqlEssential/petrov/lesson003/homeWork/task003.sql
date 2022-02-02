/* Задание 3
В данной базе данных ("MyJoinsDB") создайте 3 таблицы,
В 1-й таблице содержатся имена и номера телефонов сотрудников компании.
Во 2-й таблице содержатся ведомости о зарплате и должностях сотрудников: главный директор, менеджер, рабочий.
В 3-й таблице содержится информация о семейном положении, дате рождения, и месте проживания.*/

use my_joins_db;

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