create table INVENTORY(CarID varchar(10) primary key, CarName varchar(10), Price float, 
Moder varchar(10),YearManufacture int,FuelType varchar(10));

create table SALE(InvoiceNo varchar(10) primary key, CarID varchar(10), CustID varchar(10),SaleDate date,
PaymentMode varchar(20), EmpID varchar(10), SalePrice float);

create table CUSTOMER(CustID varchar(10) primary key, CustName varchar(20),CustAdd varchar(30),
Phone FLOAT,Email varchar(20));

create table EMPLOYEE(EmpID varchar(10) primary key,EmpName varchar(10),DOB date,DOJ date,
Designation varchar(20),Salary int);



INSERT INTO INVENTORY
VALUES
("D001","Car1",582613,"LXI",2017,"PETROL"),
("D002","Car1",673112,"VXI",2018,"PETROL"),
("B003","Car2",567031,"SIGMAL.2",2017,"PETROL"),
("B004","Car2",647858,"DELTAL.2",2017,"PETROL"),
("E005","Car3",355205,"5 STR STD",2017,"PETROL"),
("E006","Car3",654914,"CARE",2017,"CNG"),
("S007","Car4",514000,"LXI",2017,"CNG"),
("S008","Car4",614000,"VXI",2017,"PETROL");

INSERT INTO CUSTOMER
VALUES
("C0001","Amit Saha","l-10, Pitampura",456481523,"amit@gmail.com"),
("C0002","Rehnuma","Shastri Nagar, Delhi",7458127634,"rehnuma@gmail.com"),
("C0003","Charvi Nayyar","India Gate, New Delhi",7436915483,"charvi@gmail.com"),
("C0004","Gurpeet","Amritsar, Punjab",9642535198,"Gurpeet@gmail.com"),
("C0005","Shivansh","Satna, MP",8425301590,"shivansh@gmail.com");

INSERT INTO SALE
VALUES
("I00001","D001","C0001","2019-01-24","Credit Card","E004",613247),
("I00002","S001","C0002","2018-12-12","Online","E001",590321),
("I00003","S002","C0004","2019-01-25","Cheque","E010",604000),
("I00004","D002","C0001","2018-10-15","Bank Finance","E007",659982),
("I00005","E001","C0003","2018-12-20","Credit Card","E002",36931),
("I00006","S002","C0002","2019-01-30","Bank Finance","E007",620214);

INSERT INTO EMPLOYEE
VALUES
("E001","Rushil","1994-07-10","2017-12-12","Salesman",25550),
("E002","Sanjay","1990-03-12","2016-06-05","Salesman",33100),
("E003","Zohar","1975-08-30","1999-01-08","Peon",20000),
("E004","Arpit","1989-06-06","2010-12-02","Salesman",39100),
("E006","Sanjucta","1985-11-03","2012-07-01","Receptionist",27350),
("E007","Mayank","1993-04-03","2017-01-01","Salesman",27352),
("E0010","rajkumar","1987-02-26","2013-10-23","Salesman",31111);


--                        Function in SQL
--  Two types :- Single Row  and Aggregate Functions

--  1) Single Row Functions
-- These are Scalar Functions, applied on a single value and 
-- return single values
--  Can be Classified into Numeric, String and Date and Time funcitos

-- A) Numeric Functions
select power(2,3);
select round(11.78265,3); -- round(number,decimal places upto which)
select mod(15,4);


Alter table SALE
add (Commission Numeric(7,2)); -- Total length of 7 in which 3 decimal places to be there
Update Sale 
Set Commission = 12/100 * SalePrice;

select " " as " ";
select Commission "Just for Clarity" from SALE;
select " " as " ";
select Round(Commission,0) from SALE;

-- B) String Functions
select " " as " ";
select ucase("shiVAnsh");
select " " as " ";
select lcase("SHIvanSH");

--  MID/SUBSTRING/SUBSTR
select " " as " ";
select mid("Untouchability",1,7);
select " " as " ";
select mid("Untouchability",3,5);
select " " as " ";
select mid("Untouchability",3);-- Returns till the end

-- length
select " " as " ";
select length("Shivansh");

-- left and right
select " " as " ";
select left("Shivansh",4);
select " " as " ";
select right("Shivansh",4);

-- INSTR
--  returns zero if it is not present
select " " as " ";
select INSTR("Shivansh","va");
select " " as " ";
select INSTR("Shivansh","ma");

--  LTRIM
-- Return the given string after removing leading white spaces
select " " as " ";
select length("  Delhi"), length(LTRIM("  Delhi"));
-- RTRIM
-- Returns the given string after removing the trailing white sspaces
select " " as " ";
select length("Delhi  "), length(RTRIM('Delhi  '));

-- TRIM removes both


-- C) Date and Time Functions
-- Now  
select " " as " ";
select Now();
-- Date
select " " as " ";
select date(Now());

-- Year 
select " " as " ";
select Year(Now());

-- Month
select " " as " ";
select Month(Now());
select " " as " ";
select monthname(Now());

-- Day
select " " as " ";
select day(now());
select " " as " ";
select dayname(now());

--                          Aggregate Functions
-- Called multiple row Functions
-- work on a set of records as a whole and return single value for each 
-- column of the record. 

-- a) max
select " " as " ";
select MAX(SalePrice) from SALE;

-- b) min
select " " as " ";
select min(Price) from INVENTORY;

-- c) average
select " " as " ";
select avg(Price) from INVENTORY;

-- d) summation
select " " as " ";
select sum(Price) from INVENTORY;

--  e) count (Ignores the NULL values)
select " " as " ";
select count(CarID) from INVENTORY;

--  f) Count(*) -- RETURN THE number of records in a table
select " " as " ";
select Count(*) from SALE;


--                            Group BY in SQL
-- It is used to fetch a group of rows on the basis of commo values
-- in a column
-- It groups the rwos together that contain the same values in 
--  a specified colun.
select " " as " ";
select CustID,Count(*) "Number of Cars" from SALE group by CustID;
select " " as " ";
select CustID, Count(*) "Number of Cars" from SALE group by CustID having count(*)>1;


select " " as " ";
select PaymentMode,count(PaymentMode) "Number of Times" from 
SALE group by PaymentMode;


--                            Operations on Relations
-- Note that these operation can only be applied if both the
-- relations have the same number of attributes andd correspoding attributes in both tables have same domains

-- 1) Union 
-- To combine selected rows of two tables at a time
create table Dance(S_No int primary key,Name varchar(20),Class varchar(20));
create table Music(S_No int primary key,Name varchar(20),Class varchar(20));

INSERT into Dance
values(1,"Surbhi",'11A'),
(2,"Sourabh",'12A'),
(3,"Shivansh",'10B'),
(4,"Swetabh",'8F');

INSERT into Music
values(1,"Surbhi",'14A'),
(2,"Shikha",'12A'),
(3,"Shivansh",'10B'),
(4,"Parth",'8F');

-- Surbhi comes one time
select " " as " ";
select Name from Dance 
Union
select Name from Music;


-- But here Surbhi comes two Times
select " " as " ";
select * from Dance 
Union
select * from Music;
  
--              SAME WAY THEIR IS MINUS,INTERSECT FUNCTION BUT NOT WRITING 
                          -- IT HERE SEE FROM BOOK
                          
                          
                          