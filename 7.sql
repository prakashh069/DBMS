-- Create tables
CREATE TABLE product_master (
    product_no VARCHAR(6),
    description VARCHAR(100)
);

CREATE TABLE customer (
    client_no VARCHAR(6),
    name VARCHAR(50),
    address VARCHAR(100)
);

CREATE TABLE sales_order (
    order_no VARCHAR(6),
    client_no VARCHAR(6),
    order_date DATE
);

CREATE TABLE sales_order_details (
    order_no VARCHAR(6),
    product_no VARCHAR(6),
    qty_ordered NUMERIC(8)
);

-- Query 2: Find the product number and description of non-moving products
SELECT product_no, description
FROM product_master
WHERE product_no NOT IN (
    SELECT DISTINCT product_no
    FROM sales_order_details
);

-- Query 3: Find the customer name and address for the client who has placed order number 'O191'
SELECT name, address
FROM customer
WHERE client_no = (
    SELECT client_no
    FROM sales_order
    WHERE order_no = 'O191'
);

-- Query 4: Find the clients' names who have placed orders before the month of May '96
SELECT name
FROM customer
WHERE client_no IN (
    SELECT client_no
    FROM sales_order
    WHERE EXTRACT(YEAR FROM order_date) < 1996
    OR (EXTRACT(YEAR FROM order_date) = 1996 AND EXTRACT(MONTH FROM order_date) < 5)
);

-- Query 5: Find out if the product '1.44 Drive' has been ordered by any client and print the client number and name to whom it was sold
SELECT client_no, name
FROM customer
WHERE client_no IN (
    SELECT client_no
    FROM sales_order
    WHERE order_no IN (
        SELECT order_no
        FROM sales_order_details
        WHERE product_no = (
            SELECT product_no
            FROM product_master
            WHERE description = '1.44 Drive'
        )
    )
);

-- Query 6: Find the names of clients who have placed orders worth Rs. 10000 or more
SELECT name
FROM customer
WHERE client_no IN (
    SELECT client_no
    FROM sales_order
    GROUP BY client_no
    HAVING SUM(total_amount) >= 10000
);

-- Query 7: Retrieve all the orders placed by a client named 'Rahul Desai' from the sales_order table
SELECT *
FROM sales_order
WHERE client_no = (
    SELECT client_no
    FROM customer
    WHERE name = 'Rahul Desai'
);

-- Query 8: Find out all the products that are not being sold from the product_master table, based on the products actually sold as shown in the sales_order_details table
SELECT product_no, description
FROM product_master
WHERE product_no NOT IN (
    SELECT DISTINCT product_no
    FROM sales_order_details
);

-- Query 9: Retrieve the product numbers, their description, and the total quantity ordered for each product
SELECT p.product_no, p.description, SUM(s.qty_ordered) AS total_qty_ordered
FROM product_master p
LEFT JOIN sales_order_details s ON p.product_no = s.product_no
GROUP BY p.product_no, p.description;
