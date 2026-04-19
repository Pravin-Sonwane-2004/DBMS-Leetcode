
use leetcode_collections 

Create table If Not Exists Employee (id int, name varchar(255), salary int, managerId int);
Truncate table Employee;
insert into Employee (id, name, salary, managerId) values ('1', 'Joe', '70000', '3');
insert into Employee (id, name, salary, managerId) values ('2', 'Henry', '80000', '4');
insert into Employee (id, name, salary, managerId) values ('3', 'Sam', '60000', NULL);
insert into Employee (id, name, salary, managerId) values ('4', 'Max', '90000', NULL);


leetcode 181

Create table If Not Exists Employee (id int, name varchar(255), salary int, managerId int)
Truncate table Employee
insert into Employee (id, name, salary, managerId) values ('1', 'Joe', '70000', '3')
insert into Employee (id, name, salary, managerId) values ('2', 'Henry', '80000', '4')
insert into Employee (id, name, salary, managerId) values ('3', 'Sam', '60000', NULL)
insert into Employee (id, name, salary, managerId) values ('4', 'Max', '90000', NULL)

in this question they have not given the manager table access 

ohh i was thinking that manager is different table but it is the same ok so 
we have manager access as wall as employee because manager is also employee

Input: 
Employee table:
+----+-------+--------+-----------+
| id | name  | salary | managerId |
+----+-------+--------+-----------+
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | Null      |
| 4  | Max   | 90000  | Null      |
+----+-------+--------+-----------+
Output: 
+----------+
| Employee |
+----------+
| Joe      |
+----------+


ans----------------

select e.name from 
Employee e join Employee m
on e.managerId = m.id
where e.salary > m.salary


today tool overview of index 

📌 Practice Task for You
Create a small database:
users
orders
products
order_items

Add indexes:
CREATE INDEX idx_orders_user
ON orders(user_id);

Then test with:
EXPLAIN SELECT * FROM orders WHERE user_id = 5;

Observe performance.
Create users table

EXPLAIN SELECT * FROM orders WHERE user_id = 5;

CREATE INDEX idx_orders_users
ON orders(user_id);




