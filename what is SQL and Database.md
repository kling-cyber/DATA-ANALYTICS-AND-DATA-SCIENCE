# What is  SQL and database ?

# what is Database ? 
- A database is stored an information in form of tables 
- A database is a collections of informations that stored users informations

# what is DBMS ?

- DBMS stands for database managements systems 
- DBMS is collection of databases 
- DBMS is a GUI of databases 

# xampp => mysql

![alt text](image-4.png)

# mysqlworkbench8.0 (mysql community)

![alt text](image-5.png)

# what is RDBMS ? 

- stands for relational database management systems 
- RDMS is used to normalized database relation
- RDBMS provides relation b/w one database to another database 


# what is SQL ?

- A SQL stands for structured query language
- A SQL is used to create a database and table structured 
- A SQL is used to create a structured database and tables 
- A SQL is case-insenstive language
- insenstive language examples : INSERT | insert | Insert 


# what is Database  and list of databases ? 

- A database is used to stored an information i.e called database 
- List out 5 name of database 
1. oracle
2. mysql 
3. sqlite 
4. sql server
5. mongoDB


## how to open xampp 

1. xampp=>control panel=>start 

2. localhost/phpmyadmin

![alt text](image.png)

![alt text](image-1.png)


## how to open mySQLworkbench8.0

1. https://dev.mysql.com/downloads/workbench/
2. open mysqlworkbench
3. create an database instance

![alt text](image-2.png) 



## what is difference b/w SQL and MYSQL 

## SQL

1. sql is an structured query language 
2. sql is case insenstive language
3. sql is create database and tables structured 

## MySQL

1. mysql is an database 
2. mysql is case senstive language
3. mysql is used to stored data 


# what is DBMS ? 
1. DBMS stands for database management system 
2. DBMS is used to manage databases 
1. oracle
2. mysql 
3. sqlite 
4. sql server
5. mongoDB

# what is RDBMS ? 
1. RDBMS stands for relational database managment system 
2. RDBMS provides relations b/w database and its tables 
3. RDBMS manage GUI of database 


## types SQL commands or SQL query ?

- DDL (data definition langauge)
- DML (data manipulation language)
- DQL (data query language)
- TCL (transanctional control language)


## DDL (data definition language) : 

- A DDL is used to create database and table definition 
- A DDL is used to create database name and table name and its structures 
- A DDL query are or commands are  ....

1. create
2. alter 
3. rename
4. change
5. drop 
6. truncate 

## how to create database ? 

**syntax**

```
create database databasename;
or
create database db_app; 
or 
create database data_analytics_630
``` 

## how to create table  ?

**table datatype and size structures**

# SQL Table create chart Structure

| Column Name | Data Type | Size | Description |
|-------------|-----------|------|-------------|
| ID | INT | 11 | Primary Key (auto_increment) |
| FirstName | VARCHAR | 0-255 | Employee first name |
| LastName | VARCHAR | 0-255 | Employee last name |
| Email | VARCHAR | 255 | Email address |
| Phone | VARCHAR | 20 | Contact number |
| DateOfBirth | DATE | - | Birth date |
| Salary | DECIMAL | 10,2 | Employee salary |
| IsActive | BIT | 1 | Active status |
| CreatedDate | DATETIME | - | Record creation date |
| UpdatedDate | DATETIME | - | Last update date |
| address     | text     |  for more text   |
| multiple choice | enum |  for multiple choices |
| mobile | bigInt | 20 | for bigInt   |
| photo  | blob   | bigsize           |
| defaulttimezone  | timestamp   | default timezone set time and date           |


# what is primary key ? 

1. A pk is only defined one times in a tables 
2. A pk is always stored unique values
3. A pk never stored null values 
4. A pk is always auto_increment

# what is unique key ? 

1. A uk is defined more than one  times in a tables 
2. A uk is always stored unique values
3. A uk can be  stored one times null values 
4. A uk never stored dublicate values



# what is foreign key ? 

1. A fk is defined more than one  times in a tables 
2. A fk is stored dublicate data
3. A fk can be  provides relationship b/w tables 


