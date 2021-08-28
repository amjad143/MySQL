-- Inner Join
-- Used to return data from multiple tabels,the tabels must have atleast one identical columns,at least one
-- row in both tabels must match join conditions
-- /* select city,country from city inner join country on city.country_id = country.country_id;



select city,country
from city
inner join country on city.country_id = country.country_id;


select city country
from city a
inner join country b on a.country_id = b.country_id;

select country,count(city)
from country a
inner join city b on
a.country_id = b.country_id
group by country;

-- LEFT JOIN
-- all rows from the left table are returned,could also return NULL if no matching in right table

select
c.customer_id,
c.first_name,
c.last_name,
a.actor_id,
a.first_name,
a.last_name
from customer c
left join actor a
on c.last_name = a.last_name
order by c.last_name;

-- RIGHT JOIN
-- Used to return data from multiple tables from right table,could also return NULL if no matching row left in table

select
c.customer_id,
c.first_name,
c.last_name,
a.actor_id,
a.first_name,
a.last_name
from customer c
right join actor a
on c.last_name = a.last_name
order by a.last_name;

-- SELF Join :Used to join table to itself
-- Combine records from same table that matches a certain conditions

select
a.customer_id,
a.first_name,
a.last_name,
b.customer_id,
b.first_name,
b.last_name
from customer a
inner join customer b
on a.last_name = b.first_name
order by a.customer_id;



select
a.customer_id,
a.first_name,
a.last_name,
b.customer_id,
b.first_name,
b.last_name
from customer a
inner join customer b
on a.last_name = b.first_name
order by a.first_name;


-- Aggregate Functions
-- They perform caliculations on multiple rows of a single column of a table return a single result values
-- Types of Aggregate function : COUNT, SUM, AVG, MIN, MAX 

-- AVG Agregate function :return the avg value of specified column,they are excluded from results

select avg(replacement_cost)
from film;

-- COUNT Agregate function :returns total no of values in specified field works both numeric and non-numeric types

select count(*)
from film;

select count(film_id)
from film
where replacement_cost > 27;

-- DISTINCT KEY WORD : Removes duplicates

select rental_duration
from film;

select distinct rental_duration
from film;

-- SUM Aggregate Function : returns the sum of all values in specified column,works both numeric fields,null values are removed from result

select sum(replacement_cost)
from film;

-- MIN Aggregate function:returns smallest values


select min(replacement_cost)
from film;

-- MAX Aggregate function:returns largest value in specified column

select max(replacement_cost)
from film;

-- WHERE CLAUSE :used to narrow the result down to a given criteria

select *
from sakila.actor
where first_name = 'nick';

update sakila.actor
set first_name = 'nicky'
where actor_id = 2;

-- ORDER BY CLAUSE: used with SELECT to sort the result by one or more fields

select *
from sakila.actor
order by actor_id;

select *
from sakila.actor
order by actor_id desc;


select *
from sakila.actor
order by actor_id asc;


select *
from sakila.actor
where first_name like 'An%'
order by first_name,last_name;


select *
from sakila.actor
where first_name like 'An%'
order by first_name,last_name desc;

select *
from sakila.actor
where first_name like 'An%'
order by first_name,last_name asc;

-- GROUP BY CLAUSE: used to return record by one or more columns

select last_name
from actor;

select last_name
from sakila.customer
group by last_name;

select last_name,count(*)
from sakila.customer
group by last_name;

-- HAVING CLAUSE :used as a filter on GROUP BY Clause,used to apply a filter to a group of rows aggregate

select last_name, count(*)
from sakila.actor
group by last_name
having count(*) > 3;

select 
c.customer_id as 'CUSTOMER ID',
c.first_name as 'First Name',
c.last_name as 'Total Paid'
from sakila.payment p
inner join customer c on
p.customer_id = c.customer_id
group by c.customer_id
having sum(amount) > 180
order by sum(amount) desc;

-- SUBQUERY : IS A QUERY NESTED INSIDE another query,it allows you to use the results of another query
-- It allows you to pass a dynamic value to the WHERE clause,it is also called 'inner query' or 'inner select'

select *
from actor
where actor_id in (select actor_id from film_actor where film_id = 2);

-- NESTED Subqueries : Subquery nested inside another subquery


select *
from actor
where actor_id in (select actor_id from film_actor where film_id = 
                    (select film_id from film where title = 'Ace Goldfinger'));
                    

-- DERIVED Tabel : This is when a subquery starts at the FROM clause insted of WHERE CLAUSE
-- The result set is referred to as a derived table or materializes subquery

select avg(a) 
from (select 
     customer_id,
     sum(amount) a
     from payment
     group by customer_id) as totals;
     
     select 
     customer_id,
     sum(amount) a
     from payment
     group by customer_id;




