-- Structure[Data Defination Language]
-- Create, alter ,drop, truncate
use regex;
Create table test1(sno int);
desc test1;
-- DML [ data Manipulation Language]
-- Insert, Update, Delete, Merge
insert into test1 values(10);
insert into test1(sno) values(20);
insert into test1(sno) values(null), (30);

select * from test1;
select count(sno),count(*) from test1;

-- Constraint [define the Rule on table]
-- Not Null
create table test2(sno int not null,salary int);
insert into test2 (sno,salary) values(21,1000);
insert into test2 (sno,salary) values(null,1000); -- Error
insert into test2 (salary) values(1000); -- Error
insert into test2 (sno,salary) values(22,Null);

-- Default Constraint --
create table test3(sno int not null default 80,salary int);
insert into test3 (salary) values(1000);
select * from test3;

-- Unique Constraint
create table test4(sno int not null ,salary int unique default 100);
insert into test4 (sno,salary) values(1000,20000);
insert into test4 (sno) values(1000,20000); -- Error
insert into test4 (sno) values(1500);
insert into test4 (sno) values(1500); -- Error
select * from test4;

create table test5(sno int,salary int ,
check (sno between 1 and 100),
check (salary in (1000,2000)));

insert into test5 (sno,salary) values(1000,2000); -- Error
insert into test5 (sno,salary) values(100,2000);

create table test6(sno int,salary int ,
constraint test6_sno_check check (sno between 1 and 100),
constraint test6_salary_check check (salary in (1000,2000)));

insert into test6 (sno,salary) values(100,2000);
insert into test6 (sno,salary) values(150,2000); -- Error
insert into test6 (sno,salary) values(100,1500); -- Error

create table test7(sno int primary key,salary int);
insert into test7 (sno,salary) values(100,2000);
insert into test7 (sno,salary) values(100,1000); -- Error

-- Foreign Key[Create Relation Between Two Table]
-- Varchar(20)

drop table customer1;
create table customer1(cid int primary key,cname varchar(20));
insert into customer1 values(10,'aman'),(11,'abhishek');
select * from customer1;

drop table order1;
create table order1(order_no int, city varchar(20),cid int,
 foreign key (cid) references customer1(cid));
insert into order1 values(101,'Pali',10),(102,'Jaipur',11),(103,'Jodhpur',10);
insert into order1 values(104,'J&K',25); -- Error
select * from order1;











