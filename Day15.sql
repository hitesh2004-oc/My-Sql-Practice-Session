use sakila;
-- SubQuery
-- Single row SubQuery(Only 1 row return)
select * from payment;
select * from payment where amount = (select amount from payment where payment_id = 3);
select * from payment where staff_id = (select staff_id from payment where payment_id = 7);

-- get payid aamoun and date where month of pay should be same as of pay id 20;
select payment_id,amount,payment_date from payment where month(payment_date) = (select month(payment_date) from payment where payment_id= 20);

-- get the amount and total num of payment done for each where amount shoub les than amount of rental id = 1725
select amount,count(payment_id) from payment where amount < 
(select amount from payment where rental_id = 1725) group by amount; 

-- get the month and the total amount spand from the payment table 
-- where month is greater than the month of customer id = 1 with payment id = 3

select month(payment_date) from payment where month(payment_date) > 
(select month(payment_date) from payment where customer_id = 1 and payment_id = 3) 
group by month(payment_date);

-- In multi row SubQuery(We can't use >,<,=,!= operators)
-- use operator in ,any all
select amount from payment where payment_id = 2 or payment_id = 3; 

select * from payment where amount in
 (select amount from payment where payment_id = 2 or payment_id = 3);
