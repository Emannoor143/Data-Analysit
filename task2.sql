CREATE DATABASE university_management;
USE university_management;
CREATE TABLE Departments(
dept_id INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
dept_name VARCHAR(100),
building VARCHAR(100)
);
CREATE TABLE instructors (
  instructor_id INT PRIMARY KEY,
  dept_id INT NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  hire_date DATE,
  salary DECIMAL(10,2),
  FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
  );
  CREATE TABLE students (
  student_id INT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE,
  dob DATE,
  admission_year YEAR,
  `status` ENUM('Active','Graduated','Dropped') DEFAULT 'Active'
);
CREATE TABLE courses (
  course_id INT PRIMARY KEY,
  dept_id INT NOT NULL,
  course_code VARCHAR(10),
  title VARCHAR(100),
  credits INT,
  FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
    ON UPDATE CASCADE ON DELETE RESTRICT
);
CREATE TABLE course_offerings (
  offering_id INT PRIMARY KEY,
  course_id INT NOT NULL,
  instructor_id INT NOT NULL,
  semester VARCHAR(20),
  seats INT,
  FOREIGN KEY (course_id) REFERENCES courses(course_id)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  FOREIGN KEY (instructor_id) REFERENCES instructors(instructor_id)
);
CREATE TABLE enrollments (
  enroll_id INT PRIMARY KEY,
  student_id INT NOT NULL,
  offering_id INT NOT NULL,
  enroll_date DATE,
  grade VARCHAR(2),
  `status` ENUM('Enrolled','Dropped','Completed') DEFAULT 'Enrolled',
  FOREIGN KEY (student_id) REFERENCES students(student_id)
    ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (offering_id) REFERENCES course_offerings(offering_id)
);

-- Departments (5)
INSERT INTO departments (dept_id, dept_name, building)
VALUES
(1,'Computer Science','Main Block'),
(2,'Mathematics','Math Building'),
(3,'Physics','Science Wing'),
(4,'English','Arts Block'),
(5,'Business','Commerce Hall');

-- Instructors (5)
INSERT INTO instructors (instructor_id, dept_id, first_name, last_name, email, hire_date, salary) 
VALUES
(1,1,'Ali','Khan','ali.khan@example.com','2018-07-15',80000.00),
(2,1,'Sara','Ahmed','sara.ahmed@example.com','2020-03-01',75000.00),
(3,2,'Omar','Farooq','omar.farooq@example.com','2019-09-20',68000.00),
(4,3,'Nadia','Qureshi','nadia.qureshi@example.com','2017-01-10',72000.00),
(5,5,'Bilal','Saeed','bilal.saeed@example.com','2021-11-05',65000.00);

-- Students (5)
INSERT INTO students (student_id, first_name, last_name, email, dob, admission_year, `status`)
VALUES
(1,'Aisha','Raza','aisha.raza@example.com','2002-05-12',2020,'Active'),
(2,'Fahad','Malik','fahad.malik@example.com','2000-11-23',2019,'Graduated'),
(3,'Hina','Khan','hina.khan@example.com','2004-03-03',2022,'Active'),
(4,'Zain','Ali','zain.ali@example.com','1998-08-30',2018,'Dropped'),
(5,'Mona','Yousaf','mona.yousaf@example.com','2003-12-01',2021,'Active');

-- Courses (5)
INSERT INTO courses (course_id, dept_id, course_code, title, credits) 
VALUES
(1,1,'CS101','Intro to Programming',3),
(2,1,'CS201','Database Systems',3),
(3,2,'MA101','Calculus I',4),
(4,3,'PH101','Physics I',4),
(5,5,'BU101','Introduction to Business',3);

-- Course Offerings (5)
INSERT INTO course_offerings (offering_id, course_id, instructor_id, semester, seats) 
VALUES
(1,1,1,'Fall2025',30),
(2,2,2,'Spring2025',25),
(3,3,3,'Fall2024',40),
(4,4,4,'Spring2025',35),
(5,5,5,'Fall2025',20);

-- Enrollments (5)
INSERT INTO enrollments (enroll_id, student_id, offering_id, enroll_date, grade, `status`) VALUES
(1,1,1,'2025-09-01','A','Enrolled'),
(2,2,2,'2024-01-15','B','Completed'),
(3,3,1,'2025-09-02',NULL,'Enrolled'),
(4,4,3,'2019-09-10','C','Completed'),
(5,5,5,'2025-09-05',NULL,'Enrolled');

select* from Departments;
select* from instructors;
select* from students;
select* from courses;
select* from course_offerings;
select* from enrollments;

ALTER TABLE students
ADD COLUMN phone VARCHAR(20) AFTER email;
ALTER TABLE students
CHANGE COLUMN status student_status VARCHAR(50);
ALTER TABLE instructors DROP COLUMN salary;


UPDATE instructors SET salary = 90000 WHERE instructor_id = 2;
delete from students where admission_year < 2020;
update courses SET title = 'programming fundamental'
where title='Intro to Programming';
INSERT INTO enrollments VALUES (6, 1, 1, CURDATE(), NULL, 'Enrolled');



select concat(first_name,'',last_name) as full_name from students
where student_status='Active' order by last_name ASC;
select* from instructors  order by hire_date DESC LIMIT 5;
select distinct admission_year from students;
select* from courses where credits > 3;


 SELECT dept_name, COUNT(*) AS num_students FROM departments GROUP BY dept_name;
SELECT AVG(grade) AS average_gpa
FROM enrollments;
select avg(credits) from courses;
select min(credits), max(credits) from courses;







