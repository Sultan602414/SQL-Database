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



--tables for subquery
CREATE TABLE my_Department (
    Dept_Id INT PRIMARY KEY,
    Dept_Name VARCHAR(50)
);
INSERT INTO my_Department (Dept_Id, Dept_Name) VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'IT'),
(4, 'Sales');
CREATE TABLE my_Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_Name VARCHAR(50),
    Gender VARCHAR(10),
    Salary INT,
    Cty VARCHAR(50),
    Dept_Id INT FOREIGN KEY REFERENCES my_Department(Dept_Id)
);
INSERT INTO my_Employee (Emp_Id, Emp_Name, Gender, Salary, Cty, Dept_Id) VALUES
(100, 'Usman', 'male', 25000, 'Hyderabad', 4),
(101, 'Anas', 'male', 45000, 'Karachi', 1),
(102, 'Anum', 'Female', 35000, 'Sukkur', 3),
(103, 'Ali', 'male', 45000, 'Hyderabad', 4),
(104, 'Asighar', 'male', 35000, 'Karachi', 2),
(105, 'Osama', 'male', 25000, 'Sukkur', 3);


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
    e_ID INT ,
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
--no validation (youtube)

--stored procedures 

create procedure spGetEmployDetails 
as 
begin
select Name , salary from Employ_details;
end;

execute spGetEmployDetails;


--stored procedures with parameters


create procedure spGetEmployDetailsBYIDandName 
@id int,@name varchar(50)
as 
begin
select * from Employ_details where id=@id and name=@name;
end;

execute spGetEmployDetails 8,'Sultan';

sp_helptext spGetEmployDetails;


--stored procedures with parameters(output)

create procedure spGetEmployDetailsByGender
@Gender varchar(50)
@EmployeeCount int Output
as 
begin
select @EmployeeCount=Count(Emp_id) from Employ_details where gender=@Gender;
end;


Declare @total_employ int
execute spGetEmployDetailsByGender 'male',@total_employ output
select @total_employ;

--DML triggers (insert ,update, delete)
--triggers   (after triggr)
create trigger tr_employ_forinsert 
on employ
after insert 
as 
begin
print 'something from the table'
end;

create trigger tr_employ_fordelete 
on employ
after delete 
as 
begin
select * from deleted
end;

--triggers(instead of trigger)

create trigger tr_employ2_forinsert 
on employ2
instead of insert  
as 
begin
print' unable to insert any data '
end;


create trigger tr_employ2_for_delete 
on employ2
instead of delete 
as 
begin
print' unable to delete any data '
end;


--DDL triggers (create,drop,alter)

create trigger tr_emp_table_ddl_create
on database 
for Create_table 
as 
begin 
print'a new table is created in the database'
end

create table triggername(id int )
drop table triggername;

--there is no 'instead of' like DML triggers so we use rollback for prohibitation 
create trigger tr_table_ddl_delete
on database 
for Drop_table 
as 
begin 
rollback
print'you can not delete any tables from this database'
end

--to delete DDL trigger ()
drop trigger tr_table_ddl_delete on database;

disable trigger tr_table_ddl_delete on database;
enable trigger tr_table_ddl_delete on database;

--all the above are database-scoped triggers
--server-scoped DDL trigers
 
create trigger tr_table_ddl_delete_server
on ALL server
for Drop_table,Alter_table 
as 
begin 
rollback
print'you can not delete or change any tables from this server'
end

disable trigger tr_table_ddl_delete_server on all server;


--views in sqL
create view vW_forEmploy 
as
select A.*,B.Dept_name 
from MyEmployees as A inner join MyDepartment as B
on B.id=A.id where dept_name='H-R';


select * from vW_forEmploy;

sp_helptext vW_forEmploy;

-- insert update delete i views also effects the original columns

insert into vW_forEmploy values (113,'areeb','male')
update vW_forEmploy set emp_name='sultan' where id=113;
delete from vW_forEmploy where epm_id=113;




-- indexess--


select * from employ;

create index IX_FTF_Salary 
on Employ (salary asc);

sp_helpindex Employ;

select * from employ where salary>10000 and salary<15000;



create  clustered index IX_FTF_Salary 
on Employ (salary asc,e_name asc);


create  nonclustered index IX_FTF_Salary 
on Employ (salary asc,e_name asc);


create  unique nonclustered index IX_FTF_Salary 
on Employ (salary asc,e_name asc);

sp_helpindex Employ;





--interview questions practice 

CREATE TABLE SalesData (
    SaleDate DATE,
    Sales INT
);
INSERT INTO SalesData (SaleDate, Sales) VALUES
('2023-01-21', 1100),
('2023-06-17', 1800),
('2023-09-11', 3500),
('2023-03-28', 2300),
('2023-10-19', 1300),
('2023-05-23', 3300),
('2023-11-12', 2900),
('2023-02-22', 1800),
('2023-08-26', 1400),
('2023-04-07', 2500),
('2023-12-19', 1200),
('2023-07-13', 2200);


