use world;
select * from city;
-- primary is Unique to Define only unique value
describe city;
select count(id),count(distinct id),count(population),count(distinct population) from city;
-- City - id must be Primary key --
-- Country - code must be primary key --
select * from country;
select * from city;

-- make tables aslise --
select ct.countrycode,ct.name from city as ct;
select cnty.code,cnty.name from country as cnty;

-- Find out the city and their reaspective country name
select ct.countrycode,ct.name,cnty.code,cnty.name from city as ct join country as cnty where ct.countrycode = cnty.code;

select * from city;
-- you need to find the city name and the pop along with th goverform in that city with the pop from highest to lowest
select ct.name,ct.population,governmentform from city as ct join country as c order by ct.population ;

-- you need to get coun name , pop and all the language spoken for each country
select * from countrylanguage;
select * from country;

select language,name,population from countrylanguage as cl join country as c where cl.countrycode = c.code;
use sakila;
select * from actor;
select * from film_actor;

-- get the actor id and first name along with it film id
select fa.actor_id,first_name,film_id from actor as ac join film_actor as fa where fa.actor_id = ac.actor_id;

select * from film;
select * from actor;
select * from film_actor;
use sakila;
select first_name from actor as ac join film_actor as fa join film as f 