**syntax**

```
create table tablename(

id int auto_increment primary key,
name varchar(255),
password varchar(255),
mobile bigInt,
address text,
appointmentdate_time datetime
);
or

create table users(
id int auto_increment primary key,
name varchar(255),
password varchar(255),
mobile bigInt,
address text,
appointmentdate_time datetime
);

or

create table employee(
empid int AUTO_INCREMENT primary key,
name varchar(255),
password varchar(255),
gender varchar(255),
hobby varchar(255),
address text,
phone bigint    

)

or

create table tbl_salesman(

id int AUTO_INCREMENT primary key,
name varchar(255),
age int,
mobile bigint,
address text,
salary decimal(10,2),
department varchar(255),
create_at timestamp


)

or

create table employee(

empid int AUTO_INCREMENT primary key,
name varchar(100),
firstname varchar(200),
lastname varchar(200),
email varchar(200),
password varchar(200),
mobile bigint,
salary decimal(10,2),
gender enum('male','female','other'),
address text,
status enum('active','inactive')

);


``` 

## alter

1. alter is used to add new column in a table
2. alter is used to modify or add or update new column in tables
3. alter also create a unique key in column.
4. alter tables add column | modify column | update column in tables

**syntax**

```
alter table tablename add columnname datatype(size)
or
alter table employee add country varchar(255)
or
alter table employee add state varchar(255)
or
alter table employee add photo blob after name;
or
alter table employee change phone mobile bigint;
or
alter table employee add unique(`mobile`)
or 
alter table tbl_employee change photo image varchar(200);
or
alter table tbl_reviews add added_date_time datetime;
```


## drop : 

1. drop is used to delete or drop a database or table structures 
2. drop is delete structures of database and tables can't rollback 
3. after drop we never rollback structures and data 

**syntax**

```
drop database databasename
or
drop database data_analytics_630;
or
drop table tablename
or
drop table employee
or
drop table users

```

## truncate :

1. truncate is used to delete or remove all data from from tables 
2. truncate is used to empty all data from tables 
3. after truncate we never rollback data 

**syntax**
```
truncate table tablename
or
truncate table employee
```

## delete : 
1. delete deleted all data from tables 
2. delete is deleted single data from tables 
3. delete is delete range of data from tables using in 
4. delete is rollback data 


**syntax**

1. delete from tbl_users;
2. delete from tbl_users where uid=1;
3. delete from tbl_users where uid in (1,2);
4. delete from tbl_users where uid=1 between 100 and 200;



## rename :

1. rename is used to change any table name 

**syntax**

```
rename table employee to tbl_employee
or
rename table users to tbl_users
or
rename TABLE tbl_users to users;
```


## revised....

**create a table tbl_reviews with following column name**

```
tbl_reviews 

rid
name
email
phone
rating 
comment

or

create table tbl_reviews(
rid int AUTO_INCREMENT primary key,
name varchar(255),
email varchar(255),
phone bigint,
rating enum('*','**','***','****','*****'),
comment text    

) 

```

## DML : data manipulation language 

1. DML is used to manipulate data in tables 
2. DML is used to insert | delete | update data or rows in tables 
3. DML used for manipulation of data 

**query used in DML**

1. insert 
2. delete 
3. update 

## how to insert data in tables
**syntax**

