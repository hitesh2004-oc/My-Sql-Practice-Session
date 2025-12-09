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

