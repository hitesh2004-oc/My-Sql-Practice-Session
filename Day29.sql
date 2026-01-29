-- === views === -- 
-- view is a viratual table which will give you the data based on the select query 
-- views does not store the data physically but stored in the existing table 
-- makes complex query easy
-- helps in security 
-- view types ---> simple and complex 


-- simple view 

use regex_14;
create table newactor as 
select actor_id , first_name from sakila.actor where actor_id between 1 and 5;


create view actor_v as 
select * from newactor;
select * from actor_v;

insert into actor_v (actor_id , first_name) values (7, 'hitesh');
select * from actor_v;

insert into newactor (actor_id , first_name) values (7, 'hitesh');
select * from newactor;

select * from actor_v;

create view actor_v2 as 
select * from newactor where actor_id between 1 and 2;
select * from actor_v2;

insert into actor_v2 values(3 , 'hitesh');
select * from actor_v2;

-- complex view 
-- you cannot perform DML operations when there is 
-- aggregate function , windows function 
-- distinct , group by 
-- having , subquery etc on the view query 

create table newpayment as 
select payment_id , amount from sakila.payment where payment_id between 1 and 7;

select * from newpayment;

create view payment_v as select count(*) from newpayment;

select * from payment_v;
insert into payment_v values(10);