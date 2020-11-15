-- My SQL Queries for sql-chalenge
-- Iván López

-- Listing the following details of each employee: (i)employee number; (ii) Last name; 
-- (iii) first name; (iv) gender; (v) salary
SELECT a.emp_no, a.last_name, a.first_name, a.gender, b.salary 
FROM employees AS a
INNER JOIN salaries AS b
ON a.emp_no = b.emp_no
;

-- List employees who where hired in 1986
-- This one was tricky, I needed to use single quote instead of double quote
SELECT emp_no, last_name, first_name, hire_date 
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
;

-- List the manager of each department with the following information: (i) department number;
-- (ii) department name; (iii) manager's employee number; (iv) last_name; (v) first_name;
-- (vi) start and end employment dates

SELECT a.dept_no, b.dept_name, c.emp_no, c.last_name, c.first_name, 
a.from_date, a.to_date     
FROM dept_manager AS a
INNER JOIN departments AS b
ON a.dept_no = b.dept_no
INNER JOIN employees AS c
ON a.emp_no = c.emp_no
;

-- List the department of each employee with the following information: (i)employee number;
-- (ii)last name; (iii)first name; (iv)department name 

SELECT b.emp_no, c.last_name, c.first_name, a.dept_name  
FROM departments AS a
INNER JOIN dept_emp AS b
ON a.dept_no = b.dept_no
INNER JOIN employees AS c
ON b.emp_no = c.emp_no
;

-- List all employees whose first name is "Hercules" and last names begin with "B"
SELECT emp_no, first_name, last_name FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
;

-- List all employees in the Sales department, including their employee number, 
-- last name, first name, and department name

SELECT b.emp_no, c.last_name, c.first_name, a.dept_name  
FROM departments AS a
INNER JOIN dept_emp AS b
ON a.dept_no = b.dept_no
INNER JOIN employees AS c
ON b.emp_no = c.emp_no
WHERE a.dept_no = 'd007'
;

-- List all employees in the Sales and Development departments, including their 
-- employee number, last name, first name, and department name

SELECT b.emp_no, c.last_name, c.first_name, a.dept_name  
FROM departments AS a
INNER JOIN dept_emp AS b
ON a.dept_no = b.dept_no
INNER JOIN employees AS c
ON b.emp_no = c.emp_no
WHERE a.dept_no = 'd007' OR a.dept_no = 'd005'
;

-- In descending order, list the frequency count of employee last names, 
-- i.e. how many employees share each last name

SELECT last_name, COUNT(*) AS "Frequency count" 
FROM employees
GROUP BY last_name
ORDER BY "Frequency count" DESC
;

-- Searching for my employee ID
SELECT b.emp_no, c.last_name, c.first_name, a.dept_name  
FROM departments AS a
INNER JOIN dept_emp AS b
ON a.dept_no = b.dept_no
INNER JOIN employees AS c
ON b.emp_no = c.emp_no
WHERE b.emp_no = '499942'
;

-- LOL April Foolsday

-- This last Query relates to the bonus, in order to determine the average salary by title
-- This script was used directly when we used the pd.read_sql function in the jupyter notebok

SELECT b.title, ROUND(AVG(a.salary),2) AS "Avg Salary" 
FROM salaries AS a
INNER JOIN titles AS b
ON a.emp_no = b.emp_no
GROUP BY title
;

SELECT DISTINCT title FROM titles
;





