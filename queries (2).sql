                                -- Class 11th Basics
CREATE table Student(RNo int ,
name varchar(20), Gender varchar(10), DOB date,Class int,Marks int);

insert into Student
values(1001,"Shivansh","Male","2005-12-13",12,80),
(1002,"Mahi","Female","2005-04-26",11,90),
(1003,"Parth","Male","2006-10-12",12,70),
(1004,"Aditya","Male","2006-10-09",10,100),
(1005,"Varshika","Female","2006-01-10",8,35);

-- Updating a record
update Student
set name="Dev" where RNo=1003;
select * from Student;

Select ' '  as ' ' ;

-- Deleting a record
delete from Student where RNo=1003;
select * from Student;

-- To count the no. of studnet
Select ' '  as ' ' ;
select count(*) from Student;

-- Adding a new column
Alter table Student add Email varchar(20);
update Student
set Email="shivansh@gmail.com" where RNo=1001;

update Student
set Email="mahi@gmail.com" where RNo=1002;

--  Removing a column
Alter table Student
drop Email;

-- Changing Datatype of Attribute
Alter Table Student 
modify Class varchar(20);

-- Adding a primary key
Alter table Student
add primary key(RNo);

-- Deletinga primary key
alter table Student
drop primary key;

-- Adding a default value 
Alter table Student
add Salary int;

Alter table Student
modify Salary int default 50000;
