CREATE TABLE client_master (
    client_no VARCHAR(6),
    name VARCHAR(20),
    address VARCHAR(30),
    city VARCHAR(15),
    pincode NUMERIC(8),
    state VARCHAR(15),
    bal_due NUMERIC(10,2)
);
TRUNCATE TABLE client_master;
CREATE TABLE product_master (
    product_no VARCHAR(6),
    description VARCHAR(15),
    profit_percent NUMERIC(4,2),
    unit_measure VARCHAR(10),
    qty_on_hand NUMERIC(8),
    reorder_level NUMERIC(8),
    sell_price NUMERIC(8,2),
    cost_price NUMERIC(8,2)
);

CREATE TABLE sales_order (
    order_no VARCHAR(6),
    order_date DATE,
    client_no VARCHAR(6),
    dely_addr VARCHAR(25),
    salesman_no VARCHAR(6),
    dely_type CHAR(1),
    billed_yn CHAR(1),
    dely_date DATE,
    order_status VARCHAR(10)
);

-- Inserting additional values into client_master
INSERT INTO client_master 
VALUES
    ('C003', 'Alice Johnson', '789 Oak Street', 'Chicago', 987654, 'IL', 2000.75),
    ('C004', 'Emily Brown', '222 Maple Street', 'Chicago', 567890, 'CA', 2500.00),
    ('C005', 'Michael Davis', '333 Walnut Street', 'Miami', 345678, 'FL', 1800.50),
    ('C006', 'Sarah Martinez', '444 Cedar Street', 'Seattle', 876543, 'WA', 3500.00),
	('C007', 'Bob Williams', '101 Pine Street', 'Chicago', 456789, 'TX', 3000.25);

select * from client_master;

-- Inserting additional values into product_master
INSERT INTO product_master
VALUES
    ('P003', 'Widget C', 0.12, 'Each', 200, 40, 20.99, 12.50),
    ('P004', 'Widget D', 0.18, 'Each', 120, 25, 25.50, 15.75),
    ('P005', 'Widget E', 0.20, 'Each', 300, 50, 30.99, 18.25),
    ('P006', 'Widget F', 0.15, 'Each', 150, 30, 15.99, 9.75),
    ('P007', 'Widget G', 0.10, 'Each', 180, 35, 18.50, 11.25);
select * from product_master;

INSERT INTO sales_order
VALUES 
    ('SO003', '2024-04-30', 'C003', '555 Pineapple Street', 'S003', 'S', 'Y', '2024-05-07', 'Shipped'),
    ('SO004', '2024-05-01', 'C004', '666 Orange Street', 'S002', 'R', 'N', NULL, 'Pending'),
    ('SO005', '2024-05-02', 'C005', '777 Strawberry Street', 'S001', 'S', 'Y', '2024-05-09', 'Processing'),
    ('SO006', '2024-05-03', 'C006', '888 Banana Street', 'S003', 'R', 'N', NULL, 'Pending'),
    ('SO007', '2024-05-04', 'C007', '999 Grape Street', 'S002', 'S', 'Y', '2024-05-11', 'Processing');
select * from sales_order;

select * from client_master where name like '_a%';
select * from client_master where city like '_a%';
select * from client_master where city='Chicago'order by name ;
select * from client_master where bal_due>2500;
select * from sales_order where extract(month from order_date)=5;
select * from client_master where client_no='C003'or client_no='C004';
select * from product_master where sell_price>20.99 and sell_price<=30.99;
select * from product_master where sell_price>25.99;
select
	product_no,
	description,
	sell_price*1.5 as new_price
from
	product_master
where
	sell_price>25.99;

select count(*) from sales_order;
select avg(cost_price) from product_master;
select min(cost_price) from product_master;
select max(cost_price) from product_master;
select count(*) from product_master where sell_price<20.99
select order_no, extract(day from order_date) from sales_order;
select to_char(order_date,'DD-Month-YY') from sales_order;
select to_char(dely_date,'Month-DD') from sales_order;
select current_date+interval '15days';
select client_no, extract(day from age(dely_date,order_date)) from sales_order;