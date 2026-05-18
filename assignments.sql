1. Create Practice Database
CREATE DATABASE sql_practice;
USE sql_practice;


2. Dataset: Seat Table
CREATE TABLE Seat (
    id INT PRIMARY KEY,
    student VARCHAR(50)
);

INSERT INTO Seat (id, student) VALUES
(1, 'Amit'),
(2, 'Priya'),
(3, 'Rahul'),
(4, 'Sneha'),
(5, 'Karan');

Check data:
SELECT * FROM Seat;

Output:
id | student
1  | Amit
2  | Priya
3  | Rahul
4  | Sneha
5  | Karan

Practice Questions
Q1. Check odd/even rows
Write a query to check whether the table has odd or even number of rows.
Expected output:
total_rows | row_type
5          | Odd

Hint:
select 
    count(*) as total_rows,
    case 
        when count(*) %2=0 then 'even'
        else
            'odd'
            end as row_type
        from seat;


------------------------------------------------------------
Q2. Show whether each seat id is odd or even
Expected output:
id | student | seat_type
1  | Amit    | Odd
2  | Priya   | Even
3  | Rahul   | Odd
4  | Sneha   | Even
5  | Karan   | Odd

   
SELECT 
    id, 
    student, 
    CASE 
        WHEN id % 2 = 0 THEN 'even' 
        ELSE 'odd' 
        END AS seat_type
        from seat
        
------------------------------------------------------------

Q3. Exchange Seats like LeetCode 626
Swap adjacent students:
1 <-> 2
3 <-> 4
5 stays same

id | student
1  | Amit
2  | Priya
3  | Rahul
4  | Sneha
5  | Karan

Expected output:
id | student

1  | Priya
2  | Amit
3  | Sneha
4  | Rahul
5  | Karan



select 
    case 
    when id % 2 = 1 AND id = (select MAX(id) from seat) THEN id
        when id % 2  = 1 then id +1
        when id % 2 = 0 then id-1
        end as id,student
        FROM Seat
        ORDER BY id;

------------------------------------------------------------
Q3. Exchange Seats like LeetCode 626
Swap adjacent students:
1 <-> 2
3 <-> 4
5 stays same

Expected output:
id | student
1  | Priya
2  | Amit
3  | Sneha
4  | Rahul
5  | Karan

------------------------------------------------------------
Q4. Generate new swapped id only
Do not swap student yet. Just show old id and new id.
Expected output:
old_id | student | new_id
1      | Amit    | 2
2      | Priya   | 1
3      | Rahul   | 4
4      | Sneha   | 3
5      | Karan   | 5


SELECT id as old_id,student, 
        case
            when id % 2 = 1 AND id = (select MAX(id) from seat) then id
            when id % 2 = 0 then id-1
        else id +1
        end as new_id
        from seat;

{{{{{{{{{{{{{{{{{{{{{{{{{{{{}}}}}}}}}}}}}}}}}}}}}}}}}}}}

Now its time to work on the second dataset 


Q7. Classify pass/fail
Passing marks = 40.
Expected output:

student | marks | result

Amit    | 85    | Pass
Priya   | 42    | Pass
Rahul   | 67    | Pass
Sneha   | 91    | Pass
Karan   | 35    | Fail
Neha    | 76    | Pass



SELECT student,marks,
case 
    when marks < 40 then 'fail'
    else 'pass'
    end as result
from Scores;


--------------------------------------


Q8. Assign grade
Rules:
Marks
Grade
>= 90
A+
>= 75
A
>= 60
B
>= 40
C
< 40
Fail

Expected columns:
student | marks | grade


-- its boaring im not doing it

-------------------------------

Q9. Sort passed students first
Show all students, but sort like this:
Pass students first
Fail students last

Hint:
ORDER BY CASE ...


SELECT student,marks,
case 
    when marks < 40 then 'fail'
    else 'pass'
    end as result
from Scores 
ORDER BY 
    CASE 
        WHEN marks >= 40 THEN 1
        ELSE 2
    END,
    marks DESC;
-----------------------------------------------

Q10. Increase marks conditionally
Write a query to display updated marks, not actually update table.
Rules:
Condition
New marks
marks < 40
marks + 10
marks >= 40
marks + 5

Expected columns:
student | marks | updated_marks


this is also boaring but ill try it

select student,marks,
case when marks < 40 then marks +10
when marks >= 40 then marks + 5
end as updated_marks 
from scores;

--------------------------------------------------

