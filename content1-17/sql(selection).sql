
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