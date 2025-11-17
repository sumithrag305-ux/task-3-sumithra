CREATE DATABASE  task3_db;
USE task3_db;
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    gender VARCHAR(10),
    age INT
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    student_id INT,
    course_name VARCHAR(50),
    marks INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    gender VARCHAR(10),
    age INT
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    student_id INT,
    course_name VARCHAR(50),
    marks INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

INSERT INTO students VALUES
(1, 'Aarav', 'Male', 21),
(2, 'Meera', 'Female', 20),
(3, 'John', 'Male', 22),
(4, 'Sophia', 'Female', 21);

INSERT INTO courses VALUES
(101, 1, 'SQL', 85),
(102, 1, 'Python', 78),
(103, 2, 'SQL', 92),
(104, 3, 'PowerBI', 88),
(105, 4, 'Excel', 95);

SELECT * FROM students;
SELECT * FROM courses;

SELECT name, age 
FROM students
WHERE age > 20;

SELECT name, age 
FROM students
ORDER BY age ASC;

SELECT student_id, course_name, marks
FROM courses
ORDER BY marks DESC;

SELECT s.name, c.course_name, c.marks
FROM students s
INNER JOIN courses c ON s.student_id = c.student_id;



SELECT s.name, c.course_name, c.marks
FROM students s
LEFT JOIN courses c ON s.student_id = c.student_id;

SELECT s.name, c.course_name, c.marks
FROM students s
RIGHT JOIN courses c ON s.student_id = c.student_id;

SELECT name
FROM students
WHERE student_id IN (
    SELECT student_id 
    FROM courses 
    WHERE marks > 90
);


SELECT name
FROM students
WHERE age = (
    SELECT MAX(age) FROM students
);


SELECT SUM(marks) AS total_marks FROM courses;

SELECT AVG(marks) AS average_marks FROM courses;

SELECT COUNT(DISTINCT student_id) AS total_students 
FROM courses;

SELECT COUNT(DISTINCT student_id) AS total_students 
FROM courses;


SELECT student_id, SUM(marks) AS total_marks
FROM courses
GROUP BY student_id;

SELECT student_id, SUM(marks) AS total_marks
FROM courses
GROUP BY student_id
HAVING SUM(marks) > 150;

CREATE OR REPLACE VIEW student_report AS
SELECT 
    s.student_id,
    s.name,
    s.gender,
    c.course_name,
    c.marks
FROM students s
JOIN courses c
ON s.student_id = c.student_id;


SELECT * FROM student_report;

CREATE INDEX idx_student_id 
ON courses(student_id);

DROP INDEX idx_student_id ON courses;

SHOW INDEX FROM courses;







