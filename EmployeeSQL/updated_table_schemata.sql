
-- Step 1: Create Tables Without Constraints
CREATE TABLE departments (
    dept_no CHAR(4),
    dept_name VARCHAR(255) NOT NULL
);

CREATE TABLE employees (
    emp_no INT,
    emp_title_id CHAR(5),
    birth_date DATE, -- Will be transformed from TEXT later
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date DATE -- Will be transformed from TEXT later
);

CREATE TABLE dept_emp (
    emp_no INT,
    dept_no CHAR(4)
);

CREATE TABLE dept_manager (
    dept_no CHAR(4),
    emp_no INT
);

CREATE TABLE salaries (
    emp_no INT,
    salary INT NOT NULL
);

CREATE TABLE titles (
    title_id CHAR(5),
    title VARCHAR(255) NOT NULL
);

-- Step 2: Create Temporary Table for Employees Data Transformation
CREATE TABLE temp_employees (
    emp_no INT,
    emp_title_id CHAR(5),
    birth_date TEXT, -- Temporary text column for transformation
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    sex CHAR(1),
    hire_date TEXT -- Temporary text column for transformation
);

-- Step 3: Manual Data Import
-- Note: The data must be imported manually using pgAdmin's Import/Export tool.
-- For doing this you will need to have the data file provided in the repository.
-- Instructions:
-- 1. Right-click on each table (e.g., temp_employees) in pgAdmin.
-- 2. Select "Import/Export".
-- 3. Choose "Import" and select the corresponding CSV file.
-- 4. Set the delimiter as ',' and ensure the "Header" option is checked.
-- 5. Repeat for all tables:
--    - temp_employees: employees.csv
--    - departments: departments.csv
--    - dept_emp: dept_emp.csv
--    - dept_manager: dept_manager.csv
--    - salaries: salaries.csv
--    - titles: titles.csv

-- Step 4: Transform Data and Insert Into Employees Table
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

-- Step 5: Add Primary Keys
ALTER TABLE departments ADD PRIMARY KEY (dept_no);
ALTER TABLE employees ADD PRIMARY KEY (emp_no);
ALTER TABLE titles ADD PRIMARY KEY (title_id);

-- Step 6: Add Foreign Keys
ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY (emp_no) REFERENCES employees(emp_no);
ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY (dept_no) REFERENCES departments(dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY (dept_no) REFERENCES departments(dept_no);
ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY (emp_no) REFERENCES employees(emp_no);

ALTER TABLE salaries ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY (emp_no) REFERENCES employees(emp_no);

ALTER TABLE employees ADD CONSTRAINT fk_employees_emp_title_id FOREIGN KEY (emp_title_id) REFERENCES titles(title_id);

-- Step 7: Clean Up
DROP TABLE temp_employees;