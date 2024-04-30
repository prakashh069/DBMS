 create table sales_order_details(
	order_no varchar(6) primary key,
	product_no varchar(6),
	qty_ordered numeric(8),
	qty_disp numeric(8),
	oriduct_rate numeric(10,2)
);
select * from sales_order_details;
INSERT INTO sales_order_details 
VALUES 
    ('ORD001', 'PROD01', 10, 8, 25.00),
    ('ORD002', 'PROD02', 5, 5, 30.00),
    ('ORD003', 'PROD03', 20, 20, 15.50),
    ('ORD004', 'PROD04', 15, 15, 18.75),
    ('ORD005', 'PROD05', 8, 8, 22.80),
    ('ORD006', 'PROD06', 12, 10, 35.00);

drop table sales_order_details;
create table customer(
	cid varchar(10) primary key,
	cname varchar(50) ,
	address varchar(50),
	pno numeric(10)
);
select * from customer;

INSERT INTO customer
VALUES 
    ('C001', 'Alice', '123 Main St', 1234567890),
    ('C002', 'Bob', '456 Oak Ave', 2345678901),
    ('C003', 'Charlie', '789 Elm St', 3456789012),
    ('C004', 'David', '456 Pine Rd', 4567890123),
    ('C005', 'Emma', '789 Maple Ave', 5678901234),
    ('C006', 'Frank', '123 Cedar Ln', 6789012345);

create table cust_order(
	cid varchar(10) ,
	order_no varchar(10),
	foreign key (cid) references customer(cid),
	foreign key (order_no) references sales_order_details(order_no)
);
select * from cust_order;
INSERT INTO cust_order
VALUES 
    ('C001', 'ORD001'),
    ('C002', 'ORD002'),
    ('C003', 'ORD003'),
    ('C004', 'ORD004'),
    ('C005', 'ORD005'),
    ('C006', 'ORD006');
	
select product_no,sum(qty_ordered) from sales_order_details group by order_no;
select product_no,sum(qty_ordered*oriduct_rate) from sales_order_details group by order_no;

SELECT c.cname, AVG(sod.qty_disp) AS avg_qty_sold
FROM sales_order_details sod
JOIN cust_order co ON sod.order_no = co.order_no
JOIN customer c ON co.cid = c.cid
GROUP BY c.cname
HAVING MAX(sod.qty_disp * sod.oriduct_rate) <= 15000;

SELECT SUM(sod.qty_ordered * sod.product_rate) AS total_billed_amount
FROM sales_order_details sod
JOIN cust_order co ON sod.order_no = co.order_no
WHERE EXTRACT(MONTH FROM co.order_date) = 1;


select sum(qty_ordered*oriduct_rate) from sales_order_details;
select c.cname from sales_order_details sod
join cust_order co on co.order_no = sod.order_no
join customer c on c.cid = co.cid
where qty_ordered>10;

select c.cname,sod.product_no 
from sales_order_details sod
join cust_order co on co.order_no = sod.order_no
join customer c on c.cid = co.cid
where sod.qty_ordered = (select max(qty_ordered) from sales_order_details);

