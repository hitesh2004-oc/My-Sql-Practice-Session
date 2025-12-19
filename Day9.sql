use sakila;
select * from payment;
-- what are key in sql
-- what is primary key , super key & Candidate key
-- Primary key and Foreign key,
-- Relationship in dbms

-- Sub Query --
-- Query within a Query
-- When One Query Depended on Another Query.
select * from payment;

select amount from payment where payment_id = 24;
select * from payment where amount > (select amount from payment where payment_id = 24);

select payment_date,month(payment_date) from payment where payment_id = 15;
select * from payment where month(payment_date)>(select month(payment_date) from payment where payment_id = 15);