Third Database of this day 
==========================================
Third Dataset: Employees Table
CREATE TABLE Employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO Employees (id, name, department, salary) VALUES
(1, 'Amit', 'IT', 45000),
(2, 'Priya', 'HR', 38000),
(3, 'Rahul', 'IT', 60000),
(4, 'Sneha', 'Finance', 52000),
(5, 'Karan', 'HR', 30000),
(6, 'Neha', 'Finance', 75000);
-------------------------------------------------

Q12. Give bonus based on department
Rules:
Department
Bonus
IT
10000
HR
5000
Finance
8000

Expected columns:
name | department | salary | bonus | total_salary

Hint:
salary + CASE ...

SELECT
    name,
    department,
    salary,
    CASE
        WHEN department = 'IT' THEN 10000
        WHEN department = 'HR' THEN 5000
        WHEN department = 'Finance' THEN 8000
        ELSE 0
    END AS bonus,
    salary + CASE
        WHEN department = 'IT' THEN 10000
        WHEN department = 'HR' THEN 5000
        WHEN department = 'Finance' THEN 8000
        ELSE 0
    END AS total_salary
FROM Employees;

-------------------------------------------------------
Q13. Sort department priority
Sort employees in this order:
IT first
Finance second
HR third

Hint:
ORDER BY CASE
    WHEN department = 'IT' THEN 1
    WHEN department = 'Finance' THEN 2
    WHEN department = 'HR' THEN 3
END

select  *
FROM employees
order by department desc,
		case
			WHEN department = 'IT' THEN 1
			WHEN department = 'Finance' THEN 2
			WHEN department = 'HR' THEN 3
            end;
--------------------------------------------------------------

Q14. Swap salaries between employee id 1 and id 2
This one is actual UPDATE.
Current:
id 1 -> 45000
id 2 -> 38000

After swap:
id 1 -> 38000
id 2 -> 45000

Hint:
UPDATE Employees
SET salary = CASE
    WHEN id = 1 THEN ...
    WHEN id = 2 THEN ...
END
WHERE id IN (1, 2);

update employees set salary = case
	when id = 1 then  38000
    when id = 2 then  45000
    else
    salary
    end 
    where id in(1,2);
    
    select * from employees;

    ------------------------------------------------
==========================================================================

    Expected columns:
customer_name | city | order_id | amount | status

Use:
JOIN





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
| mysql              |
| performance_schema |
| spring_security_db |
| sql_practice       |
| studentapp         |
| sys                |
| ultimate           |
| vaul               |
+--------------------+
16 rows in set (0.04 sec)

mysql> use sql_practice;
Database changed
mysql> show tables;
+------------------------+
| Tables_in_sql_practice |
+------------------------+
| customers              |
| employees              |
| orders                 |
| scores                 |
| seat                   |
+------------------------+
5 rows in set (0.01 sec)

mysql> use customers;
ERROR 1049 (42000): Unknown database 'customers'
mysql> select * from customers;
+-------------+-------+--------+
| customer_id | name  | city   |
+-------------+-------+--------+
|           1 | Amit  | Pune   |
|           2 | Priya | Mumbai |
|           3 | Rahul | Pune   |
|           4 | Sneha | Delhi  |
|           5 | Karan | Mumbai |
+-------------+-------+--------+
5 rows in set (0.03 sec)

mysql> select * from orders;
+----------+-------------+--------+------------+-----------+
| order_id | customer_id | amount | order_date | status    |
+----------+-------------+--------+------------+-----------+
|      101 |           1 |   1200 | 2026-01-10 | Delivered |
|      102 |           2 |   2500 | 2026-01-12 | Pending   |
|      103 |           1 |    800 | 2026-01-15 | Delivered |
|      104 |           3 |   3000 | 2026-01-18 | Cancelled |
|      105 |           4 |   1500 | 2026-01-20 | Delivered |
|      106 |           5 |    500 | 2026-01-25 | Pending   |
|      107 |           2 |   4000 | 2026-02-01 | Delivered |
+----------+-------------+--------+------------+-----------+
7 rows in set (0.01 sec)

mysql> select c.name, c.city, o.order_id, o.amount,o.status 
from customers c 
left join
 orders o 
 on o.customer_id = c.customer_id
    -> ;