```
insert into tablename(columnname) values('value')
or 
insert into tbl_employee(name,image,password,gender,hobby,address,mobile,country,state)values('kumar','kumar.jpg','k515454','male','read,playing','150 feet ring road rajkot',91212121,'india','gujrat')

or

insert into tbl_employee(name,image,password,gender,hobby,address,mobile,country,state)values('deep','deep.jpg','k515454','male','read,playing','150 feet ring road rajkot',97212121,'india','gujrat'),('lokesh','lokesh.jpg','k515454','male','read,playing','150 feet ring road rajkot',91214121,'india','gujrat'),('sumya','sumya.jpg','k515454','male','read,playing','150 feet ring road rajkot',91212521,'india','gujrat')

or

insert into tbl_employee values(null,'jay','jay.jpeg','j564511','male','reading','150 feetring road',9412322121,'india','gujrat'),(null,'vijay','vijay.jpeg','j564511','male','reading','150 feetring road',9412322121,'india','gujrat')

or

insert into tbl_salesman(name,age,mobile,address,salary,department,create_at) values('vaidehi',21,912132121,'150 feet ring road rajkot',25800,'HR','31/08/2026 18:52')

or

insert into tbl_salesman(name,age,mobile,address,salary,department,create_at) values('noori',24,9121812,'150 feet ring road rajkot',26800,'HR','31/08/2026 18:52'),('khushali',25,9121864,'150 feet ring road rajkot',27800,'HR','31/08/2026 18:52')

or

insert into tbl_salesman values(null,'kavish',23,9121812645,'150 feet ring road rajkot',27800,'IT','31/08/2026 18:52'),(null,'jay',26,9655121864,'150 feet ring road rajkot',27800,'CSE','31/08/2026 18:52')

```

# how can we delete data 

1. all data delete from tables 

```
delete from tablename
or
delete from tbl_employee;
```

2. delete one rows from table 

```
delete from tablename where id=1;
or
delete from tbl_employee where empid=1;

```

3. delete  two or more than two rows from table 

```
delete from tablename where id in(5,6);
or

delete from tbl_employee where empid in(5,6)

```

4. delete  range of data from table 

```
delete from tablename where id between 5 and 12;
or

delete from tbl_employee where empid between 5 and 12;

```

5. delete from name column data from table

``` 
delete from tbl_country where name='europe';
```

6. delete data or rows using limit 

```
delete from tbl_country where cid > 0 limit 4;
```  
7. delete from tbl_salesman where name='kavish';

8. delete from tbl_salesman where id limit 0,3;

9. delete from tbl_salesman where id limit 3,2;

# update a data or rows 

1. update rows 

```
update tbl_employee set name='khushali',image='k.jpeg',password='k$$123',gender='female',hobby='reading,surfing',address='150 raiya road rajkot',mobile=635941323,country='uk',state='london' where empid=16

or


update tbl_salesman set name='brijesh',age=36,mobile=952125962,address='near pandeypur churaha behind over bridge varansi',salary=115000,department='CSE',create_at='01/09/2026 10:56' where id=1; 

```

**screenshot**

![alt text](image-3.png)


## DQL :

1. data query language 
2. DQL is used to select data or fetch data 

## DQL query 

1. select 

**How fetch data or select data**

- select all data from tables

```
select * from tbl_employee;
or
select * from tbl_salesman;
```

- select particular one data from tables

```
select * from tbl_employee where empid=5;
or
select * from tbl_salesman where name='khushali';
```


- select particular alternate data  from tables

```
select * from tbl_employee where empid in (5,6,9);
or
select * from tbl_salesman where id in (4,5,6); 

```

- select particular range of data   from tables

```
select * from tbl_employee where empid between 1 and 100;

```


- select particular columns of  data  from tables

```
select empid,name,email from tbl_employee;
or
select id,name,mobile,address from tbl_salesman;
```
- select particular data using limit  from tables

```
select empid,name,hobby from tbl_employee where limit 3,5;
or
select * from tbl_country where cid limit 4,1;
or
select id,name,mobile,address from tbl_salesman;
or
select id,name,mobile,address from tbl_salesman limit 2,3;
```

- select data using conditional or logical operator 

```
select id,name,mobile,address from tbl_salesman where salary > 26000;
or
select id,name,mobile,address from tbl_salesman where salary > 28000 and age>25;
or
select id,name,mobile,address from tbl_salesman where salary > 28000 and department='CSE';
or
select id,name,mobile,address from tbl_salesman where salary > 28000 and department='CSE' and age>25;
or
select id,name,mobile,address from tbl_salesman where salary > 28000 or department='IT';
or

select id,name,mobile,address from tbl_salesman where salary > 28000 or department='IT';
```

# order by : 

