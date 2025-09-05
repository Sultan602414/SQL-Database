
use sports
--  simple select queries 
select * from cricket;
select name ,type from cricket ;
--where cluses
select * from cricket where id=3;
select * from cricket where type='bowler';
select name ,type from cricket where id=3;
--and or operator
select * from cricket where type='bowler' or type='batsman' ;
select * from cricket where type='bowler' or type='batsman' and age>20 ;
--order by 
select * from cricket order by name;
select * from cricket order by name,age;  --conflict and prefer the first one
select * from cricket order by age desc;
--like operator
select * from cricket where name like '_l_';
select * from cricket where name like 's%';
select * from cricket where name like '%lal%';
select * from cricket where name like 'd%h';
select * from cricket where name like '[s,a]%';
select * from cricket where name like '[a-d]%';

--between operator
select * from  cricket where age between 20 and 22;
--top and percent
select top 2 * from cricket;
select top 20 percent  * from cricket;
--distinct
select distinct name  from cricket;
--in operator
select  * from  cricket where type in ('bowler','all rounder');
select  * from  cricket where type  not in ('bowler','all rounder');

--Alias 

select id as Player_id , name as Player_name,type as player_role from cricket ;

--union , union all , except and intersect 

--for union it is cumpulsory that the column should be identical 
alter table cricket drop column age;

select * from cricket 
union all
select * from hockey;

select * from cricket 
intersect
select * from hockey;

select * from cricket 
except
select * from hockey;

--agregate functions and groupby

select SUM(salary) as Total_salaries from employ;
select AVG(salary) as average_salari from employ;
select MAX(salary) as MAX_salari from employ;
select MIN(salary) as MIN_salari from employ;
select SUM(salary) as Total_salaries from employ;


select * from employ;
select e_name, sum(salary) as total_salary from employ group by e_name;

select e_name,e_address,sum(salary) from employ group by e_address,e_name;

--database changed
select * from football;

select p_type,AVG(age) as average_AGE_of_players from football group by p_type;

--having clause , where clause
select e_name, sum(salary) as t_salary from employ group by e_name having sum(salary)>15000;

select e_name, sum(salary) as t_salary from employ where salary>15000 group by e_name ;

--cube and rollup commands 
select e_name,e_address,sum(salary) from employ group by e_address,e_name with rollup;
select e_name,e_address,sum(salary) from employ group by e_address,e_name with cube;
select e_name,e_address,sum(salary) from employ group by cube(e_address,e_name);  

select e_name, sum(salary) as total_salary from employ group by e_name with cube ;

--grouping sets

select e_name,e_address,sum(salary) from employ group by  grouping sets((e_address,e_name),(e_name),(e_address),());

--subqueery (youtube)
select * from My_Employee
select * from my_Department
where Emp_id in (select Emp_id from My_Employee where Gender='Male');


select * from My_Employee
where Dept_id  in (select Dept_id from My_Department where dept_name='it');

select * from My_Employee
where salary < any 
(select salary from My_Employee where Emp_name='Anas');

--joins in sql
select * from My_Employee as A
inner join my_Department as B 
on A.Emp_id=B.Dept_id;

select * from My_Employee as A
left join my_Department as B 
on A.Emp_id=B.Dept_id;

select A.Emp_name, B.Dept_name from My_Employee as A
full join my_Department as B 
on A.Emp_id=B.Dept_id

-- self j0in(c0ncept)
select A.Emp_name, A.Emp_name from My_Employee as A
inner join My_Employee as B 
on A.Emp_id=B.Dept_id;

--transaction
set transaction isolation level read uncommitted;
select * from my_Employee;


--try catch (error handling)

begin try 
update employ set e_id='anas' where e_id=3
end try 
begin catch 
select 
ERROR_NUMBER() as [Error Number],
ERROR_severity() as [Error severity],
ERROR_State() as [Error state],
ERROR_Line() as [Error line],
ERROR_Message() as [Error Message]
end catch



--transaction with try catch (error handling)

begin try 
begin transaction
insert into employ values(6,'zain','DHA phase 4',30000)
insert into employ values(7,'zaid','DHA phase 4',11000)
insert into employ values(7,'zaid','DHA phase 4',30000)
commit transaction 
print 'transaction competed'
end try 
begin catch 

rollback transaction 
print 'transaction failed'
select ERROR_MESSAGE() as [error message]
end catch;



--interview practice questions
--custom sorting month wise

select * from salesdata;


select DATENAME(MONTH,[saledate]) as [Monthname],
--Month([saleDate]) as [MONTH],
sales
from salesdata order by Month([saleDate]) asc;


--second method via cases
SELECT * FROM MonthlySales
ORDER BY 
  CASE MonthName
    WHEN 'January' THEN 1
    WHEN 'February' THEN 2
    WHEN 'March' THEN 3
    WHEN 'April' THEN 4
    WHEN 'May' THEN 5
    WHEN 'June' THEN 6
    WHEN 'July' THEN 7
    WHEN 'August' THEN 8
    WHEN 'September' THEN 9
    WHEN 'October' THEN 10
    WHEN 'November' THEN 11
    WHEN 'December' THEN 12
  END;

 select * from employ3;

--copying table rows into another table

select * into employ2 from employ;

--copying table columns structure into another table

select * into employ3 from employ where 0<>0;

--first and last record queries

select * from employ where e_id=
(select min(e_id) from employ)

select * from employ where e_id=
(select max(e_id) from employ)

--last 3 records and first 3 records
select top 3 * from employ order by e_id desc;
select top 3 * from employ order by e_id asc;


--dispaly alternate records 
select * from employ where e_id % 2!=0;
select * from employ where e_id % 2=0;



--sql writing interview

select * from customer;
select * from orders;
select * from employ;

select MAX(salary) as maximum_salary, e_address 
from employ group by e_address order by MAX(salary) desc ;

select min(salary) as maximum_salary, e_address 
from employ group by e_address order by min(salary)  ;

select count(*) as emp_count, e_address 
from employ group by e_address   ;


--monthly sales from ProductSales table;
select * from ProductSales;

select YEAR(order_date) as years,
Datename (month,order_date) as months,sum(sales) as total_sales
from ProductSales group by YEAR(order_date), Datename (month,order_date) order by total_sales desc ;


select Datename (month,order_date) as months,sum(sales) as total_sales
from ProductSales group by Datename (month,order_date) order by total_sales desc ;

--dublicate entries(interview question)
select * from cricket;

select name,count(*) as count_number
from cricket group by name having count(*)>1;


--odd numbers(interview question)

select  top 10  * from bulk_emp_tbl where id%2!=0;


--to get quarter from date

select * from [dbo].[ProductSales];
select *,DATEPART(QUARTER,order_date) as [quarter]
from productsales;


--order of query execution 

-- from>where>group by>having> select >order by;