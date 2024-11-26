-- 1. Create a view to display number of employees working in each department. Display this 
-- view  
create view deptWiseEmp as
select dept.deptname , count(emp.empcode) as numberofemp
	from dept
    join emp
    on dept.deptcode = emp.deptcode
    group by dept.deptcode
    order by numberofemp desc;
    
select * from deptWiseEmp;

-- 2. List the employee with maximum number of promotions. Also list the number of 
-- promotions that he/she got.. 
SELECT empcode, COUNT(*) AS promotions 
FROM history 
GROUP BY empcode 
ORDER BY promotions DESC 
LIMIT 1;

-- 3. List the empcode, average take home pay and department name for those employees who 
-- are drawing salary lesser than the average salary of employees working for ‘accounts’ 
-- department




-- 4. List the supervisor code, supervisor name and number of subordinates for those 
-- supervisor who have minimum 3 employee working under him. 
    
select e.supcode, m.empname, count(m.empcode) as num_employees
	from emp as e
    join emp as m
    on e.supcode = m.empcode
    group by e.supcode, m.empname
    having num_employees >= 3
    order by num_employees desc;
    
-- 5. Create a procedure to count number of employee born in a particular year. Execute this 
-- function by passing an year 1970 
delimiter //
drop function if exists countEmpByYear//
create function countEmpByYear(year int)
returns int
deterministic
begin
	declare empcount int default 0;
    select count(*) into empcount
    from emp
    where year(birthdate) = year;
    return empcount;
end//

-- select countEmpByYear(1970)//

-- 6. Create a procedure to get maximum salary for a particular department. Use a variable 
-- grade to set the grade as A if max salary is more than 5000. Execute this procedure 

DELIMITER //

DROP PROCEDURE IF EXISTS maxSalaryGrade //

CREATE PROCEDURE maxSalaryGrade(IN deptName VARCHAR(50), OUT grade CHAR(1))
BEGIN
    DECLARE maxsalary INT; -- Declare a variable to store the maximum salary

    -- Get the maximum salary for the specified department
    SELECT MAX(emp.basicpay) INTO maxsalary
    FROM emp 
    JOIN dept
    ON emp.deptcode = dept.deptcode
    WHERE dept.deptname = deptName;

    -- Set the grade based on the maximum salary
    IF maxsalary > 5000 THEN
        SET grade = 'A';
    ELSE
        SET grade = 'B';
    END IF;
END //

DELIMITER ;


delimiter //
drop procedure if exists maxSalaryGrade //
create procedure maxSalaryGrade(in deptName varchar(50), out grade char(1))
begin
declare maxsalary int;
select max(emp.basicpay) into maxsalary
from emp 
join dept
on emp.deptcode = dept.deptcode and dept.deptname = deptName
group by emp.deptcode; 

if(maxsalary > 5000)
	then set grade = "A";
    else
		set grade = "B";
	end if;
end//

call maxSalaryGrade('Stores',@grade)//


-- select * from dept;
-- select * from grade;
-- select * from desig;
-- select * from emp;
-- select * from salary;
-- select * from history;