1. order by is used to filter data in asc and desc order

```
select * from tbl_country order by cid;
or
select * from tbl_country order by cid asc;
or 
select * from tbl_country order by cid desc;
or
select id,name,mobile,address,salary from tbl_salesman where salary > 26000 order by name desc;
or
select id,name,mobile,address,salary from tbl_salesman where salary > 26000 order by name;
or
select id,name,mobile,address,salary from tbl_salesman where salary > 26000 order by salary
or
select id,name,mobile,address,salary from tbl_salesman  order by salary;
or
select id,name,mobile,address,salary from tbl_salesman  order by salary desc;

```

# group by :

1. group by is used to grouping or filters data on group of columns 

```
select sum(salary),department as sumof_salary from tbl_employee group by department;
or
select sum(salary),department from tbl_salesman group by department;
or
select sum(salary),department from tbl_salesman group by department where salary >28500;
or
select sum(salary),department from tbl_salesman  where department='HR' group by department;
or
select sum(salary) as total_sum_salary,department from tbl_salesman  where department='HR' group by department;

```

**having**

```
select  sum(salary) as sum_salary from tbl_salesman where age > 30 group by department having sum_salary > 50000;

or

select  sum(salary) as sum_salary from tbl_salesman  group by department having sum_salary > 50000;


```

# alias of column name or nickname of column name

1. alias is nick name of columns 

```
select count(empid) from tbl_salesman;
or
select count(empid) as numbers_of_employees from tbl_employee;
or
select count(id) as total_saleman from tbl_salesman
```

# SQL function :
1. SQL provides its inbuilt function
2. SQL is provides some inbuilt function to performed some specific task
3. SQL functions are 

- **Aggrigate function**

- sum()
- avg()
- count()
- max()
- min()

- **Scalar function**

- first()
- last()
- lcase()
- ucase()
- now()
- datetime()
- timestamp()


# SQL functions queries...

**aggrigate**

1. select sum(salary) as sum_of_salary from tbl_employee;
2. select avg(salary) as avg_of_salary from tbl_employee;   
3. select count(empid) as total_numbers_employee from tbl_employee;
4. select max(salary) as highest_salary from tbl_employee;
5. select min(salary) as minium_salary from tbl_employee;
or

1. select sum(salary) as sum_of_salary from tbl_salesman;
2. select avg(salary) as avg_of_salary from tbl_salesman;   
3. select count(empid) as total_numbers_employee from tbl_salesman;
4. select max(salary) as highest_salary from tbl_salesman;
5. select min(salary) as minium_salary from tbl_salesman;

**scalar**

1. select first(empid) from tbl_salesman;
2. select last(empid) from tbl_salesman;
3. select lcase(name) from tbl_salesman;
4. select ucase(name) from tbl_salesman;
6. select now(added_date_time) from tbl_employee;
7. select datetime(added_date_time) from tbl_employee;
8. select timestamp(added_date_time) from tbl_employee;

# subquery :  

1. subquery is used query within another query i.e called subquery

```
select max(salary) as second_highest_salary from tbl_salesman where salary < (select max(salary) from tbl_salesman)

or

SELECT MAX(salary) AS second_highest_salary FROM tbl_employee
WHERE salary < (SELECT MAX(salary) FROM tbl_employee WHERE salary < (SELECT MAX(salary) FROM tbl_employee where  salary < (select max(salary) from tbl_employee) ));

or 


SELECT MAX(salary) AS second_highest_salary FROM tbl_employee
WHERE salary < (SELECT MAX(salary) FROM tbl_employee WHERE salary < (SELECT MAX(salary) FROM tbl_employee where  salary < (select max(salary) from tbl_employee)));

or

select max(salary) from tbl_salesman where salary < (select max(salary) from tbl_salesman)

``` 

2. select * from tbl_employee order by salary desc limit 1,1;

3. select * from tbl_employee order by salary desc limit 2,1;   


# SQL like operator ? 

1. searching the data from tables via its **words** or **wildcard**
2. searching data from tables used like 

