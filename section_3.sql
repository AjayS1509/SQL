 -- 1 Write a view to compute the employee age of the organization
create view employee_age as 
select empname, timestampdiff(year, birthdate, curdate()) as age
from emp;

select * from employee_age;

-- 2 Write a view to compute the employee experience with the organization
create view experience as
select empname, timestampdiff(year, joindate, curdate()) as experience
from emp;

select * from experience; 

-- 3 Write a view that computes the employee pay for the current month for all the 
-- employees. Hint: Compute the employee pay as the Basic+Allowance-Deduction 
create view salary_emp as
select s.basic+ s.allow - s.deduct from
salary s;

select * from salary_emp; 


-- 4 List the employees who are older than their supervisors. Hint: Use views to 
-- implement employee age
-- wrong code reference with supcode and then compare with thier age
select 
	e.empcode,
	e.empname,
    e.supcode,
    timestampdiff(year, e.birthdate, curdate()) as emp_age,
    m.empname,
    timestampdiff(year, m.birthdate, curdate()) as superviser_age
    from emp as e
join emp as m
on m.empcode = e.supcode
where timestampdiff(year, e.birthdate, curdate()) > timestampdiff(year, m.birthdate, curdate());

-- correct code
create view employee_age_supervisor_comp as
select e.empcode,
	e.empname,
    e.supcode,
    timestampdiff(year, e.birthdate, curdate()) as emp_age
from emp as e
join emp as m
on timestampdiff(year, e.birthdate, curdate()) > timestampdiff(year, m.birthdate, curdate())
join desig 
on m.desigcode = desig.desigcode
where desig.designame = 'Supervisor';

select * from employee_age_supervisor_comp;

-- 5 Write a view to display the total number of employees in each department 
create view count_dept as
select deptname, count(e.empname)
from emp as e
join dept 
on e.deptcode = dept.deptcode
group by e.deptcode;

select * from count_dept;

-- 6  Write a view to display the total number of employees in the organization
create view count_total_emp as
select count(e.empcode)
from emp as e;

select * from count_total_emp;

-- 7 Use the views in Qn No 5 & Qn No 6, to display the percentage of employees in 
-- each department 
drop view dept_percentage;
create view dept_percentage as 
select deptname, count(e.empname) * 100 / (select * from count_total_emp) as percentage
from emp as e
join dept 
on e.deptcode = dept.deptcode
group by e.deptcode;

select * from dept_percentage;
    





select * from emp;
select * from dept;
select * from desig;
select * from salary;
select * from grade;
select * from history;