-- Recursive CTE 
use sakila;
-- Union :- Combine result of two or more column in table
select first_name from actor
union
select actor_id from actor;

select actor_id,first_name from actor where actor_id between 1 and 4
union
select actor_id,first_name from actor where actor_id between 3 and 5;

select actor_id,first_name from actor where actor_id between 1 and 4
union all -- [also return duplicate value]
select actor_id,first_name from actor where actor_id between 3 and 5;

select actor_id,first_name from actor where actor_id between 1 and 4
union all 
select first_name,actor_id from actor where actor_id between 3 and 5;

-- Recursive CTE
with recursive cte as (
select 10 as num -- assignin values to this num colum (Starting Point)
union all 
select num+1 from cte -- CTE call Karna
where num<15 ) -- Terminating Condition (Stoping Point)

select * from cte;

-- Employee Hierarchy
CREATE TABLE employees (
    employeeid INT PRIMARY KEY,
    name VARCHAR(50),
    managerid INT
);


INSERT INTO employees (employeeid, name, managerid) VALUES
(1, 'Alice', NULL),      -- CEO
(2, 'Bob', 1),           -- Reports to Alice
(3, 'Charlie', 2),       -- Reports to Bob
(4, 'Diana', 2),         -- Reports to Bob
(5, 'Eve', 3);           -- Reports to Charlie

select * from employees;

with recursive cte as(
select employeeid,name, name as hierarchy_path from employees where managerid is null
union all
select e.employeeid,e.name,concat(e.name,'->',cte.hierarchy_path) from employees e join cte
where e.managerid = cte.employeeid and e.employeeid<5)
select * from cte;

with recursive cte as(
select employeeid,name, 1 as level from employees where managerid is null
union all
select e.employeeid,e.name,cte.level +1 from employees e join cte
where e.managerid = cte.employeeid and e.employeeid<6)
select * from cte;








