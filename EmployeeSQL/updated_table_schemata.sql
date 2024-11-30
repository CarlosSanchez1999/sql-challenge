
-- Step 1: Create Tables Without Keys
CREATE TABLE departments (
    dept_no CHAR(4), -- Primary Key to be added later
    dept_name VARCHAR(255) NOT NULL
);

CREATE TABLE dept_emp (
    emp_no INT, -- Foreign Key to be added later
    dept_no CHAR(4) -- Foreign Key to be added later
);

CREATE TABLE dept_manager (
    dept_no CHAR(4), -- Foreign Key to be added later
    emp_no INT -- Foreign Key to be added later
);

-- To import the employee CSV correctly, I created a temporary table, transformed the data, and inserted it into the employees table.
CREATE TABLE temp_employees (
    emp_no INT,
    emp_title_id CHAR(5),
    birth_date TEXT, -- Temporarily stored as text
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    sex CHAR(1),
    hire_date TEXT -- Temporarily stored as text
);


CREATE TABLE employees (
    emp_no INT, -- Primary Key to be added later
    emp_title_id CHAR(5), -- Foreign Key to be added later
    birth_date DATE NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date DATE NOT NULL
);

INSERT INTO employees (emp_no, emp_title_id, birth_date, first_name, last_name, sex, hire_date)
SELECT
    emp_no,
    emp_title_id,
    TO_DATE(birth_date, 'MM/DD/YYYY'),
    first_name,
    last_name,
    sex,
    TO_DATE(hire_date, 'MM/DD/YYYY')
FROM temp_employees;

DROP TABLE temp_employees; -- I ended up dropping the temporary table as my employees table is already filled with the transformed data I needed.
 ------------------------------------------------------------------------------------
 
CREATE TABLE salaries (
    emp_no INT, -- Foreign Key to be added later
    salary INT NOT NULL
);

CREATE TABLE titles (
    title_id CHAR(5), -- Primary Key to be added later
    title VARCHAR(255) NOT NULL
);



--Add Primary Keys
ALTER TABLE departments ADD PRIMARY KEY (dept_no);
ALTER TABLE employees ADD PRIMARY KEY (emp_no);
ALTER TABLE titles ADD PRIMARY KEY (title_id);

-- Add Foreign Keys
ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY (emp_no) REFERENCES employees(emp_no);
ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY (dept_no) REFERENCES departments(dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY (dept_no) REFERENCES departments(dept_no);
ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY (emp_no) REFERENCES employees(emp_no);

ALTER TABLE salaries ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY (emp_no) REFERENCES employees(emp_no);

ALTER TABLE employees ADD CONSTRAINT fk_employees_emp_title_id FOREIGN KEY (emp_title_id) REFERENCES titles(title_id);

