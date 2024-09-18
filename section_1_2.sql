create database dac_dbt;
use dac_dbt;
create table dept
(deptcode varchar(15),
deptname varchar(60), 
budget int);

create table grade(
gradecode varchar(15),
gradelevel varchar(30),
gradedescription varchar(60),
basic int);

create table desig(
desigcode varchar(15),
designame varchar(15));

create table emp(
empcode varchar(15),
empname varchar(60),
deptcode varchar(15),
birthdate date not null,
joindate date not null,
sex char(1),
check (sex in ('M','F','T')),
desigcode varchar(15),
supcode varchar(15),
gradecode varchar(15),
gradelevel varchar(30),
basicpay int);

create table salary(
empcode varchar(15), 
salmonth date not null,
basic numeric,
allow numeric,
deduct numeric);

create table history(
empcode varchar(15),
changedate date not null,
desigcode varchar(15),
gradecode varchar(15),
gradelevel varchar(30),
basicpay int);

alter table dept modify deptcode varchar(15) primary key;
alter table desig modify desigcode varchar(15) primary key;
alter table emp modify empcode varchar(15) primary key;
alter table salary add primary key (empcode, salmonth);
alter table history add primary key (empcode, changedate, desigcode, gradecode, gradelevel);
alter table grade add primary key (gradecode, gradelevel);

alter table emp add foreign key(deptcode) references dept(deptcode);
alter table emp add foreign key(desigcode) references desig(desigcode);
alter table emp add foreign key(supcode) references emp(empcode);
alter table emp add foreign key(gradecode,gradelevel) references grade(gradecode,gradelevel);
alter table history add foreign key(empcode) references emp(empcode);
alter table history add foreign key(desigcode) references desig(desigcode);
alter table history add foreign key(gradecode, gradelevel) references grade(gradecode,gradelevel);
alter table salary add foreign key(empcode) references emp(empcode);

insert into dept values
('ACCT', 'Accounts', 19),
('PRCH', 'Purchase', 25),
('SALE', 'Sales', 39),
('STOR', 'Stores', 33),
('FACL', 'Facilities', 42),
('PERS', 'Personal', 12);

insert into grade values
('GC1', 'GL1', 'GC-GL-1', 25000),
('GC4', 'GL1', 'GC-4-GL-1', 21000),
('GC4', 'GL4', 'GC-4-GL-4', 15000),
('GC6', 'GL1', 'GC-6-GL-1', 13000),
('GC6', 'GL2', 'GC-6-GL-2', 11000),
('GC12', 'GL1', 'GC-12-GL-1', 9000),
('GC12', 'GL2', 'GC-12-GL-2', 8500),
('GC12', 'GL3', 'GC-12-GL-3', 8000),
('GC15', 'GL1', 'GC-15-GL-1', 7000),
('GC15', 'GL2', 'GC-15-GL-2', 6500),
('GC15', 'GL3', 'GC-15-GL-3', 6000),
('GC20', 'GL1', 'GC-20-GL-1', 3500),
('GC20', 'GL2', 'GC-20-GL-2', 3000),
('GC20', 'GL3', 'GC-20-GL-3', 2500),
('GC20', 'GL4', 'GC-20-GL-4', 2000);

insert into desig values
('CLRK', 'Clerk'),
('SLMN', 'Sales Man'),
('MNGR', 'Manager'),
('SPRV', 'Supervisor'),
('PRES', 'Personal');

insert into emp
(empcode,empname,deptcode,birthdate,joindate,sex,desigcode,supcode,gradecode,gradelevel,basicpay)
 values 
 ('7839', 'Reddy', 'ACCT', '1959-12-12', '1981-07-17', 'M', 'PRES', null, 'GC1', 'GL1', 32000),
