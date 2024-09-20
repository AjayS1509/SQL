-- Section -4
--  Index and temporary tables

-- 1. Create  emp_index on table emp on the field birthdate. 
create INDEX emp_index
on emp
(birthdate);

-- 2. Create unique index dept_index on table dept on the field deptname.
create unique Index dept_index
on dept (deptname);

-- 3. Create students table, with filed id, name, age, gender, index on id 
create table students(
id int primary key,
name varchar(12),
age int,
gender char(12)
);

create index student_id
on students (id);

-- 4. Drop index of table emp 
drop index emp_index on emp;

-- 5. Find all the index of table dept 
show index from dept;

-- 6. Create a temporary table student with field  with filed id, name, age, gender 
create temporary table students(
id int primary key,
name varchar(12),
age int,
gender char(12)
);

-- 7. Logout from session and login again to check if temporary table exists.

select* FROM STUDENTS;

-- 8. Create a temporary table test 
create temporary table test(
testid int primary key,
test varchar(20)
);


-- 9. Drop temporary table test

drop [temporary] table
[IF EXISTS] TEST
[,TEST][RESTRICT | CASCADE];

DROP TABLE IF exists TEST;