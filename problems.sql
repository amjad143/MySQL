/*create a table 'countries' with the columns country id ,country_name and region_id using DML commands.where the country id and region id should be the primary 
keys,and no columns should have null values .insert 3 records by a single insert statment.rename the table 
into divisions from countries */
/* write sql queries to insert records into the create table in previous excersises and update a single update statment
and delete only record using where clause.alter */

/* look at the tables on your screen which are the employee table ,salary_grade table and department table,now write a query in sql to list
the employee with their location and grade for the Marketing department
who comes from 'Melbourne' and 'Perth' within grade 3 to 5 and experience over 5 years. */

create table countries (
country_id int not null,
country_name varchar(20) not null,
region_id varchar(5) not null,
primary key (country_id,region_id)
);
insert into countries (country_id,country_name,region_id)
values (1,'India','MM'),(2,'Usa','Ca'),(3,'Egypt','Gz');
alter table countries
rename to divisions;

select *
from divisions;

select e.dp_id,e.emp_id,e.emp_name,e.salary,d.deep_name,d.deep_location,s.grade
from employees e,salary_grade s,department d
where e.dep_id = d.dep_id
and e.salary between s.min_sal and s.max_sal
and s.grade in (3,4,5)
and extract(year from age (curren_date,hire_date))>s
and (d.dep_name = 'marketing' and d.dep_location in ('melbourne','perth'));
   