('7566', 'Jain', 'PRCH', '1955-01-24', '1981-04-02', 'F', 'MNGR', '7839', 'GC6', 'GL2', 12400),
('7698', 'Murthy', 'SALE', '1960-09-16', '1981-05-01', 'F', 'MNGR', '7839', 'GC6', 'GL1', 14700),
('7782', 'Menon', 'ACCT', '1967-08-30', '1981-06-09','M', 'MNGR', '7839', 'GC6', 'GL2', 12400),
('7902', 'Naik', 'PRCH', '1958-02-20', '1981-12-03', 'M', 'MNGR', '7839', 'GC6', 'GL2', 11800),
('7654', 'Gupta', 'SALE', '1957-01-22', '1981-09-28', 'M', 'SLMN', '7698', 'GC6', 'GL2', 12600),
('7521', 'Wilson', 'STOR', '1956-03-18', '1981-02-22', 'M', 'MNGR', '7698', 'GC6', 'GL2', 12200),
('7844', 'Singh', 'SALE', '1956-09-09', '1981-09-08', 'F', 'SLMN', '7698', 'GC6', 'GL1', 14300),
('7900', 'Shroff', 'SALE', '1956-06-28', '1981-12-03', 'M', 'CLRK', '7698', 'GC6', 'GL2', 12000),
('7788', 'Khan', 'PRCH', '1957-02-03', '1982-12-09', 'M', 'SPRV', '7566', 'GC6', 'GL2', 11900),
('7499', 'Roy', 'SALE', '1957-09-27', '1981-02-20', 'M', 'SLMN', '7698', 'GC6', 'GL1', 14200),
('7934', 'Kaul', 'ACCT', '1957-05-02', '1982-01-23', 'M', 'CLRK', '7782', 'GC6', 'GL2', 11950),
('7369', 'Shah', 'PRCH', '1960-05-25','1983-12-17', 'M', 'CLRK', '7902', 'GC6', 'GL2', 12200),
('7876', 'Patil', 'PRCH', '1965-09-02', '1990-12-17', 'M', 'CLRK', '7788', 'GC6', 'GL2', 12300),
('7999', 'Sinha', 'SALE', '1970-04-11', '1992-02-20', 'M', 'SLMN', '7782', 'GC6', 'GL1', 14600),
('7939', 'Rai', 'PRCH', '1988-08-10', '2012-12-06', 'M', 'CLRK', '7782', 'GC6', 'GL2', 11800),
('7192', 'John', 'ACCT', '1968-11-05', '1994-12-03', 'M', 'CLRK', '7902', 'GC6', 'GL2', 12300),
('9902', 'Ahmad', 'SALE', '1970-02-16', '1992-04-17', 'M', 'SLMN', '7698', 'GC6', 'GL1', 14200),
('7802', 'Sanghvi','STOR', '1980-05-06', '1993-01-01', 'M', 'MNGR', '7566', 'GC6', 'GL2', 12400),
('6569', 'Tiwari', 'STOR', '1989-08-19', '2010-08-21', 'M', 'MNGR', '7782', 'GC6', 'GL2', 12400);

