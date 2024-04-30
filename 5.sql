create table company1(
	id int,
	name text not null,
	age int not null,
	address varchar(50),
	salary real
);
drop table company1;
select * from company1;
insert into company1
values
	('01',null,18,'Gokul', 100000),
	('02','Paku',null,'Gokul', 100000);

create table company3(
	id int not null,
	name text not null,
	age int unique,
	address varchar(50),
	salary real
);
insert into company3
values
	('01',null,18,'Gokul', 100000),
	('02','Paku',18,'Gokul', 100000);
	
create table company4(
	id int primary key,
	name text,
	age int,
	address varchar(50),
	salary real
);
insert into company4
values
	('01',null,18,'Gokul', 100000),
	('01','Paku',null,'Gokul', 100000);
	
create table employee(
	id int primary key,
	name text,
	age int,
	address varchar(50),
	salary real
);
select * from employee;	

create table department(
	id int primary key,
	name varchar(50) not null,
	emp_id int references employee(id)
);
select * from department;
insert into employee
values
	('01','sam',18,'Gokul', 100000),
	('02','Paku',18,'Gokul', 100000);
select * from employee;
insert into department
values
	(1,'Computer science',3),
	(2,'AIDS',4);

create table company5(
	id int,
	name text, 
	age int,
	address varchar(50),
	salary real check(salary>0)
);
insert into company5
values
	('01','sam',18,'Gokul', -100000);
truncate company5;
	

