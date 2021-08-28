SELECT UPPER('amjad');
select lower('pathan');
select length('amjad');
select left('sachin',3);
select substring('sachin tendulkar',8,9);
select substring('sachin tendulkar',8);
select ltrim('   pathan');
select rtrim('amjad   ');
select trim('   khan      ');
select locate('tendulkar','sachin tendulkar');
select replace('i am sql programer','i am','you are');

select * from city;
select ID,upper(NAME),ascii(Population)
from city;

select actor_id,lower(last_name),last_update 
from actor
order by 3 desc;

select customer_id,left(first_name,4),right(last_name,4)
from customer;

select customer_id,concat(first_name,' ',last_name) as full_name
from customer;

select customer_id,concat(left(first_name,4),'',right(last_name,4)) as full_name
from customer;

select rental_id,avg(amount) as avg_amount
from payment
group by rental_id
having avg(amount)>4
order by avg_amount;

select *
from actor
where first_name like 'A%';