insert into salary
(empcode,salmonth,basic,allow,deduct) values
('7839', '2011-12-01', 30000, 3000, 1200),
('7839', '2012-01-01', 32000, 3200, 1250),
('7839', '2012-02-01', 32000, 3200, 1250),
('7566', '2011-12-01', 12000, 600, 400),
('7566', '2012-01-01', 12400, 1240, 550),
('7566', '2012-02-01', 12400, 1240, 550),
('7698', '2011-12-01', 13900, 800, 500),
('7698', '2012-01-01', 14700, 1470, 650),
('7698', '2012-02-01', 14700, 1470, 650),
('7782', '2011-12-01', 11800, 600, 500),
('7782', '2012-01-01', 12400, 1240, 550),
('7782', '2012-02-01', 12400, 1240, 550),
('7902', '2011-12-01', 11200, 600, 450),
('7902', '2012-01-01', 11800, 1180, 550),
('7902', '2012-02-01', 11800, 1180, 550),
('7654', '2011-12-01', 11900, 700, 500),
('7654', '2012-01-01', 12600, 1260, 550),
('7654', '2012-02-01', 12600, 1260, 550),
('7521', '2011-12-01', 11400, 800, 500),
('7521', '2012-01-01', 12200, 1220, 550),
('7521', '2012-02-01', 12200, 1220, 550),
('7844', '2011-12-01', 13400, 900, 600),
('7844', '2012-01-01', 14300, 1430, 650),
('7844', '2012-02-01', 14300, 1430, 650),
('7900', '2011-12-01', 11500, 500, 300),
('7900', '2012-01-01', 12000, 1200, 550),
('7900', '2012-02-01', 12000, 1200, 550),
('7788', '2011-12-01', 11300, 600, 450),
('7788', '2012-01-01', 11900, 1190, 550),
('7788', '2012-02-01', 11900, 1190, 550),
('7499', '2011-12-01', 13400, 800, 550),
('7499', '2012-01-01', 14200, 1420, 650),
('7499', '2012-02-01', 14200, 1420, 650),
('7934', '2011-12-01', 11450, 500, 250),
('7934', '2012-01-01', 11950, 1195, 550),
('7934', '2012-02-01', 11950, 1195, 550),
('7369', '2011-12-01', 11600, 600, 450),
('7369', '2012-01-01', 12200, 1220, 550),
('7369', '2012-02-01', 12200, 1220, 550),
('7876', '2011-12-01', 11700, 600, 500),
('7876', '2012-01-01', 12300, 1230, 550),
('7876', '2012-02-01', 12300, 1230, 550),
('7999', '2011-12-01', 13950, 650, 600),
('7999', '2012-01-01', 14600, 1460, 650),
('7999', '2012-02-01', 14600, 1460, 650),
('7939', '2011-12-01', 11100, 700, 400),
('7939', '2012-01-01', 11800, 1180, 550),
('7939', '2012-02-01', 11800, 1180, 550),
('7192', '2011-12-01', 11700, 600, 500),
('7192', '2012-01-01', 12300, 1230, 550),
('7192', '2012-02-01', 12300, 1230, 550),
('9902', '2011-12-01', 13400, 800, 500),
('9902', '2012-01-01', 14200, 1420, 650),
('9902', '2012-02-01', 14200, 1420, 650),
('7802', '2011-12-01', 11900, 500, 300),
('7802', '2012-01-01', 12400, 1240, 550),
('7802', '2012-02-01', 12400, 1240, 550),
('6569', '2011-12-01', 11800, 600, 400),
('6569', '2012-01-01', 12400, 1240, 550);

