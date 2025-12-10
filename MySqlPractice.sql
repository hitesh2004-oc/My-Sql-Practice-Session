select database();
use world;
show tables;
-- To see the Structure of Table --
describe city;
-- to print data of table --
select * from city;

-- To Access Column --
select name, Population from city;

-- column can be print in any order --

select population, name, district, countrycode from city;
-- Query can be written in multiple line --
-- Not Case Sensitive --
select Population,
 name, 
 district,
 countrycode
 from city;
 
 SELECT name , population FROM city;
 -- alias(Nickname)---
  SELECT name , population+20+20 as 'NewPop' FROM city;

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
-- In operator use to filter the data in specific set of values --
select * from country where continent in ('North America','Europe','asia');
select name,continent from country where indepyear in(1981,1960);

select name,continent,indepyear from country where indepyear between 1901 and 1960;

select name,continent,indepyear from country where indepyear not between 1901 and 1960;

select * from country where Region != 'Middle East';

select name,indepyear,population, population + (population*0.1) from country;

select * from country where LifeExpectancy in (38.3,66.4);

select name,continent,population,gnp from country where population not between 5000 and 200000;

-- Like Operator --
select Name,continent from country where name like '%ad%';

--  _ (underscore) -> 1 character --
select * from country;