+-------+--------+----------+--------+-----------+
| name  | city   | order_id | amount | status    |
+-------+--------+----------+--------+-----------+
| Amit  | Pune   |      101 |   1200 | Delivered |
| Amit  | Pune   |      103 |    800 | Delivered |
| Priya | Mumbai |      102 |   2500 | Pending   |
| Priya | Mumbai |      107 |   4000 | Delivered |
| Rahul | Pune   |      104 |   3000 | Cancelled |
| Sneha | Delhi  |      105 |   1500 | Delivered |
| Karan | Mumbai |      106 |    500 | Pending   |
+-------+--------+----------+--------+-----------+
7 rows in set (0.00 sec)


----------------------------------------------------------------
Q2. Find total order amount per customer.
Expected columns:
customer_name | total_amount

Use:
GROUP BY
SUM()


+-------+--------------+
| name  | Total_Amount |
+-------+--------------+
| Amit  |         2000 |
| Priya |         6500 |
| Rahul |         3000 |
| Sneha |         1500 |
| Karan |          500 |
+-------+--------------+
5 rows in set (0.00 sec)

mysql> select * from customers;
+-------------+-------+--------+
| customer_id | name  | city   |
+-------------+-------+--------+
|           1 | Amit  | Pune   |
|           2 | Priya | Mumbai |
|           3 | Rahul | Pune   |
|           4 | Sneha | Delhi  |
|           5 | Karan | Mumbai |
+-------------+-------+--------+
5 rows in set (0.00 sec)

mysql> select * from orders;
+----------+-------------+--------+------------+-----------+
| order_id | customer_id | amount | order_date | status    |
+----------+-------------+--------+------------+-----------+
|      101 |           1 |   1200 | 2026-01-10 | Delivered |
|      102 |           2 |   2500 | 2026-01-12 | Pending   |
|      103 |           1 |    800 | 2026-01-15 | Delivered |
|      104 |           3 |   3000 | 2026-01-18 | Cancelled |
|      105 |           4 |   1500 | 2026-01-20 | Delivered |
|      106 |           5 |    500 | 2026-01-25 | Pending   |
|      107 |           2 |   4000 | 2026-02-01 | Delivered |
+----------+-------------+--------+------------+-----------+
7 rows in set (0.00 sec)

mysql> select c.name ,sum(o.amount) as Total_Amount from customers c left join orders o on c.customer_id = o.customer_id  group by c.name;
+-------+--------------+
| name  | Total_Amount |
+-------+--------------+
| Amit  |         2000 |
| Priya |         6500 |
| Rahul |         3000 |
| Sneha |         1500 |
| Karan |          500 |
+-------+--------------+
5 rows in set (0.00 sec)

--------------------------------------------------------

Q3. Find customers whose total order amount is greater than 3000.
Use:
HAVING

orders o on c.customer_id = o.customer_id  group by c.name;
+-------+--------------+
| name  | Total_Amount |
+-------+--------------+
| Amit  |         2000 |
| Priya |         6500 |
| Rahul |         3000 |
| Sneha |         1500 |
| Karan |          500 |
+-------+--------------+
5 rows in set (0.00 sec)

mysql> select * from customers;
+-------------+-------+--------+
| customer_id | name  | city   |
+-------------+-------+--------+
|           1 | Amit  | Pune   |
|           2 | Priya | Mumbai |
|           3 | Rahul | Pune   |
|           4 | Sneha | Delhi  |
|           5 | Karan | Mumbai |
+-------------+-------+--------+
5 rows in set (0.00 sec)

mysql> select * from orders;
+----------+-------------+--------+------------+-----------+
| order_id | customer_id | amount | order_date | status    |
+----------+-------------+--------+------------+-----------+
|      101 |           1 |   1200 | 2026-01-10 | Delivered |
|      102 |           2 |   2500 | 2026-01-12 | Pending   |
|      103 |           1 |    800 | 2026-01-15 | Delivered |
|      104 |           3 |   3000 | 2026-01-18 | Cancelled |
|      105 |           4 |   1500 | 2026-01-20 | Delivered |
|      106 |           5 |    500 | 2026-01-25 | Pending   |
|      107 |           2 |   4000 | 2026-02-01 | Delivered |
+----------+-------------+--------+------------+-----------+
7 rows in set (0.00 sec)

mysql> select c.name ,sum(o.amount) as Total_Amount from customers c left join orders o on c.customer_id = o.customer_id  group by c.name;
+-------+--------------+
| name  | Total_Amount |
+-------+--------------+
| Amit  |         2000 |
| Priya |         6500 |
| Rahul |         3000 |
| Sneha |         1500 |
| Karan |          500 |
+-------+--------------+
5 rows in set (0.00 sec)