insert into history 
(empcode,changedate,desigcode,gradecode,gradelevel,basicpay) values 
( '7839', '1981-09-17', 'CLRK', 'GC15','GL1', 7000),
( '7839', '1985-12-31', 'SLMN', 'GC12','GL3', 8000),
( '7839', '1988-12-31', 'SPRV', 'GC12','GL2', 8500),
( '7839', '1990-12-31', 'MNGR', 'GC12','GL1', 9000),
( '7839', '1994-12-31', 'CLRK', 'GC6', 'GL2', 11000),
( '7839', '1998-12-31', 'SLMN', 'GC6', 'GL1', 13000),
( '7839', '2001-12-31', 'SPRV', 'GC4', 'GL4', 15000),
( '7839', '2006-12-31', 'MNGR', 'GC4', 'GL1', 21000),
( '7839', '2011-12-31', 'PRES', 'GC1', 'GL1', 25000),
( '7566', '1981-04-02', 'CLRK', 'GC12','GL3', 8000),
( '7566', '1991-12-31', 'SLMN', 'GC12','GL2', 8500),
( '7566', '2001-12-31', 'SPRV', 'GC12','GL1', 9000),
( '7566', '2011-12-31', 'MNGR', 'GC6', 'GL2', 11000),
( '7698', '1981-05-01', 'CLRK', 'GC12','GL3', 8000),
( '7698', '1991-05-01', 'SLMN', 'GC12','GL2', 8500),
( '7698', '2001-05-01', 'MNGR', 'GC12','GL1', 9000),
( '7698', '2006-05-01', 'SPRV', 'GC6', 'GL2', 11000),
( '7698', '2011-05-01', 'MNGR', 'GC6', 'GL1', 13000),
( '7782', '1981-06-09', 'CLRK', 'GC12','GL3', 8000),
( '7782', '1991-06-09', 'SLMN', 'GC12','GL2', 8500),
( '7782', '2001-06-09', 'SPRV', 'GC12','GL1', 9000),
( '7782', '2011-06-09', 'MNGR', 'GC6', 'GL2', 11000),
( '7902', '1981-12-03', 'CLRK', 'GC12','GL3', 8000),
( '7902', '1991-12-03', 'SLMN', 'GC12','GL2', 8500),
( '7902', '2001-12-03', 'SPRV', 'GC12','GL1', 9000),
( '7902', '2011-12-03', 'MNGR', 'GC6', 'GL2', 11000),
( '7654', '1981-09-28', 'SLMN', 'GC12','GL3', 8000),
( '7654', '1991-09-28', 'SLMN', 'GC12','GL2', 8500),
( '7654', '2001-09-28', 'SLMN', 'GC12','GL1', 9000),
( '7654', '2011-09-28', 'SLMN', 'GC6', 'GL2', 11000),
( '7521', '1981-02-22', 'CLRK', 'GC12','GL3', 8000),
( '7521', '1991-02-22', 'SLMN', 'GC12','GL2', 8500),
( '7521', '2001-02-22', 'SPRV', 'GC12','GL1', 9000),
( '7521', '2011-02-22', 'MNGR', 'GC6', 'GL2', 11000),
( '7844', '1981-09-08', 'SLMN', 'GC12','GL3', 8000),
( '7844', '1991-09-08', 'SLMN', 'GC12','GL2', 8500),
( '7844', '2001-09-08', 'SLMN', 'GC12','GL1', 9000),
( '7844', '2006-09-08', 'SLMN', 'GC6', 'GL2', 11000),
( '7844', '2011-09-08', 'SLMN', 'GC6', 'GL1', 13000),
( '7900', '1981-12-03', 'SLMN', 'GC12','GL3', 8000),
( '7900', '1991-12-03', 'SLMN', 'GC12','GL2', 8500),
( '7900', '2001-12-03', 'CLRK', 'GC12','GL1', 9000),
( '7900', '2011-12-03', 'CLRK', 'GC6', 'GL2', 11000),
( '7788', '1982-12-09', 'SLMN', 'GC12','GL3', 8000),
( '7788', '1992-12-09', 'CLRK', 'GC12','GL2', 8500),
( '7788', '2002-12-09', 'MNGR', 'GC12','GL1', 9000),
( '7788', '2012-12-09', 'SPRV', 'GC6', 'GL2', 11000),
( '7499', '1981-02-20', 'SLMN', 'GC12','GL3', 8000),
( '7499', '1991-02-20', 'SLMN', 'GC12','GL2', 8500),
( '7499', '2001-02-20', 'SLMN', 'GC12','GL1', 9000),
( '7499', '2006-02-20', 'SLMN', 'GC6', 'GL2', 11000),
( '7499', '2011-02-20', 'SLMN', 'GC6', 'GL1', 13000),
( '7934', '1982-01-23', 'SLMN', 'GC12','GL3', 8000),
( '7934', '1992-01-23', 'SLMN', 'GC12','GL2', 8500),
( '7934', '2002-01-23', 'CLRK', 'GC12','GL1', 9000),
( '7934', '2012-01-23', 'CLRK', 'GC6', 'GL2', 11000),
( '7369', '1983-12-17', 'SLMN', 'GC12','GL3', 8000),
( '7369', '1993-12-17', 'SLMN', 'GC12','GL2', 8500),
( '7369', '2003-12-17', 'CLRK', 'GC12','GL1', 9000),
( '7369', '2006-12-17', 'CLRK', 'GC6', 'GL2', 11000);

#1
select empname as name, empcode as employeecode, desigcode as designation from emp;
#2
select * from dept;

#3
select emp.empname,dept.deptname from emp,dept where emp.deptcode = dept.deptcode;

#4
select * from emp where supcode is null;

#5
SELECT empname 
FROM emp 
WHERE supcode = (SELECT empcode FROM emp WHERE supcode IS NULL);