```
select * from tbl_employee where name like 't%';
or
select * from tbl_salesman where name like 'k%';
or
select * from tbl_employee where name like '%h';
or
select * from tbl_salesman where name like '%h';
or
select * from tbl_employee where name like '%a%';
or
select * from tbl_salesman where name like '%a%';
or 
select * from tbl_employee where name like '%r' or name like '%h';
or
select * from tbl_salesman where name like 'a%' or name like 'k%';

```

# SQL key constraints

1. SQL key constraints are set a limit on tables 
2. SQL key constraints are 3 types in SQL

- primary key 
- unique key
- foreign key

## primary key : 

1. A pk is provides unique data
2. A pk always should be auto_increment with primary key
3. A pk only provides one time in a tables 
4. A pk never return null values 
5. A pk never return dublicate values

**users**


|   id(pk)    |    name   |   age    |  address |
|-------------|-----------|----------|----------|
|    1        |   Brijesh |    27    |  rjt     |
|    2        |   Jay     |    22    |  ahmd    |

```
create table tbl_department(
depid int auto_increment primary key,
depname varchar(255)
)


```

## unique key : 

1. A uk is provides unique data on tables
2. A uk never return a dublicate data
3. A uk provides more than one columns in a tables 
4. A uk return one time a null value 


**tbl_users**

|   id(pk)    |    name   |   age    |  address |  phone(uk) |   email(uk)  |
|-------------|-----------|----------|----------|------------|--------------|               
|    1        |   Brijesh |    27    |  rjt     | 915455444  | brijesh@email.com |
|    2        |   Jay     |    22    |  ahmd    | 912121212  | jay@email.com |

```
alter table tbl_users add UNIQUE(`phone`)
or
alter table tbl_users add UNIQUE(`email`,`mobile`);

```

## foreign key 

1. A fk is provides for relationship b/w tables
2. A fk  return a dublicate data
3. A fk provides more than one columns in a tables 
4. A fk provides for relationship b/w tables with common field 


**tbl_students**

|   stid(pk)    |    name   |   age    |  address |  phone(uk)|  fid(fk) |
|-------------|-----------|----------|----------| -----------|-----------|
|    1        |   bhavesh |    27    |  rjt     | 915455444  |   1       | 
|    2        |   Jay     |    22    |  ahmd    | 912121212  |   1       |


**tbl_faculty**

|   fid(pk)    |    fname   |   lname |  address| 
|-------------|-----------|----------|----------|               
|    1        |   Brijesh |    27    |  rjt     |
|    2        |   Mitesh  |    22    |  ahmd    |           


**tbl_category**

|   catid(pk) | catname       | 
|-------------|---------------|               
|    1        |   electronics |
|    2        |   furnitures  | 


**tbl_products**

|   pid(pk)    |    pname   |   price  |  catid(fk) |
|-------------|-----------|----------|--------------|
|   1        |   mobile   |    15000 |     1        |
|   2        |   table    |    5000  |     2        |
|   3        |   laptop   |    45000 |     1        |
|   4         |   chair   |    2000 |     2         | 


**examples**

```
create table tbl_categories(
catid int AUTO_INCREMENT primary key,
catname varchar(255)
)

or

create table tbl_products   (   
pid int AUTO_INCREMENT primary key,
pname varchar(255),
price int,
catid int,
constraint catid foreign key(catid) references tbl_categories(catid)
)

```

# what is SQL join ? 

1. SQL join is used to join two or more than two tables
2. SQL join is used to fetch data from two or more than two tables
3. SQL join is used to provide relationship b/w tables
4. SQL join is used to fetch data from tables using common field and used to join with matched field of tables
5. SQL join are used to join data with matched field of tables and return data from tables

## types of SQL join

1. inner join
2. join 
3. ouster join
- left join
- right join
- full join(not supported in mysql) or union join 
4. self join
5. cross join

**1. inner join :**

- inner join is used to fetch data from two or more than two tables with matched field of tables and return only matched data from tables 

**syntax**

