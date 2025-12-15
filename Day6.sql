use world;
select * from country;

-- Function --
-- aggregate function( to perform the calculation on set of rows)(multi line function)
-- count --
-- only count does not count Null value in table --
select count(indepyear) from country;

-- count(*) also count Null value in table --
select count(*) , count(indepyear) from country;
-- DISTINCT use for print Unique Value in Row --
 select distinct (continent) from country;
 
 -- Using this Combination for Unique values --
 select distinct continent, region from country;
 
 -- Sum use for Calculation total Value of Particular column -- 
-- select population, avg(population),sum(population) from country;
 use world;
 select * from country;
 select count(governmentform), count(distinct governmentform) from country where continent = 'Asia';
 
 select sum(population), count(name), count(distinct indepyear) from country where continent = 'africa';
 
select * from country;
-- get the total country the avg surface area the total pop for the country which have got their indep 1947 to 1998 this should not include --
select count(name),avg(surfacearea), sum(Population) from country where indepyear > 1947 and indepyear < 1998;

-- get the total num of country and number of unique continents along with avg pop and total number of capitals for the country start with a or start d
 select count(name),count(distinct continent),avg(population),sum(capital) from country where name like 'a%' or 'd%';
 
 -- Group By use for grouping the unique name from rows --
 -- using same colunm name as a group by use --
 select continent, count(*) from country group by continent;
 select indepyear,count(*) from country group by indepyear ;
 select governmentform,count(*) from country group by governmentform;
 
 -- use of max --
 select continent, count(name), sum(population), avg(population),max(population),min(population) from country group by continent;
 
-- from the city table you have find the total city , the total district , the unique district, total pop from city table --
select * from city;
select countrycode,count(*),count(district),count(distinct district),sum(population) from city group by countrycode;

 
 

 
