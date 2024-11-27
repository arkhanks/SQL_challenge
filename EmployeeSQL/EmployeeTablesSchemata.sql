CREATE TABLE Titles (
	title_id CHAR(5) PRIMARY KEY,
	title VARCHAR(25) NOT NULL
);



CREATE TABLE Employees (
    emp_no INT PRIMARY KEY,                     
    emp_title_id CHAR(5) NOT NULL,           
    birth_date DATE NOT NULL,                    
    first_name VARCHAR(20) NOT NULL,            
    last_name VARCHAR(20) NOT NULL,             
    sex CHAR(1) NOT NULL,                        
    hire_date DATE NOT NULL,                     
    CONSTRAINT fk_emp_title_id FOREIGN KEY (emp_title_id) 
        REFERENCES Titles (title_id)            
);



CREATE TABLE Departments (
	dept_no CHAR(4) PRIMARY KEY,
	dept_name VARCHAR(25) NOT NULL
);



CREATE TABLE Department_Employees (
	emp_no INT NOT NULL,
	dept_no CHAR(4) NOT NULL,
	CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY (emp_no)
		REFERENCES Employees (emp_no),
	CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY (dept_no)
		REFERENCES Departments (dept_no),
	CONSTRAINT pk_dept_emp PRIMARY KEY (emp_no, dept_no)
);



CREATE TABLE Department_Manager (
	dept_no CHAR(4) NOT NULL,
	emp_no INT NOT NULL,
	CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY (dept_no)
		REFERENCES Departments (dept_no),
	CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY (emp_no)
		REFERENCES Employees (emp_no),
	CONSTRAINT pk_dept_manager PRIMARY KEY (dept_no, emp_no)
);



CREATE TABLE Salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	CONSTRAINT fk_salary_emp_no FOREIGN KEY (emp_no)
		REFERENCES Employees (emp_no),
	CONSTRAINT pk_salary PRIMARY KEY (emp_no)
);

	