```
select tbl_products.pname,tbl_products.price,tbl_categories.catname from tbl_products inner join tbl_categories on tbl_products.catid=tbl_categories.catid;
or
select tbl_products.*, catname from tbl_products inner join tbl_categories on tbl_products.catid=tbl_categories.catid;

or

select pid,pname,price,catname from tbl_products inner join tbl_categories on tbl_products.catid=tbl_categories.catid;

```


**2.  join :**

- join is used to fetch data from two or more than two tables with matched field of tables and return only matched data from tables 

**syntax**

```
select tbl_products.pname,tbl_products.price,tbl_categories.catname from tbl_products  join tbl_categories on tbl_products.catid=tbl_categories.catid;
or
select tbl_products.*, catname from tbl_products  join tbl_categories on tbl_products.catid=tbl_categories.catid;

or

select pid,pname,price,catname from tbl_products  join tbl_categories on tbl_products.catid=tbl_categories.catid;

or

select tbl_products.*,catname from tbl_products join tbl_categories on tbl_products.catid=tbl_categories.catid; 
```

**3 - outer join :**

**left join :**

left join is used to fetch data from two or more than two tables with matched field of tables and return all data from left table and matched data from right table


```
select tbl_products.pname,tbl_products.price,tbl_categories.catname from tbl_products  left join tbl_categories on tbl_products.catid=tbl_categories.catid;
or
select tbl_products.*, catname from tbl_products  left join tbl_categories on tbl_products.catid=tbl_categories.catid;

or

select pid,pname,price,catname from tbl_products  left join tbl_categories on tbl_products.catid=tbl_categories.catid;

```

**right join :**

right join is used to fetch data from two or more than two tables with matched field of tables and return all data from right table and matched data from left table


```
select tbl_products.pname,tbl_products.price,tbl_categories.catname from tbl_products  right join tbl_categories on tbl_products.catid=tbl_categories.catid;
or
select tbl_products.*, catname from tbl_products  right join tbl_categories on tbl_products.catid=tbl_categories.catid;

or

select pid,pname,price,catname from tbl_products  right join tbl_categories on tbl_products.catid=tbl_categories.catid;

```
**union join**

```
select tbl_products.pname,tbl_products.price,tbl_categories.catname from tbl_products  left join tbl_categories on tbl_products.catid=tbl_categories.catid
UNION
select tbl_products.pname,tbl_products.price,tbl_categories.catname from tbl_products  right join tbl_categories on tbl_products.catid=tbl_categories.catid;

```
4. **self join**:

self join is used to join a table with itself and return data from same table with matched field of tables

**examples**

```
select e.empid,e.name as employee_name,m.name as manager_name from employee e  join employee m on e.manager_id=m.empid;

or

select e.empid,e.name as employee_name,m.name as manager_name from employee e inner join employee m on e.manager_id=m.empid;


```

**cross join** : 

1. cross join are used to join two tables or more than two tables of cross of rows either data matched or not its return a dublicate repeated data.

```
select * from tbl_products cross join tbl_categories;

```


**TCL : transaction control language**

1. save point
2. commit
3. rollback

1. save point : 

```
save point is used to saved interanal trnsaction after delete a query
examples :
start transaction;
delete from tbl_employee where empid=1;
save point
```


2. commit : 

```
commit  is used to commit or save deleted data
examples :
start transaction;
delete from tbl_employee where empid=1;
commit;
```

3. rollback :

```
rollback is rollback deleted data or undo the deleted data you can see deleted data after rollback
examples :
start transaction;
delete from tbl_employee where empid=1;
select * from tbl_employee where empid=1;
rollback;
select * from tbl_employee where empid=1;

or
start transaction;
delete from tbl_salesman where id=1;
select * from tbl_salesman where id=1;
rollback;
select * from tbl_salesman where id=1;
```

## what is SQL index or indexer ? 

1. index are created for SQL query speed optimization of data
2. SQL indexer is used to fast look ups data from tables 
3. indexer create for  speed optimizations

## how to create indexer or types of indexer ?

1. single column indexer

