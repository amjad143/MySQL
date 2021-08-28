create table custom (
customer_id smallint unsigned,
customer_name varchar (30) not null,
phone char(10) not null,
primary key (customer_id)
);

create table ord(
order_id int unsigned,
customer_id smallint unsigned not null,
order_details varchar(100) not null,
primary key (order_id),
foreign key (customer_id) references custom(customer_id)
);

select *
from ord
join custom on custom.customer_id = ord.customer_id
where order_id=5;

select order_id,ord.customer_id,customer_name,order_details
from ord join custom
on ord.customer_id = custom.customer_id
order by order_id desc
limit 3;

/*This type of subset is called "innner join",which concatenate the records only if the customer_id in both tabels match
 we use "tablename.column_name" ex: ord.customer_id */
 
 select order_id,ord.customer_id,customer_name,order_details
from ord inner join custom
on ord.customer_id = custom.customer_id
order by order_id desc
limit 3;

/*Diffrent types of join :
left join :which satisfy all the conditions of the records (table.clo_name = tabel2.col_name) plus the records from left to right*/

select * from ord
left join custom on ord.customer_id = custom.customer_id;

-- If we want to change col_name into simple return

select * from ord O 
left join custom C on O.customer_id = C.customer_id;


-- Right Join:It returns all the records which satisfy the condition (tabel1.col_name = tabel2.col_nam) plus the records from the right table

select * from ord O 
right join custom C on O.customer_id = C.customer_id;

-- Full Outer join : it returns all the records which satisfy the conditions plus the records from the left table
-- as well asthe right table.

select * from ord O
left join custom C on O.customer_id = C.customer_id
union
select * from ord O
right join custom C on O.customer_id = C.customer_id;

-- COMPOSITE KEY : Is a combination of two or more columns in a table that can be used to uniquely identify each record
-- this type of join is called COMPOUND JOIN
create table StudentDetails(
class tinyint,
roll_no tinyint,
name varchar(30),
primary key (class,roll_no)
);


create table StudentMarks(
class tinyint,
roll_no tinyint,
marks tinyint,
primary key (class,roll_no)
);

select name,marks
from StudentDetails SD
join StudentMarks SM
on SD.class = SM.class
and SD.roll_no = SM.roll_no
order by marks desc
limit 1;

select SD.roll_no,name,marks
from StudentDetails SD
inner join StudentMarks SM
on SD.class = SM.class
and SD.roll_no = SM.roll_no
where SD.class =8
order by marks
limit 1;

-- Star Schema :Used to develop data warehouse and dimensional data marts.the star schema consists of one or more fact
-- tables referencing any number of dimension tables

-- SUBQUERY is Query inside another Query,it can be used to SELECT,UPDATE,INSERT and DELETE along all conditional
-- Operator such as equal to,less than GREATER THAN,IN and BETWEEEN

-- Q1. Fetch the name and marks of student who has the highest marks

SELECT *
FROM studentmarks;

select SD.name,marks
from studentmarks SM
inner join studentdetails SD
ON SM.class = SD.class and SM.roll_no = SD.roll_no
where marks = 95;

-- The Challenge is to "Fetch the value of Highest marks from Studentmarks Table"
select max(marks) from studentmarks;


select SD.name,marks
from studentmarks SM
inner join studentdetails SD
ON SM.class = SD.class and SM.roll_no = SD.roll_no
where marks = (select max(marks) from studentmarks);

-- Select the name and marks of all students who have their marks more than average marks

select avg(marks) from studentmarks;

select SD.name,marks
from StudentMarks SM
inner join StudentDetails SD
on SM.class = SD.class and SM.roll_no = SD.roll_no
where marks = (select max(marks)from StudentMarks);


-- Six marks were redused from the paper of highest marks student in re-correction
-- Syn: UPDATE statment

select max(marks) from (select * from StudentMarks) as f;

update StudentMarks
set marks = marks -6
where marks = (select max(marks) from (select * from StudentMarks) as f);

update StudentMarks
set marks = marks + 10
where marks = (select min(marks) from (select * from StudentMarks) as f);

select class , roll_no
from studentdetails
where name = 'arjun';

delete from studentmarks
where (class,roll_no) = (select class,roll_no from StudentDetails
where name = 'arjun');


-- Foregin Keys:
/* Create 2 tabels "students" and 'marks' .the student tabel contain information about the student (id,first_name,last_name,age) 
and the second table 'marks' should refer to the 'students' table using a foregin key and there be 5 subjects columns with
no null values. */

/* create three tabels 'account' ,'work', and 'account job'.the tabel 'account' should have login information such as
'user_id' and 'job name' and password, and the table should have 'job id'(primary key) and 'job name'.finally the table 'account job'
should have 'used id' and 'job id' reference the 'job' and 'account' table  */

/* Here are the 2 table creation queries given one is to create 'customer' table and another is to create 'orders' table
and you want to make customer_id from orders refer to id from customer */


create table Students (
ID int not null primary key,
first_name varchar(30) not null,
last_name varchar(30) not null,
age int not null
);

create table marks (
student_id int not null,
science int not null,
math int not null,
social_science int not null,
english int not null,
language int not null,
foreign key(student_id) references students(ID)
);

create table account (
user_id varchar(30) not null primary key,
user_name varchar(30) not null,
password varchar(30) not null,
email varchar(30) not null
);

create table job (
job_id varchar(30) primary key,
job_name varchar(30) not null
);

create table account_job (
user_id varchar(30),
job_id varchar(30),
foreign key(user_id) references account(user_id),
foreign key(job_id) references job(job_id)
);

create table customers (
id int primary key,
customer_name varchar(30)
);

create table orders (
id int,
ord_date date,
foreign key (id) references customers(id)
);


create table customers1 (
id int primary key,
customer_name varchar(30)
);
create table orders1 (
id int,
ord_date date);
alter table orders1
add constraint orders1
foreign key (id) references customers1(id);
































