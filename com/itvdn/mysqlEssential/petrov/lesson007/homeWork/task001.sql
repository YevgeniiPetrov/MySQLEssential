/* Задание
Используя базу данных carsshop создайте функцию для нахождения минимального возраста клиента,
затем сделайте выборку всех машин, которые он купил.*/

create database cars_shop;

use cars_shop;

create table marks (
   id int not null auto_increment primary key,
   mark varchar(20) unique
);

create table cars (
  id int not null auto_increment primary key,
  mark_id int not null,
  model varchar(20) not null,
  price int not null,
  foreign key(mark_id) references marks(id)
);

create table clients (
	 id int auto_increment not null,
     name varchar(30),
     age tinyint,
     phone varchar(15),
     primary key(id)
);

create table orders (
     id int not null primary key auto_increment,
     car_id int not null,
     client_id int not null,
     foreign key(car_id) references cars(id),
     foreign key(client_id) references clients(id)
);

insert into marks
	(mark)
values	
	('Audi'),
	('Porsche');

insert into cars
	(mark_id, model, price) 
values 
	(1, 'A5', 50000),
    (2, 'panamera', 100000),
    (2, 'caymen S', 88000);

insert into clients
	(name, age) 
values 
	('petro', 20), 
    ('vasya', 25), 
    ('vitaly', 75);

insert into orders
	(car_id, client_id) 
values
	(1, 1), (2, 2), (1, 3);
  
delimiter |  
create function MinClientAge()
returns tinyint
begin
	return (select min(age) from clients);
end; |

select
	cl.name as client,
	m.mark as mark,
    c.model as model,
    c.price as price
from 
	clients cl
    join orders o on o.client_id = cl.id
    join cars c on c.id = o.car_id
    join marks m on m.id = c.mark_id
where 
	cl.age = MinClientAge();
