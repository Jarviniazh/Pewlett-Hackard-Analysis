select first_name, last_name
from employees
where birth_date between '1952-01-01' and '1955-12-31';

-- Retirement eligibility
select first_name, last_name
from employees
where (birth_date between '1952-01-01' and '1955-12-31')
	and (hire_date between '1985-01-01' and '1988-12-31');
	
-- Number of employees retiring
select count(first_name)
from employees
where (birth_date between '1952-01-01' and '1955-12-31')
	and (hire_date between '1985-01-01' and '1988-12-31');

-- Save data to a new table: retirement_info
select first_name, last_name
into retirement_info
from employees
where (birth_date between '1952-01-01' and '1955-12-31')
	and (hire_date between '1985-01-01' and '1988-12-31');
	
drop table retirement_info;

select * from retirement_info;

-- Create new table for retiring employees
select emp_no, first_name, last_name
into retirement_info
from employees
where (birth_date between '1952-01-01' and '1955-12-31')
	and (hire_date between '1985-01-01' and '1988-12-31');

--check the table
select * from retirement_info;

-- Joining departments and dept_manager tables
select departments.dept_name,
	dept_manager.emp_no, dept_manager.from_date, dept_manager.to_date
from departments
inner join dept_manager
on departments.dept_no = dept_manager.dept_no;


-- Joining retirement_info and dept_emp tables
select retirement_info.emp_no, retirement_info.first_name, retirement_info.last_name,
    dept_emp.to_date
from retirement_info
left join dept_emp
on retirement_info.emp_no = dept_emp.emp_no;

-- Use Aliases for Code Readability
select ri.emp_no, ri.first_name, ri.last_name, de.to_date
from retirement_info as ri
left join dept_emp as de
on ri.emp_no = de.emp_no;

select d.dept_name, dm.emp_no, dm, dm.to_date
from departments as d
inner join dept_manager as dm
on d.dept_no = dm.dept_no;

select ri.emp_no, ri.first_name, ri.last_name, de.to_date
into current_emp
from retirement_info as ri
left join dept_emp as de
on ri.emp_no = de.emp_no
where de.to_date = '9999-01-01';

select * from current_emp;

-- Employee count by department number
select count(ce.emp_no), de.dept_no
from current_emp as ce
left join dept_emp as de
on ce.emp_no = de.emp_no
group by de.dept_no
order by de.dept_no;

--Update the code block to create a new table, then export it as a CSV.
select count(ce.emp_no), de.dept_no
into cur_emp_dept
from current_emp as ce
left join dept_emp as de
on ce.emp_no = de.emp_no
group by de.dept_no
order by de.dept_no;