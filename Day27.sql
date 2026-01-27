-- CTE [Common Table Expression]
-- it is a Temporary in SQL,Name result set that can be referenced within a single SQL statements
-- Limitation of CTE is closing semicolon

with xyz as 
(select * from sakila.actor)
select * from xyz;

-- They are not Store Permanetly in thr database
-- They help to break down complex queries into smaller logical parts
select * from sakila.payment;
with abc as
(select month(payment_date) as payments from sakila.payment)
select payments,count(*) from abc group by payments;
use sakila;

with cte as
(select *,dense_rank() over(order by amount desc) as ranking from payment)
select * from cte where ranking = 2;

with cte as
(select *,dense_rank() over(partition by customer_id order by amount desc) as ranking from payment)
select * from cte where ranking = 2;

create database test90;
use test90;

CREATE TABLE employee (
    emp_id     INT PRIMARY KEY,
    emp_name   VARCHAR(50),
    department VARCHAR(30),
    salary     INT,
    manager_id INT
);

INSERT INTO employee (emp_id, emp_name, department, salary, manager_id) VALUES
(1, 'Alice',   'HR',      50000, NULL),
(2, 'Bob',     'HR',      45000, 1),
(3, 'Charlie', 'HR',      55000, 1),

(4, 'David',   'IT',      70000, NULL),
(5, 'Eva',     'IT',      65000, 4),
(6, 'Frank',   'IT',      72000, 4),
(7, 'Grace',   'IT',      68000, 4),

(8, 'Henry',   'Sales',   60000, NULL),
(9, 'Irene',   'Sales',   58000, 8),
(10,'Jack',    'Sales',   62000, 8);


select * from employee;

select department, avg(salary) from employee group by department;
-- correlated
select emp_id, emp_name,department,salary from employee as e
where salary>( select avg(salary) from employee where department=e.department);

-- cte
with cte as (
select department as dept, avg(salary) as deptsalary from employee group by department)

select  emp_id, emp_name,department,salary, dept, deptsalary
from employee as e join cte where e.department=cte.dept
and salary>deptsalary;
