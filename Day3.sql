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
use world;
select * from country;

select Name, Continent, region from country where continent != "europe";

select Name, Continent, region from country where region like '_a%';

select Name, Continent, region from country where continent like '%i__';

select Name, Continent, region from country where continent like '%_____%';

select Name, Continent, region from country where continent like '_c%i_';

select Name, Continent, region from country where name like "%a_a%";S