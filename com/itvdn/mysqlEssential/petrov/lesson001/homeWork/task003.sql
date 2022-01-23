/* ������� 3
� ��������� ���� ������ (�� ������� 2) ������� 3 �������:
1-� �������� ����� � ������ ��������� ����������� ����� ��������,
2-� �������� ��������� �� �� ��������, � ����������,
3-� �������� ���������� � �������� ���������, ���� �������� � ����� ����������.*/

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
	('������ ���� ��������', '+380000000000'),
	('������� Ը��� �������������', '+380111111111'),
	('������ ���� ����������', '+380222222222');
	
insert into employee_work_data
	(id, salary, position)
values 
	(1, 12000, '��������'),
	(2, 9000, '��������'),
	(3, 13000, '���������');
	
insert into employee_personal_data
	(id, married, date_of_birth, address)
values 
	(1, false, str_to_date('21.05.1993', '%d.%m.%YYYY'), '��. ������, 47, ��. 93'),
	(2, true, str_to_date('14.08.1978', '%d.%m.%YYYY'), '��. ��������, 5, ��. 10'),
	(3, true, str_to_date('27.11.1981', '%d.%m.%YYYY'), '��. ������, 89, ��. 47');
	