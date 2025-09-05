--creating a database
create database sports;
--to use db
use sports;
--tables creation sports db
create table cricket(
id int primary key,
name varchar(20),
age int,
type varchar(15),
)
--table of election db
create table Voter(
voter_id int ,
voter_name varchar(20),
voter_age int,
)



--insert data into tables
insert into cricket values (1,'sultan',22,'All rounder'),(2,'Ali',21,'bowler'),(3,'jalal',20,'batsman'),(4,'Danish',19,'fielder');
insert into cricket values (5,'sultan',22,'bowler')
insert into voter values (1,'sultan',22),(2,'Ali',21),(3,'jalal',20),(4,'Danish',19);


--constraints concepts

--not null
create table football (p_id int not null, p_name varchar(20) not null,p_type varchar(15) not null );
create table football (p_id int  unique not null, p_name varchar(20) not null,p_type varchar(15) not null );   
create table football (p_id int  primary key, p_name varchar(20) not null,p_type varchar(15) not null  ); 
create table football (p_id int  primary key, p_name varchar(20) not null,p_type varchar(15) not null ,age int not null check(age>=15) ); 
create table football (p_id int  primary key, p_name varchar(20) not null,p_type varchar(15) not null default('midfeilder') ,age int not null ); 


--for checking the constraints
select * from football;
insert into football values (1,'sultan','defender',18)
insert into football values (2,'haider','attacker',17)
insert into football values (3,'haider','attacker',17)
insert into football(p_id,p_name,age) values (4,'haider',21)

--delete table 
drop table  football;

--identity and auto increment 
create table hockey(p_id int primary key identity , p_name  varchar(50) not null , p_role varchar(20) )

insert into hockey values ('sultan','keeper');
insert into hockey values ('haider','defender');
insert into hockey values ('ali','attacker');
select * from hockey;




--foriegn key and primary key concepts
create database salesDB;
use salesDB
CREATE TABLE Customer (
    C_ID INT PRIMARY KEY,
    C_Name VARCHAR(50),
    c_Address VARCHAR(max),
    City VARCHAR(50)
);
INSERT INTO Customer VALUES 
(0, 'unknown', 'none', 'no city'),
(1, 'Ali', 'Latifabad Unit: 12', 'Hyderabad'),
(2, 'Amir', 'Latifabad Unit: 11', 'Hyderabad'),
(3, 'Anas', 'Gulshan e Iqbal', 'Karachi'),
(4, 'Usman', 'Latifabad Unit: 8', 'Hyderabad'),
(5, 'Afnan', 'Latifabad Unit: 6', 'Hyderabad');

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderItem VARCHAR(50),
    OrderQuantity INT,
    PriceOfOne INT,
	customer_id int foreign key references Customer (c_id) 
	--on delete cascade
	--on update cascade
);

INSERT INTO Orders VALUES 
(100, 'Hardisk', 2, 500, 4),
(101, 'Ram', 1, 350, 2),
(102, 'Printer', 2, 4000, 3),
(103, 'Monitor', 3, 1500, 4);

select * from Customer;
select * from Orders;

--composite primary key 
CREATE TABLE Employ (
    e_ID INT,
    e_Name VARCHAR(50),
    e_Address VARCHAR(max),
	primary key (e_id,e_name)
);
INSERT INTO Employ VALUES 
(1, 'Ali', 'Latifabad Unit: 12'),
(2, 'Amir', 'Latifabad Unit: 11'),
(3, 'Anas', 'Gulshan e Iqbal'),
(4, 'Usman', 'Latifabad Unit: 8'),
(5, 'Afnan', 'Latifabad Unit: 6');


--cascading referential constraints 
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderItem VARCHAR(50),
    OrderQuantity INT,
    PriceOfOne INT,
	customer_id int foreign key references Customer (c_id)

	--on delete cascade
	--on update cascade

	--on delete set null
	--on update set null 

	--on delete set default
	--on update set default 
);