--Create tables and import all data
CREATE TABLE departments (
  dept_no VARCHAR Primary Key,
  dept_name VARCHAR
 );
 
 CREATE TABLE dept_emp (
	 emp_no INT,
	 dept_no VARCHAR,
	 from_date DATE,
	 to_date DATE
 );
 
 CREATE TABLE dept_manager (
	 dept_no VARCHAR,
	 emp_no INT,
	 from_date DATE,
	 to_date DATE
 );
 
 CREATE TABLE employees (
	 emp_no INT Primary Key,
	 birth_date DATE,
	 first_name VARCHAR,
	 last_name VARCHAR,
	 gender VARCHAR,
	 hire_date DATE
 );
 
 CREATE TABLE salaries (
	 emp_no INT,
	 salary INT,
	 from_date DATE,
	 to_date DATE
 );
 
 CREATE TABLE titles (
	 emp_no INT,
	 title VARCHAR,
	 from_date DATE,
	 to_date DATE
 );
 
 -- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT e.first_name, e.last_name, e.gender, s.salary
FROM employees AS e
INNER JOIN salaries AS s ON
e.emp_no=s.emp_no;

--2. List employees who were hired in 1986.
SELECT *
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01';

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT d.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name, m.from_date, m.to_date
FROM departments AS d
JOIN dept_manager AS m ON
d.dept_no=m.dept_no
JOIN employees as e On
m.emp_no=e.emp_no;
--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
Select d.emp_no, e.last_name, e.first_name, dp.dept_name
From dept_emp d
Join employees e
on d.emp_no = e.emp_no
Join departments dp
on d.dept_no=dp.dept_no;

--5. List all employees whose first name is "Hercules" and last names begin with "B."
Select e.first_name, e.last_name
from employees e
Where e.first_name = 'Hercules' AND
e.last_name like 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
Select de.emp_no, e.last_name, e.first_name, d.dept_name
from dept_emp de
Join employees e 
on de.emp_no=e.emp_no
Join departments d
on de.dept_no=d.dept_no
where d.dept_name='Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

Select de.emp_no, e.last_name, e.first_name, d.dept_name
from dept_emp de
Join employees e 
on de.emp_no=e.emp_no
Join departments d
on de.dept_no=d.dept_no
where d.dept_name='Sales' or
d.dept_name = 'Development'; 

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name,
COUNT(last_name) AS "# of Last Name"
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC

--Search your ID #
Select * from employees
Where emp_no=499942;

 