use world;
select * from country;
select continent,count(name),sum(population) from country group by continent having sum(population)>200000;
select continent , region from country group by continent,region;
use sakila;
select * from payment;
select customer_id, count(*)from payment group by customer_id;
-- you need to find out the number of transaction for each customer where the amoutn of the transaction should be greater then 3
select customer_id, count(*)from payment where amount >3 group by customer_id;

-- you need to find the total number of transaction in month of may
select payment_date,month(payment_date) from payment where month(payment_date) = 5 group by payment_date ;
--  now(),extract( year from now());

select amount,count(*) from payment where month(payment_date) = 5 group by amount;

-- you need to find out the max amount spend and min spend and total amount spend for each staff
select staff_id,max(amount),min(amount),sum(amount) from payment group by staff_id;

-- you need to find out the max amount spend and min spend and total amount spend for each staff only for customer 1 3 7 11
select staff_id,max(amount),min(amount),sum(amount) from payment where customer_id in(1,3,7,11) group by staff_id;

-- find the total amount spend and number of customer done the payment in each month where amount spend should be greater than 1$
select month(payment_date),sum(amount),count(customer_id) from payment where amount > 1 group by month(payment_date);

select year(payment_date),month(payment_date),count(customer_id) from payment group by year(payment_date),month(payment_date);

-- What are the Data Models
-- What is Cardinality
-- what are the type of realationship in dbms



