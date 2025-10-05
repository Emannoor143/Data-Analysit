CREATE DATABASE my_class;

USE my_class;
CREATE TABLE students(
student_id INT AUTO_INCREMENT PRIMARY KEY,
first_name varchar(50) NOT NULL,
last_name varchar(50) NOT NULL,
email varchar(100)  UNIQUE,
age int,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);
 
SELECT * FROM students;

SELECT first_name , email FROM students;

INSERT INTO students (first_name, last_name, email, age)
VALUES ('Ali', 'Khan', 'ali.khan@example.com', 20);

INSERT INTO students( first_name, last_name, email, age)
VALUES
('muskan', 'noor', 'muskan@gmail.com', 23),
('uqba', 'nisar', 'uqba@gmail.com', 21),
('abiha', 'fatima', 'abiha@gmail.com', 19);

SELECT * FROM students WHERE age > 18;

UPDATE students
SET age = 15
WHERE student_id = 20;

DROP DATABASE my_student;
