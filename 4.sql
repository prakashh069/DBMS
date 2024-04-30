create table employee(
	empno numeric(4),
	ename varchar(10),
	designation varchar(10),
	salary numeric(8,2)
);
select * from employee;
alter table employee alter column empno set data type numeric(6);
alter table employee alter column empno set data type numeric(7), alter column ename set data type varchar(26);
alter table employee add column qualification varchar(26);
alter table employee add column dob date, add column doj date;
alter table employee drop column doj;
alter table employee drop column dob, drop column qualification;
truncate table employee;
drop table employee;