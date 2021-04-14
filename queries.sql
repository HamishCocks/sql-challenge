create table titles (
title_id VARCHAR(255) PRIMARY KEY,
titles VARCHAR(255)
);

select * from titles;

create table employee_info (
number integer PRIMARY KEY,
title_id VARCHAR(255),
DOB VARCHAR(255),
first_name VARCHAR(255),
last_name VARCHAR(255),
sex VARCHAR(255),
hire_date VARCHAR(255),
FOREIGN KEY (title_id) references titles(title_id)
);

select * from employee_info;

create table salaries (
number INTEGER,
salary INTEGER,
FOREIGN KEY (number) references employee_info(number)
);

select * from salaries;

Create table depts (
dept_number VARCHAR(255) PRIMARY KEY,
dept_name VARCHAR(255)
);

select * from depts;

create table employee_dept (
number INTEGER,
dept_number VARCHAR(255),
FOREIGN KEY (number) references employee_info(number),
FOREIGN KEY (dept_number) references depts(dept_number)
);

select * from employee_dept;

create table manager_dept (
dept_number VARCHAR(255),
number integer,
FOREIGN KEY (number) references employee_info(number),
FOREIGN KEY (dept_number) references depts(dept_number)
);

select * from manager_dept;

select employee_info.number, employee_info.last_name, employee_info.first_name, employee_info.sex, salaries.salary
from salaries
inner join employee_info on
employee_info.number = salaries.number;

select employee_info.number, employee_info.first_name, employee_info.last_name, employee_info.hire_date
from employee_info
where hire_date
like '%1986';

select manager_dept.dept_number, depts.dept_name, manager_dept.number, employee_info.last_name, employee_info.first_name
from manager_dept
inner join employee_info on
employee_info.number = manager_dept.number
inner join depts on
depts.dept_number = manager_dept.dept_number;

select employee_info.number, employee_info.last_name, employee_info.first_name, depts.dept_name
from depts
inner join employee_dept on
depts.dept_number = employee_dept.dept_number
inner join employee_info on
employee_dept.number = employee_info.number;

select  employee_info.first_name, employee_info.last_name, employee_info.sex
from employee_info
where first_name = 'Hercules'
and last_name like 'B%';

select employee_info.number, employee_info.last_name, employee_info.first_name, depts.dept_name
from depts
inner join employee_dept on
depts.dept_number = employee_dept.dept_number
inner join employee_info on
employee_dept.number = employee_info.number
where dept_name = 'Sales';

select employee_info.number, employee_info.last_name, employee_info.first_name, depts.dept_name
from depts
inner join employee_dept on
depts.dept_number = employee_dept.dept_number
inner join employee_info on
employee_dept.number = employee_info.number
where dept_name = 'Sales'
or dept_name = 'Development';

select employee_info.last_name, count(employee_info.last_name)
from employee_info
group by employee_info.last_name
order by count(employee_info.last_name) DESC
limit 10;