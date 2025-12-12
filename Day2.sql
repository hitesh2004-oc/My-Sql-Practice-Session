show databases;
show tables;
use tables;

show databases;
use regex_14;
create table employee(
id int primary key,
name varchar(100),
salary int
);


drop table employee;
show tables;
create table employee(
   id int ,
   name varchar(100));
insert into employee(id,name) values(1,"hitesh"),(2,"rahul"),(3,"mohit");
select * from employee where id>1 && name = "rahul";

use world;
show tables;
select * from city;
-- where cluase we will filter the data --
-- != or <> -- Not Equals to -
select * from city where countrycode != 'ARG';
select * from city where population > 600000 && countrycode = 'ARG';
select * from country;