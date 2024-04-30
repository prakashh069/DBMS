create table client_master(
	client_no varchar(6),
	name varchar(20),
	address varchar(30),
	city varchar(15),
	pincode numeric(8),
	state varchar(15),
	bal_due numeric (10,2)
);
select * from client_master

create table product_master(
	product_no varchar(6),
	description varchar(15),
	profit_percent numeric(4,2), 
	unit_measure  varchar(10),
	qty_on_hand numeric(8),
	reorder_level numeric(8),
	sell_price numeric(8,2),
	cost_price numeric(8,2)
);
select * from product_master

insert into client_master
values
	('C1001','John A','123 Main','Pune',1234567,'State1',1000.50),
	('C1002','John B','124 Main','une',1234568,'State2',1300.50),
	('C1003','John C','125 Main','Pne',1234569,'State3',1030.50),
	('C1004','John D','126 Main','Pun',1234557,'State4',1020.50),
	('C1005','John DE','127 Main','Mum',1234367,'State5',10200.50);
	
insert into product_master
values
	('P001','Widget','0.32', 100,10,5.99,3.50),
	('P002','Gadget','0.32', 100,10,5.99,3.50),
	('P003','Thinga','0.32', 100,10,5.99,3.50),
	('P004','Doohickey','0.32', 100,10,5.99,3.50),
	('P005','What','0.32', 100,100,5.99,3.50);

select name from client_master;
select * from client_master;
select name,city from client_master;
select description from product_master;
select name from client_master where city='Mum';
update client_master set city='mumbai' where client_no='C1001';
update client_master set bal_due=1000 where  client_no='C1005';
update product_master set cost_price=3000 where description ='Widget';
delete from product_master where qty_on_hand<100;
delete from client_master where state='Pune';