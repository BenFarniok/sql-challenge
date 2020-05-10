#### Data Analysis

--#### Data Analysis

--Once you have a complete database, do the following:

--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT * from departments
--select * from salaries

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary 
FROM employees, salaries
WHERE employees.emp_no = salaries.emp_no;


--2. List first name, last name, and hire date for employees who were hired in 1986.
-- check to make sure hire_date is held in DATE format

SELECT first_name, last_name, hire_date FROM employees
WHERE hire_date >'1986-01-01' AND hire_date < '1986-12-31';
--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT departments.department_no, departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
FROM departments, employees, dept_manager
WHERE dept_manager.dept_no=departments.department_no AND dept_manager.emp_no = employees.emp_no;
--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM departments, employees, dept_manager
WHERE dept_manager.dept_no = departments.department_no AND dept_manager.emp_no = employees.emp_no;
--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex FROM employees
WHERE first_name='Hercules' AND last_name LIKE 'B%';
--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM departments, employees, dept_emp
WHERE employees.emp_no = dept_emp.emp_no AND departments.department_no = dept_emp.dept_no AND departments.dept_name = 'Sales';
--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no AS emp_no, 
	employees.last_name AS emp_last, 
	employees.first_name AS emp_first, 
	departments.dept_name AS dept_name
FROM employees, departments, dept_emp
WHERE employees.emp_no = dept_emp.emp_no AND departments.department_no = dept_emp.dept_no
AND departments.dept_name = 'Sales'

UNION ALL

SELECT employees.emp_no AS emp_no, 
	employees.last_name AS emp_last, 
	employees.first_name AS emp_first, 
	departments.dept_name AS dept_name
FROM employees, departments, dept_emp
WHERE employees.emp_no = dept_emp.emp_no AND departments.department_no = dept_emp.dept_no
AND departments.dept_name = 'Development';

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS frequency
FROM employees
Group By last_name
ORDER BY frequency DESC;