```
create index indexname on tablename columnname1;
or
create index indexsalesman on tbl_salesman (salary);
```
2. composit indexer 

```
create index indexsalesman1 on tbl_salesman (id,name,salary);
```


# what is SQL view  ?

1. create a SQL view it meanse it create virtual tables of your main tables
2. create a SQL view for hide some data from some users the we create a view

**syntax**

```
create view viename as select columname1, columname2, ...from tablename where id=1;
or
create view tbl_salesman_view as select id,name,mobile from tbl_salesman where id in (1,3,4);


```

# note : after create view we can insert | delete | update any data with sal query  

1. update tbl_salesman_view set mobile=888853656 where name='khushali'
2. delete from tbl_salesman_view where name='khushali';
3. insert into tbl_salesman_view(name,mobile) values('prakruti',9122312135),('sanket',78460166)


**case one**

1. check multiples case using case when 

```
select name,salary , case 
when salary >=25000 then 'Higher earner'
when salary >=10000 then 'medium earner'
else 'lower earner'
end as salary_earner from tbl_salesman

```
# Connect SQL with Excel #


# what is SQL windows function  ?
- windows functions are used to applied calculations and add unique rows in a tables there we use windows function
- windows function are used to add or set rows related to the current row without grouping the result into single row
  
# types of windows functions #
-row_number().
-rank().
-dense rank().
-NtiLE().
-LAG().
-LEAD().
-first_value().
-last_value().
-sum() -> over().
-avg() -> over().
-count() -> over().
-max() > over().
-min() -> over(). 
 ** EXAMPLES **
 1. row_number : Assign a real number to each row 
```````
select name,salary,row_number() over (order by salary desc) from tbl_salesman
```````
2. rank : Provides ranking with gaps for duplicate  values
   ````````
   select name,salary,rank() over(order by salary desc) from tbl_salesman
   ````````
3. dense_rank : Provides ranking without gaps for duplicate values
   `````````
   select name,salary,dense_rank() over(order by salary desc) from tbl_salesman
   `````````
4. NTILE() : Provides rows into equal groups
   `````````
   select name,salary,NTILE(3) over(order by salary desc) from tbl_salesman
   `````````
5. LAG() : Return previous Row/Value
   `````````
   select name,salary,LAG(SALARY,1) over(order by salary desc) AS previous_row from tbl_salesman 
   `````````
6. LEAD() : Return next Row/Value
   `````````
   select name,salary,LEAD(SALARY,1) over(order by salary desc) AS next_salary from tbl_salesman
   `````````
7. first_value : Return first value in windows 
   `````````
   select name,salary,first_value(salary) over(order by salary desc) from tbl_salesman
   `````````
8. last_value : Return last value in windows 
   `````````
   select name,salary,last_value(salary) over(order by salary desc) from tbl_salesman
   `````````
9. sum() over() : running with total windows/cummulative
   `````````
   select name,salary,sum(salary) over(order by salary) from tbl_salesman
   `````````
10. avg() over() : running with total average
   `````````
   select name,salary,avg(salary) over() from tbl_salesman
   `````````
11. count() over() : running with total count
   `````````
   select name,salary,count(salary) over() from tbl_salesman
   `````````
12. max() over() : Return maximum value in windows
   `````````
     select name,salary,min(salary) over() from tbl_salesman
          or
   select name,salary,max(salary) over(order by salary) from tbl_salesman
   `````````
13. min() over() : Return minimum value in windows
   `````````
   select name,salary,min(salary) over() from tbl_salesman
            or 
   select name,salary,min(salary) over(order by salary) from tbl_salesman
   `````````
# what is CTE or WITH Clause in SQL ? #
 CTE : It stand for Common Table Expression
 -  Defines a Temporary Result set that can be used within a query
 -  It simplifies complex SQL statements making them easier to read/manage and reuse it using WITH clause

   ** QUERY **
   ````````
    WITH HighSalary AS
(
    SELECT ENAME, SAL
    FROM EMP
    WHERE SAL > 40000
)
SELECT *
FROM HighSalary;
   ````````
    







