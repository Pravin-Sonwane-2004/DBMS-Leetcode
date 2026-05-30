mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| classicmodels      |
| demo               |
| ecommerce_db       |
| employee           |
| ind                |
| information_schema |
| jobapp             |
| lc_collection      |
| learning_indexes   |
| mysql              |
| performance_schema |
| quiz_db            |
| spring_security_db |
| sql_practice       |
| studentapp         |
| ultimate           |
| vaul               |
+--------------------+
17 rows in set (0.00 sec)

mysql> use sql_practice
Database changed
mysql> show tables;
+------------------------+
| Tables_in_sql_practice |
+------------------------+
| customers              |
| employees              |
| orders                 |
| products               |
| sales                  |
| scores                 |
| seat                   |
+------------------------+
7 rows in set (0.01 sec)

mysql> select * from Students;
ERROR 1146 (42S02): Table 'sql_practice.students' doesn't exist
mysql> CREATE TABLE Students (
    ->     student_id INT PRIMARY KEY,
    ->     name VARCHAR(50),
    ->     city VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> INSERT INTO Students VALUES
    -> (1, 'Amit', 'Pune'),
    -> (2, 'Priya', 'Mumbai'),
    -> (3, 'Rahul', 'Pune'),
    -> (4, 'Sneha', 'Delhi'),
    -> (5, 'Karan', 'Nagpur');
Query OK, 5 rows affected (0.00 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql>
mysql> CREATE TABLE Courses (
    ->     course_id INT PRIMARY KEY,
    ->     course_name VARCHAR(50),
    ->     fees INT
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> INSERT INTO Courses VALUES
    -> (101, 'Java', 10000),
    -> (102, 'SQL', 7000),
    -> (103, 'React', 9000),
    -> (104, 'Spring Boot', 12000);
Query OK, 4 rows affected (0.00 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql>
mysql>
mysql> CREATE TABLE Enrollments (
    ->     enroll_id INT PRIMARY KEY,
    ->     student_id INT,
    ->     course_id INT,
    ->     enroll_date DATE,
    ->     FOREIGN KEY (student_id) REFERENCES Students(student_id),
    ->     FOREIGN KEY (course_id) REFERENCES Courses(course_id)
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql>
mysql>
mysql> INSERT INTO Enrollments VALUES
    -> (1, 1, 101, '2026-03-01'),
    -> (2, 1, 102, '2026-03-03'),
    -> (3, 2, 101, '2026-03-05'),
    -> (4, 3, 103, '2026-03-06'),
    -> (5, 4, 104, '2026-03-08'),
    -> (6, 2, 103, '2026-03-10');
Query OK, 6 rows affected (0.00 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> select * from Students;
+------------+-------+--------+
| student_id | name  | city   |
+------------+-------+--------+
|          1 | Amit  | Pune   |
|          2 | Priya | Mumbai |
|          3 | Rahul | Pune   |
|          4 | Sneha | Delhi  |
|          5 | Karan | Nagpur |
+------------+-------+--------+
5 rows in set (0.00 sec)

mysql> select * from Enrollments;
+-----------+------------+-----------+-------------+
| enroll_id | student_id | course_id | enroll_date |
+-----------+------------+-----------+-------------+
|         1 |          1 |       101 | 2026-03-01  |
|         2 |          1 |       102 | 2026-03-03  |
|         3 |          2 |       101 | 2026-03-05  |
|         4 |          3 |       103 | 2026-03-06  |
|         5 |          4 |       104 | 2026-03-08  |
|         6 |          2 |       103 | 2026-03-10  |
+-----------+------------+-----------+-------------+
6 rows in set (0.00 sec)

mysql> select * from Courses;
+-----------+-------------+-------+
| course_id | course_name | fees  |
+-----------+-------------+-------+
|       101 | Java        | 10000 |
|       102 | SQL         |  7000 |
|       103 | React       |  9000 |
|       104 | Spring Boot | 12000 |
+-----------+-------------+-------+
4 rows in set (0.00 sec)

mysql>


=-=-=-=-=-=-=-=-=-==-=-=--=-=-=-=--=-=--==-=-=-=-=-=-=-=-==--=--=-=-=--=-=--=-==--===

Questions
Q19. Show student name with enrolled course name.
Expected columns:
student_name | course_name | enroll_date

SELECT
    s.name AS student_name,
    c.course_name,
    e.enroll_date
FROM Students s
JOIN Enrollments e
    ON s.student_id = e.student_id
JOIN Courses c
    ON e.course_id = c.course_id;