CREATE TABLE users (
    user_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- Create products table
CREATE TABLE products (
    product_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

-- Create orders table
CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    user_id INTEGER NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Create order_items table (junction table)
CREATE TABLE order_items (
    order_item_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    order_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


-- Populate users
INSERT INTO users (name, email) VALUES 
('Alice Smith', 'alice@example.com'), 
('Bob Jones', 'bob@example.com');

-- Populate products
INSERT INTO products (name, price) VALUES 
('Laptop', 1200.00), 
('Mouse', 25.00), 
('Keyboard', 75.00);

-- Populate orders
INSERT INTO orders (user_id) VALUES (1), (2);

-- Populate order_items
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES 
(1, 1, 1, 1200.00), -- Alice bought a Laptop
(1, 2, 1, 25.00),   -- Alice also bought a Mouse
(2, 3, 2, 75.00);   -- Bob bought two Keyboards

EXPLAIN SELECT * FROM orders WHERE user_id = 1;

181
Create table If Not Exists Person (id int, email varchar(255));
Truncate table Person;
insert into Person (id, email) values ('1', 'a@b.com');
insert into Person (id, email) values ('2', 'c@d.com');
insert into Person (id, email) values ('3', 'a@b.com');



select email from Person group by email having count(email) > 1


solving leetcode 183

Create table If Not Exists Customers (id int, name varchar(255))
Create table If Not Exists Orders (id int, customerId int)
Truncate table Customers
insert into Customers (id, name) values ('1', 'Joe')
insert into Customers (id, name) values ('2', 'Henry')
insert into Customers (id, name) values ('3', 'Sam')
insert into Customers (id, name) values ('4', 'Max')
Truncate table Orders
insert into Orders (id, customerId) values ('1', '3')
insert into Orders (id, customerId) values ('2', '1')

Table: Customers

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
+-------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table indicates the ID and name of a customer.
 

Table: Orders

+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| customerId  | int  |
+-------------+------+
id is the primary key (column with unique values) for this table.
customerId is a foreign key (reference columns) of the ID from the Customers table.
Each row of this table indicates the ID of an order and the ID of the customer who ordered it.
 

Write a solution to find all customers who never order anything.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Customers table:
+----+-------+
| id | name  |
+----+-------+
| 1  | Joe   |
| 2  | Henry |
| 3  | Sam   |
| 4  | Max   |
+----+-------+
Orders table:
+----+------------+
| id | customerId |
+----+------------+
| 1  | 3          |
| 2  | 1          |
+----+------------+
Output: 
+-----------+
| Customers |
+-----------+
| Henry     |
| Max       |
+-----------+

-- this is the query lc 183
select name as Customers  FROM Customers c
LEFT JOIN Orders o
on c.id = o.customerId
where o.customerId is null;


-- leetcode 620 --
Create table If Not Exists cinema (id int, movie varchar(255), description varchar(255), rating float(2, 1));
Truncate table cinema;
insert into cinema (id, movie, description, rating) values ('1', 'War', 'great 3D', '8.9');
insert into cinema (id, movie, description, rating) values ('2', 'Science', 'fiction', '8.5');
insert into cinema (id, movie, description, rating) values ('3', 'irish', 'boring', '6.2');
insert into cinema (id, movie, description, rating) values ('4', 'Ice song', 'Fantacy', '8.6');
insert into cinema (id, movie, description, rating) values ('5', 'House card', 'Interesting', '9.1');

select * from Cinema where (id % 2) != 0;
select * from Cinema where MOD(id , 2) != 0
# Write your MySQL query statement below
select * from Cinema c1
where (id % 2) != 0  && c1.description != "boring" order by id DESC;

-- here we had to orderby rating not by movie or not by id

# Write your MySQL query statement below
select * from Cinema c1
where (id % 2) != 0  && c1.description != "boring" order by rating DESC;

-- leetcode 596 -- 
# Write your MySQL query statement below
select class from Courses group by class having count(student) >=5



mysql> CREATE TABLE employees (
    ->     id INT,
    ->     name VARCHAR(50),
    ->     department VARCHAR(50),
    ->     salary INT
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> INSERT INTO employees VALUES
    -> (1, 'Amit', 'IT', 60000),
    -> (2, 'Rahul', 'IT', 45000),
    -> (3, 'Neha', 'IT', 70000),
    -> (4, 'Priya', 'HR', 50000),
    -> (5, 'Ankit', 'HR', 55000),
    -> (6, 'Simran', 'HR', 65000),
    -> (7, 'Karan', 'Finance', 40000),
    -> (8, 'Riya', 'Finance', 30000),
    -> (9, 'Arjun', 'Finance', 45000),
    -> (10, 'Sneha', 'Finance', 80000);
Query OK, 10 rows affected (0.01 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> describe employees
    -> ;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| id         | int         | YES  |     | NULL    |       |
| name       | varchar(50) | YES  |     | NULL    |       |
| department | varchar(50) | YES  |     | NULL    |       |
| salary     | int         | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> select department, count(*) from employees where salary > 40000  group by department having salary (*) > 2;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '*) > 2' at line 1
mysql> select department, count(*) from employees where salary > 40000  group by department having count(*) > 2;
+------------+----------+
| department | count(*) |
+------------+----------+
| IT         |        3 |
| HR         |        3 |
+------------+----------+
2 rows in set (0.00 sec)

mysql>


leetcode 577

# Write your MySQL query statement below
select e.name, b.bonus from Employee e 
left join Bonus b on e.empId  = b.empId 
where b.bonus < 1000 || b.bonus is null

leetcode 1068


Create table If Not Exists Sales (sale_id int, product_id int, year int, quantity int, price int)
Create table If Not Exists Product (product_id int, product_name varchar(10))
Truncate table Sales
insert into Sales (sale_id, product_id, year, quantity, price) values ('1', '100', '2008', '10', '5000')
insert into Sales (sale_id, product_id, year, quantity, price) values ('2', '100', '2009', '12', '5000')
insert into Sales (sale_id, product_id, year, quantity, price) values ('7', '200', '2011', '15', '9000')
Truncate table Product
insert into Product (product_id, product_name) values ('100', 'Nokia')
insert into Product (product_id, product_name) values ('200', 'Apple')
insert into Product (product_id, product_name) values ('300', 'Samsung')



