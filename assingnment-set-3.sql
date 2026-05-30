Assignment Set 3: Students + Courses
Dataset
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO Students VALUES
(1, 'Amit', 'Pune'),
(2, 'Priya', 'Mumbai'),
(3, 'Rahul', 'Pune'),
(4, 'Sneha', 'Delhi'),
(5, 'Karan', 'Nagpur');

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    fees INT
);

INSERT INTO Courses VALUES
(101, 'Java', 10000),
(102, 'SQL', 7000),
(103, 'React', 9000),
(104, 'Spring Boot', 12000);

CREATE TABLE Enrollments (
    enroll_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enroll_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

INSERT INTO Enrollments VALUES
(1, 1, 101, '2026-03-01'),
(2, 1, 102, '2026-03-03'),
(3, 2, 101, '2026-03-05'),
(4, 3, 103, '2026-03-06'),
(5, 4, 104, '2026-03-08'),
(6, 2, 103, '2026-03-10');

