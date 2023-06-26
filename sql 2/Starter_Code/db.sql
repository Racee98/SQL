CREATE TABLE `departments` (
  `dept_no` varchar(50) PRIMARY KEY,
  `dept_name` varchar(50) NOT NULL
);

CREATE TABLE `titles` (
  `title_id` varchar(50) PRIMARY KEY,
  `title` varchar(50) NOT NULL
);

CREATE TABLE `employees` (
  `emp_no` int(11) PRIMARY KEY,
  `emp_title_id` varchar(50) NOT NULL,
  `birth_date` date NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `sex` char(1) NOT NULL,
  `hire_date` date NOT NULL
);

CREATE TABLE `salaries` (
  `emp_no` int(11) NOT NULL,
  `salary` double NOT NULL
);

CREATE TABLE `dept_emp` (
  `emp_no` int(11) NOT NULL,
  `dept_no` varchar(50) NOT NULL
);

CREATE TABLE `dept_manager` (
  `emp_no` int(11) NOT NULL,
  `dept_no` varchar(50) NOT NULL
);


ALTER TABLE `dept_emp`
  ADD CONSTRAINT `dept_emp_ibfk_1` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON UPDATE CASCADE,
  ADD CONSTRAINT `dept_emp_ibfk_2` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON UPDATE CASCADE;

ALTER TABLE `dept_manager`
  ADD CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON UPDATE CASCADE,
  ADD CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON UPDATE CASCADE;

ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`emp_title_id`) REFERENCES `titles` (`title_id`) ON UPDATE CASCADE;

ALTER TABLE `salaries`
  ADD CONSTRAINT `salaries_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON UPDATE CASCADE;