#6
select * from emp order by joindate ASC LIMIT 1;

#7
SELECT empname 
FROM emp 
ORDER BY birthdate ASC 
LIMIT 1;

#8
SELECT emp.empcode, emp.empname, dept.deptname, desig.designame
FROM emp
JOIN desig ON emp.desigcode = desig.desigcode
join dept on emp.deptcode = dept.deptcode
WHERE desig.designame = 'Manager';

#9
select emp.empcode, emp.empname,emp.desigcode
from emp
where emp.desigcode = (select desig.desigcode 
						from desig,dept
						where desig.designame = "Manager" 
                        limit 1);
                        
select emp.empcode, emp.empname, desig.designame, dept.deptname
from emp
join desig on emp.desigcode = desig.desigcode
join dept on emp.deptcode = dept.deptcode
where desig.designame = 'Manager';

#10
select count(emp.empcode)
from emp
join dept on emp.deptcode = dept.deptcode 
where dept.deptname ='accounts' || dept.deptname = 'personal' || dept.deptname = 'purchase';

#11
select emp.empcode, emp.empname, dept.deptname
from emp
join dept on emp.deptcode = dept.deptcode 
where dept.deptname ='accounts' || dept.deptname = 'personal';

#12
select emp.empcode, emp.empname, dept.deptname
from emp
join dept on emp.deptcode = dept.deptcode 
where dept.deptname ='accounts' and dept.deptname = 'personal';

#13
select emp.empcode, emp.empname, dept.deptname
from emp
join dept on emp.deptcode = dept.deptcode 
where dept.deptname ='accounts' and dept.deptname <> 'personal';

#14
select *
from emp
order by emp.birthdate desc limit 1;

#15
select * from emp
where emp.basicpay <> 12400;

#16 
select * from emp
where emp.basicpay between 11000 and 12000;

#17
select * from emp
where emp.basicpay not between 11000 and 12000;

#18
select emp.empcode, emp.empname,salary.salmonth, salary.allow
from emp
join salary on emp.empcode = salary.empcode
where salary.salmonth between '2012-01-01' and '2012-01-31' 
		and salary.allow between 1000 and 1500;

#19
select * from emp
where emp.empname like '%i'or emp.empname like '%y';

#20
#TIMESTAMPDIFF(YEAR, emp.joindate, CURDATE())
select *,TIMESTAMPDIFF(YEAR, emp.joindate, CURDATE()) as years_exp from emp
where TIMESTAMPDIFF(YEAR, emp.joindate, CURDATE()) > 25;

#21
#TIMESTAMPDIFF(YEAR, emp.joindate, CURDATE()) as 'years of exp'
select * from emp
join desig on emp.desigcode  = desig.desigcode
where desig.designame = 'Sales Man'
and TIMESTAMPDIFF(YEAR, emp.joindate, CURDATE()) between 20 and 30;

#22
select emp.empname,salary.salmonth, salary.basic, round(basic/2) as half_salary 
from emp
join salary
#on emp.empcode = salary.empcode
where emp.empcode = salary.empcode;
#group by emp.empcode;

#23
select emp.empname, salary.basic + salary.allow - salary.deduct as take_home_pay, salary.salmonth
from emp
join salary on emp.empcode = salary.empcode
join (
    select empcode, MAX(salmonth) as latest_month
    from salary
    group by empcode
) latest_salaries ON salary.empcode = latest_salaries.empcode AND salary.salmonth = latest_salaries.latest_month
ORDER BY emp.empname;
#order by salary.salmonth desc

#another code
WITH LatestSalaries AS (
    SELECT empcode, MAX(salmonth) AS latest_month
    FROM salary
    GROUP BY empcode
)
SELECT emp.empname, salary.basic + salary.allow - salary.deduct AS take_home_pay, salary.salmonth
FROM emp
JOIN salary ON emp.empcode = salary.empcode
JOIN LatestSalaries ON salary.empcode = LatestSalaries.empcode AND salary.salmonth = LatestSalaries.latest_month
ORDER BY emp.empname;

