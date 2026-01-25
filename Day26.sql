-- TCL[Transaction Control Language]
-- Transaction -> 
use sakila;
use world;
create table actor2(actor_id int(20),actor_name char(20));

insert into actor2 values(1,'mohit'),(2,'raj'),(3,'rahul');
select * from actor2;

-- autocommit -> enable
set @@autocommit = 0; -- 1 for autocommit
select @@autocommit;
insert into actor2 values(4,'hitesh');
insert into actor2 values(5,'yash');
select * from actor2;
rollback;
commit;
-- In case if you run(start) any dml operation so your transaction will be started
-- when my transcation autometically cloase ?? [When i use commit,roll back]
-- In case if i start any ddl command then it is also close Transaction

start transaction;
insert into actor2 values(6,'lakshay');
insert into actor2 values(7,'derren');
select * from actor2;

-- for save data using ddl command
create table xyz(id int);

start transaction;
insert into actor2 values(10,'fall');
insert into actor2 values(11,'guy');
-- delete from actor2 where actor_id = 1;
rollback to db_actor2_chk1;
select * from actor2;
savepoint db_actor2_chk1;
insert into actor2 values(12,'boys');
rollback;

-- what is dbms vs rdbms?
-- what is mysql
-- what is normalization?
-- 

