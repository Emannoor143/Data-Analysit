CREATE DATABASE store;
USE store;
CREATE TABLE employee(
employee_id int auto_increment primary key,
employee_name varchar(50),
age int,
salary int default 3000,
department  varchar(100)
);

SELECT * FROM employee;

insert into employee(employee_name, age, salary, department)
values
('uqba', 17, 5000, 'IT'),
('EMAN', 20, 4000, 'CS'),
('MUSKAN', 30, 2200, 'MATH');
update employee
SET employee_name = 'abiha'
WHERE employee_id = 3;
desc employee;
ALTER TABLE employee add column address varchar(50);
update employee
set address = 'abcfe'
where employee_id =1;
update employee
set address = 'noor'
where employee_id =2;
update employee
set address = 'kamoki'
where employee_id =3;
ALTER TABLE employee RENAME COLUMN employee_name TO name;
DELETE FROM employee WHERE employee_id = 5;
ALTER TABLE employee MODIFY COLUMN name varchar(100);
describe employee;