#24
select emp.empname, salary.basic + salary.allow - salary.deduct as take_home_pay
from emp
join salary on emp.empcode = salary.empcode
join dept on emp.deptcode = dept.deptcode where dept.deptname ='Accounts';

#25
select emp.empname, TIMESTAMPDIFF(YEAR, emp.birthdate, CURDATE()) as age
from emp;

#26
select emp.empname, dept.deptname as department_name,TIMESTAMPDIFF(YEAR, emp.birthdate, CURDATE()) as age
from emp
join dept on emp.deptcode = dept.deptcode
where dept.deptname = 'Accounts'
order by TIMESTAMPDIFF(YEAR, emp.birthdate, CURDATE()) asc, emp.empname asc;

#27
-- wrong code
select count(emp.empcode) as reporting from emp
join grade on emp.gradelevel = grade.gradelevel
where emp.empname = 'Reddy';

-- correct code
select e.supcode,m.empname,count(m.empcode) as num_employees
from emp as e
join emp as m on e.supcode = m.empcode
where m.empname = 'Reddy'
group by e.supcode, m.empname;

-- another code with list of employees
select e.supcode,e.empname,m.empname as num_employees
from emp as e
join emp as m on e.supcode = m.empcode
where m.empname = 'Reddy';

-- another code
select count(*) from emp as e
join emp as m
on e.empcode  = m.empcode 
where e.supcode = (select empcode from emp where empname = 'Reddy');

-- another code
select count(*) from emp as e
join emp as m
on e.empcode  = m.empcode 
where e.supcode = (select empcode from emp where empname = 'Reddy');

#28
select e.supcode,m.empname,count(m.empcode) as num_employees
from emp as e
join emp as m on e.supcode = m.empcode
group by e.supcode, m.empname
order by num_employees desc;

#29
select e.supcode,m.empname,count(m.empcode) as num_employees
from emp as e
join emp as m on e.supcode = m.empcode
group by e.supcode, m.empname
having num_employees > 3
order by num_employees desc;

#30
#dout in the question
select 
    g.gradecode,
    g.gradedescription,
    MIN(e.basicpay) as min_salary,
    MAX(e.basicpay) as max_salary
from emp e
join grade g on e.gradecode = g.gradecode
group by g.gradecode, g.gradedescription;

#31
select e.empname, m.empname as supervisors
from emp as e
join emp as m 
on e.supcode = m.empcode;

#32
select e.supcode,m.empname,count(m.empcode) as num_employees
from emp as e
join emp as m on e.supcode = m.empcode
group by e.supcode, m.empname
having num_employees > 3
order by num_employees desc;

#33
SELECT empname 
FROM emp 
WHERE empcode NOT IN (SELECT DISTINCT empcode FROM history);

#34
SELECT empcode, COUNT(*) AS promotions 
FROM history 
GROUP BY empcode 
ORDER BY promotions DESC 
LIMIT 1;

#35
SELECT empname 
FROM history 
JOIN emp ON history.empcode = emp.empcode 
WHERE YEAR(changedate) = 1991;

#36
select dept.deptname, dept.budget, sum(emp.basicpay) as total_salary
from emp
join dept 
on emp.deptcode = dept.deptcode
group by dept.deptcode;

#37
select upper(emp.empname) from emp;

#38
select e.empname, e.empcode, e.basicpay
from emp as e
join emp as m
where m.empname = 'Jain' and m.basicpay < e.basicpay; 

#39
SELECT empname 
FROM emp 
WHERE basicpay > (SELECT MAX(basicpay) FROM emp WHERE basicpay BETWEEN 11000 AND 12000);

#another answer
select * from emp
where basicpay > 12000;

#40
select e.empcode, e.empname, e.basicpay
from emp as e 
join emp as m
where e.basicpay > avg(m.basicpay)1
-- wrong code

select e.empcode, e.empname, e.basicpay
from emp as e
join (
	 select avg(basicpay) as avg_basicpay
     from emp)
m -- second nested query value assign 
on  e.basicpay > m.avg_basicpay
order by e.basicpay desc;