CREATE TABLE MonthlySales (
    MonthName VARCHAR(20),
    Sales INT
);
INSERT INTO MonthlySales (MonthName, Sales) VALUES
('April', 1100),
('January', 1800),
('May', 3500),
('August', 2300),
('December', 1300),
('June', 3300),
('March', 2900),
('November', 1800),
('July', 1400),
('October', 2500),
('February', 1200),
('September', 2200);


select * from salesdata;


--video 41 table 
CREATE TABLE ProductSales (
    id INT PRIMARY KEY,
    p_name VARCHAR(50),
    price_of_1 INT,
    order_date DATE,
    sales INT
);
INSERT INTO ProductSales (id, p_name, price_of_1, order_date, sales) VALUES
(1, 'Mouse', 500, '2023-01-05', 25),
(2, 'Hardisk', 1500, '2023-01-06', 14),
(3, 'SSD', 2000, '2023-02-08', 16),
(4, 'Keyboard', 700, '2023-02-09', 13),
(5, 'Aipods', 2500, '2023-03-11', 19),
(6, 'USB', 800, '2023-03-12', 26),
(7, 'Handfree', 400, '2023-04-18', 14),
(8, 'Monitor', 1500, '2023-04-03', 8),
(9, 'Microphone', 1800, '2023-04-15', 28),
(10, 'Graphic Card', 4500, '2023-05-15', 11);

select * from ProductSales;


--bulk insert in sql 
create table bulk_emp_tbl(
id int primary key identity,
firstname varchar(50),
lastname varchar(50),
age int
);
select * from bulk_emp_tbl;

bulk insert  bulk_emp_tbl
from 'C:\Users\sultan.haider\Downloads\employees.csv'
with ( 
fieldterminator = ',',
rowterminator = '0x0a',
firstrow=2
);


--insert into statement (copying rows from existing table to another table)

create table pakcricket(id int  , name varchar(50),pl_type varchar(max)  );
insert into pakcricket values(1,'fakhar','batsman')
insert into pakcricket values(2,'shaheen','bowler')
select * from cricket;
select * from pakcricket;

drop table pakcricket 
insert into pakcricket select * from cricket;



--creating a function 
create  function Showmessage()
returns varchar(50)
as 
begin 
return 'hello world'
end 
drop function Showmessage;

select dbo.Showmessage();

create function AddTwoNumbers(@a  int ,@b  int)
returns int
begin 
return(@a+@b)
end

select dbo.AddTwoNumbers(5,8) as sum;

create or alter function Showmessage()
returns varchar(50)
as 
begin 
return 'hello world'
end 


--inline table valued function 
create function get_employes()
returns table 
as
return (select * from employ)


select * from get_employes(); 

--string functions 
select ASCII('A');
select ASCII('Z');


declare @start int 
set @start =65
while(@start<95)
begin 
print(char(@start))
set @start =@start+1
end
--now cover it in a funtion

CREATE FUNCTION GetAlphabets()
RETURNS @AlphabetTable TABLE (
    Alphabet CHAR(1)
)
AS
BEGIN
    DECLARE @start INT = 65;

    WHILE (@start <= 90)  -- ASCII for A-Z
    BEGIN
        INSERT INTO @AlphabetTable (Alphabet)
        VALUES (CHAR(@start));

        SET @start = @start + 1;
    END

    RETURN;
END

SELECT * FROM dbo.GetAlphabets();
--remove extra spaces
select RTRIM('             heloo   ')
select LTRIM('             heloo     ')
select TRIM('             heloo     ')



--GUID in sql (global unique identifier)

create table badminton(id uniqueidentifier primary key default newid(),name varchar(50));
insert into badminton values(default,'Sultan')
insert into badminton values(default,'Haider')
insert into badminton values(default,'shahzad')
insert into badminton values(default,'Mubashar')

create table table_tennis(id uniqueidentifier primary key default newid(),name varchar(50));
insert into table_tennis values(default,'zain')

select * from badminton;
select * from table_tennis;

insert into table_tennis select * from badminton;


--merge statement in sql 
select * from Employ;
select * from Employ2;



merge Employ as T
using Employ2 as S 
on T.e_id=S.e_id
when matched then 
update set T.e_name =S.e_name,T.e_address=S.e_address,T.salary=S.salary
when not matched by target then 
insert (e_id,e_name,e_address,salary) values (S.e_id,S.e_name,S.e_address,S.salary)
when not matched by source then 
Delete;


--temporary tables in sql 

--note: the temporary tables can be acceesible in the same connection where they were made 

--syntax is same just use # at the start as 

create table #student (id int identity primary key,name varchar(100));
insert into #student values ('sultan'),('ali'),('wasi');
select * from #student;
drop table #student; --it will also automaticaly dropped when connection closed

--for global te porary tables we use ## instead of #
--it will be aceesible in all connection 
--and deleted when the connection where it is created is closed 