mysql> select c.name from customers left join orders o on c.customer_id = o.customer_id group by c.name having sum(o.amount) > 3000;
ERROR 1054 (42S22): Unknown column 'c.name' in 'field list'
mysql> select c.name from customers c left join orders o on c.customer_id = o.customer_id group by c.name having sum(o.amount) > 3000;
+-------+
| name  |
+-------+
| Priya |
+-------+
1 row in set (0.00 sec)

mysql> select c.name from customers c left join orders o on c.customer_id = o.customer_id group by c.name having sum(o.amount) >= 3000;
+-------+
| name  |
+-------+
| Priya |
| Rahul |
+-------+
2 rows in set (0.00 sec)

--------------------------------------------------------------------------------------------
Q4. Count how many orders each customer placed.
Expected columns:
customer_name | total_orders

mysql> select c.name, count(o.order_id)
 as total_orders 
 from customers 
 c left join orders o 
 on o.customer_id = c.customer_id 
 group by c.name;
+-------+--------------+
| name  | total_orders |
+-------+--------------+
| Amit  |            2 |
| Priya |            2 |
| Rahul |            1 |
| Sneha |            1 |
| Karan |            1 |
+-------+--------------+
5 rows in set (0.00 sec)

mysql>

-------------------------------------------------------------

Q5. Show only customers who have never placed an order.
Hint:
LEFT JOIN
WHERE order_id IS NULL


mysql> select c.name from customers c 
left join orders o
on c.customer_id = o.customer_id
where o.order_id is null;
Empty set (0.00 sec)

----------------------------------------------
Q6. Find the highest order amount.
Expected:
4000
mysql> select c.name,max(o.amount) as max_amount from customers c left join orders o on c.customer_id = o.customer_id group by c.name;
+-------+------------+
| name  | max_amount |
+-------+------------+
| Amit  |       1200 |
| Priya |       4000 |
| Rahul |       3000 |
| Sneha |       1500 |
| Karan |        500 |
+-------+------------+
5 rows in set (0.00 sec)

mysql> SELECT MAX(amount) AS highest_order_amount
    -> FROM orders;
+----------------------+
| highest_order_amount |
+----------------------+
|                 4000 |
+----------------------+
1 row in set (0.00 sec)

mysql>
----------------------------------------------------

Q7. Find customer name who placed the highest amount order.
Use:
ORDER BY amount DESC
LIMIT 1


mysql> select c.name,o.amount from customers c inner join orders o on c.customer_id = o.customer_id order by o.amount desc limit 1;
+-------+--------+
| name  | amount |
+-------+--------+
| Priya |   4000 |
+-------+--------+
1 row in set (0.00 sec)

mysql> select c.name,o.amount from customers c left join orders o on c.customer_id = o.customer_id order by o.amount desc limit 1;
+-------+--------+
| name  | amount |
+-------+--------+
| Priya |   4000 |
+-------+--------+
1 row in set (0.00 sec)

mysql>
-------------------------------------------------

Q8. Show delivered orders only.
WHERE status = 'Delivered'



ysql> select * from orders where status = 'Delivered';
+----------+-------------+--------+------------+-----------+
| order_id | customer_id | amount | order_date | status    |
+----------+-------------+--------+------------+-----------+
|      101 |           1 |   1200 | 2026-01-10 | Delivered |
|      103 |           1 |    800 | 2026-01-15 | Delivered |
|      105 |           4 |   1500 | 2026-01-20 | Delivered |
|      107 |           2 |   4000 | 2026-02-01 | Delivered |
+----------+-------------+--------+------------+-----------+
4 rows in set (0.00 sec)

mysql>


-----------------------------------------------------------
Q9. Show total delivered amount per city.
Expected columns:
city | total_delivered_amount


mysql> select c.city ,count(o.amount) as total_delivered_amount from customers c left join orders o on o.customer_id = c.customer_id group by city;
+--------+------------------------+
| city   | total_delivered_amount |
+--------+------------------------+
| Pune   |                      3 |
| Mumbai |                      3 |
| Delhi  |                      1 |
+--------+------------------------+
3 rows in set (0.00 sec)

mysql>

-------------------------------------------------

Q10. Categorize orders.
Rules:
Amount                      Category
>= 3000
                           High
>= 1000
                         Medium
< 1000
                            Low

Expected columns:
order_id | amount | category

Use:
CASE


//this is boaring im not gonna do that 
//but for understanding to reader
//here we can use the cases and else case and by that way things will happen