#41
select e.empcode, e.empname, e.basicpay
from emp as e
join (
	 select max(basicpay) as highest
     from emp)
m -- second nested query value assign 
on  e.basicpay = m.highest;

#42
select e.empcode, e.empname, e.basicpay
from emp as e
join (
	 select max(basicpay) as highest
     from emp)
m -- second nested query value assign 
on  e.basicpay <> m.highest;

#43
select d.deptname, e.empname, e.basicpay
from emp e
join dept d on d.deptcode = e.deptcode
where e.basicpay = (
    select MAX(e2.basicpay)
    from emp e2
    where e2.deptcode = e.deptcode
);

#44
select e.empcode, e.empname, e.basicpay
from emp as e
join (
	 select max(basicpay) as highest
     from emp)
m -- second nested query value assign 
on  e.basicpay <> m.highest
order by e.basicpay desc limit 1;

select e.empname, e.empcode, e.basicpay 
from emp as e
order by e.basicpay desc limit 1 offset 1;


WITH RankedSalaries AS (
    SELECT e.empname, e.empcode, e.basicpay,
           ROW_NUMBER() OVER (ORDER BY e.basicpay DESC) AS rn
    FROM emp e
)
SELECT empname, empcode, basicpay
FROM RankedSalaries
WHERE rn = 2;
select e.empname, e.basicpay from emp as e
where 1-1 = (select count(distinct(m.basicpay)) from emp as m
where m.basicpay > e.basicpay);

select e.empname, e.basicpay from emp as e
where 2-1 = (select count(distinct(m.basicpay)) from emp as m
where m.basicpay > e.basicpay);


#45
select e.empname, e.basicpay from emp as e
where 5-1 = (select count(distinct(m.basicpay)) from emp as m
where m.basicpay > e.basicpay);

#46
select e.empname, e.empcode, e.sex, e.basicpay 
from emp as e
where e.basicpay = (select m.basicpay from emp as m  
					where m.sex = 'F' 
					order by m.basicpay desc limit 1);

#another code if not distinct value
select m.basicpay from emp as m  
					where m.sex = 'F' 
					order by m.basicpay desc limit 1;


#47
select e.empname, e.empcode, e.sex, e.basicpay, d.deptname 
from emp as e
join dept as d
on e.deptcode = d.deptcode
where e.sex = 'F'
order by e.basicpay desc limit 1;

#another code in case of distinct basicpay
select e.empname, e.empcode, e.sex, e.basicpay, d.deptcode 
from emp as e
join dept as d
on e.deptcode = d.deptcode
where e.basicpay = (select m.basicpay from emp as m  
					where m.sex = 'F' 
					order by m.basicpay desc limit 1);

#48
select e.empname, e.empcode, e.sex, e.basicpay, d.deptcode, m.empname as Manger
from emp as e
join emp as m 
on m.empcode = e.supcode
join dept as d
on e.deptcode = d.deptcode
where e.basicpay = (select m.basicpay from emp as m  
					where m.sex = 'F' 
					order by m.basicpay desc limit 1);
                    
#49
select e.empname, e.empcode, e.sex, e.basicpay 
from emp as e
where e.sex = 'M' and e.basicpay > (select m.basicpay from emp as m  
					where m.sex = 'F' 
					order by m.basicpay asc limit 1);
                    
#50
SELECT emp.empcode, emp.empname, dept.deptname, desig.designame
FROM emp
JOIN desig ON emp.desigcode = desig.desigcode
join dept on emp.deptcode = dept.deptcode
;

select emp.empcode, emp.empname, dept.deptname
from emp
join dept on emp.deptcode = dept.deptcode;

#wrong code above

select d.deptname , e.empname from dept d
join emp e on e.deptcode = d.deptcode
where e.basicpay/12 > (select avg(basicpay) from emp);

#51
select emp.empname,emp.basicpay
from emp where basicpay < (select avg(basicpay)
from emp,dept where deptname = 'Accounts'); 

select * from emp;
select * from dept;
select * from desig;
select * from salary;
select * from grade;
select * from history;