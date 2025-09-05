--rename database name and tables
sp_renamedb 'Elections','Election2022'
sp_rename 'Voter','Voter2022'

--alter command for changing database name 
alter database Election2022 modify name=Election2020

--alteration in tables 
alter table Voter2022 add voter_city varchar(50)
alter table Voter2022 drop column voter_city ;





update Voter2022 set voter_city='sahiwal' where voter_age>15;
--changing column datatype 
alter table Voter2022 alter column voter_name nvarchar(50);
--changing constraints on exixting tables
alter table voter2022 alter column voter_name varchar(50) not null;
alter table voter2022 alter column voter_name varchar(50)  null;
alter table voter2022 add unique(voter_id);
alter table voter2022 drop [UQ__Voter202__B7950312D9A6509E];
alter table voter2022 alter column voter_id int not null;
alter table voter2022 add primary key(voter_id);

alter table voter2022 add  check (voter_age >=18)
alter table voter2022 drop  constraint [CK__Voter2022__voter__38996AB5]
alter table voter2022 add default 18 for voter_age;

--testing purpose
select * from Voter2022;

-- deleting whole tables from a database
drop table Orders;
drop table customer;


--foreign key primary key alteration
--deleting foreign key
alter table [Orders] drop constraint [FK__Orders__customer__4BAC3F29];
--adding foreign key in existing tables
alter table  [orders] add  foreign key(customer_id) references customer(c_id);

--composite primary key on exixting table
alter table employ add primary key(e_id,e_name);

--drop foriegn key constraint and change cascading refrential integrity


alter table Orders drop constraint [FK__Orders__customer__4CA06362]
alter table Orders drop constraint [FK__Orders__customer__5070F446]

alter table Orders add  foreign key(customer_id) references  Customer(c_id) on delete  Cascade on update set NULL;
alter table Orders add default 0 for customer_id;

alter table Orders add  foreign key(customer_id) references  Customer(c_id) on delete set default on update set default ;
delete from customer where C_id=3;



--agregate functions 

alter table employ add salary int ;
update Employ set salary=10000 where e_id=1;
update Employ set salary=13000 where e_id=2;
update Employ set salary=15000 where e_id=3;
update Employ set salary=20000 where e_id=5;

select * from employ;


