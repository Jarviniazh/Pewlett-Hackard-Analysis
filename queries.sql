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