CREATE TABLE departments(
	dept_no VARCHAR PRIMARY KEY,
	dept_name VARCHAR(30)
);

SELECT *
FROM departments


CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL
);

SELECT *
FROM dept_emp;

CREATE TABLE dept_manager (
    dept_no VARCHAR NOT NULL,
    emp_no INT PRIMARY KEY,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL
);

SELECT *
FROM dept_manager;

CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    birth_date DATE,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    gender VARCHAR(5) NOT NULL,
    hire_date DATE NOT NULL
);

SELECT *
FROM employees;

CREATE TABLE salaries (
    emp_no INT PRIMARY KEY,
    salary INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL
);

SELECT *
FROM salaries;


CREATE TABLE titles (
    emp_no INT NOT NULL,
    title VARCHAR(30) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL
);

SELECT *
FROM titles;


--Question 1

SELECT emp.emp_no,
	emp.last_name,
	emp.first_name,
	emp.gender,
	sal.salary
FROM employees emp
INNER JOIN salaries sal on emp.emp_no = sal.emp_no

--Question 2

SELECT * 
FROM employees
WHERE hire_date between '1986-01-01' and '1986-12-31';

--Question 3

SELECT 	m1.dept_no,
	demp.dept_name,
	m1.emp_no,
	emp.last_name,
	emp.first_name,
	sal.from_date,
	sal.to_date
FROM dept_manager m1
INNER JOIN 	departments demp ON m1.dept_no = demp.dept_no
INNER JOIN	employees emp ON m1.emp_no = emp.emp_no
INNER JOIN	salaries sal ON m1.emp_no = sal.emp_no

--Question 4

SELECT depe.emp_no,
	emp.last_name,
	emp.first_name,
	dep.dept_name
FROM dept_emp depe
INNER JOIN employees emp ON depe.emp_no = emp.emp_no
INNER JOIN departments dep ON depe.dept_no = dep.dept_no

--Question 5

SELECT *
FROM employees
WHERE first_name = 'Hercules' AND
	last_name like 'B%';

--Question 6

SELECT dm.emp_no,
	emp.last_name,
	emp.first_name,
	dep.dept_name
FROM dept_emp dm
INNER JOIN departments dep ON dm.dept_no = dep.dept_no
INNER JOIN employees emp ON dm.emp_no = emp.emp_no
WHERE dep.dept_name = 'Sales';

--Question 7

SELECT dm.emp_no,
	emp.last_name,
	emp.first_name,
	dep.dept_name
FROM dept_emp dm
INNER JOIN departments dep ON dm.dept_no = dep.dept_no
INNER JOIN employees emp ON dm.emp_no = emp.emp_no
WHERE dep.dept_name = 'Sales' OR
	dep.dept_name = 'Development';
	
	
--Question 8

SELECT last_name,
	COUNT(last_name) AS last_name_count
FROM employees
GROUP BY last_name
ORDER BY last_name_count DESC;



















