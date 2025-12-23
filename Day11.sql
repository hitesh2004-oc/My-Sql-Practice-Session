use regex;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2)
);



INSERT INTO customers (customer_id, customer_name, city) VALUES
(1, 'Alice', 'New York'),
(2, 'Bob', 'Los Angeles'),
(3, 'Charlie', 'Chicago'),
(4, 'David', 'Houston'),
(5, 'Eva', 'Phoenix'),
(6, 'Frank', 'Philadelphia'),
(7, 'Grace', 'San Antonio'),
(8, 'Henry', 'San Diego'),
(9, 'Ivy', 'Dallas'),
(10, 'Jack', 'San Jose');


INSERT INTO orders (order_id, customer_id, order_date, amount) VALUES
(101, 1, '2024-01-05', 250.00),
(102, 2, '2024-01-06', 150.00),
(103, 3, '2024-01-07', 300.00),
(104, 1, '2024-01-10', 120.00),
(105, 5, '2024-01-12', 450.00),
(106, 6, '2024-01-15', 200.00),
(107, 2, '2024-01-18', 175.00),
(108, 8, '2024-01-20', 500.00),
(109, 11, '2024-01-22', 90.00),
(110, 12, '2024-01-25', 60.00);

select * from customers;
select * from orders;

-- Inner Join(join)  or where(on,using) also you can use --
select cus.customer_id,cus.customer_name from orders as od join  customers as cus where od.customer_id = cus.customer_id;
select cus.customer_id,cus.customer_name from orders as od join  customers as cus on od.customer_id = cus.customer_id;
select cus.customer_id,cus.customer_name from orders as od join  customers as cus using (customer_id);

-- Using left Join for Access All data column of left Table --
-- A LEFT JOIN (or LEFT OUTER JOIN) in SQL is a type of join operation that returns all records from the left table 
-- (the first table named in the query) and the matching records from the right table (the second table named). 
select cus.customer_id,cus.customer_name from customers as cus left join orders as od on od.customer_id = cus.customer_id;

-- A RIGHT JOIN (or RIGHT OUTER JOIN) in SQL is a type of join that returns all rows from the right table (the table specified after the RIGHT JOIN keyword),
-- along with the matching rows from the left table (the table specified before the keyword). 
select cus.customer_id,cus.customer_name,od.amount from customers as cus right join orders as od on od.customer_id = cus.customer_id;

-- Natural Join - if You went to join Two Tables .(none common column found [Cross join ,cortesion join])
select cus.cid,cus.customer_name,od.customer_id,od.amount from 
customers as cus natural join orders as od;

alter table customers rename column cid to customer_id;
select customer_name,sum(amount) from 
customers as cus join orders as od on cus.customer_id = od.customer_id group by customer_name;











