Enter password: ****
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.46 MySQL Community Server - GPL

Copyright (c) 2000, 2026, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE TABLE Products (
    ->     product_id INT PRIMARY KEY,
    ->     product_name VARCHAR(50),
    ->     category VARCHAR(50),
    ->     price INT
    -> );
ERROR 1046 (3D000): No database selected
mysql>
mysql> INSERT INTO Products VALUES
    -> (1, 'Laptop', 'Electronics', 55000),
    -> (2, 'Mouse', 'Electronics', 700),
    -> (3, 'Keyboard', 'Electronics', 1500),
    -> (4, 'Chair', 'Furniture', 3500),
    -> (5, 'Table', 'Furniture', 7000),
    -> (6, 'Notebook', 'Stationery', 80);
ERROR 1046 (3D000): No database selected
mysql>
mysql> CREATE TABLE Sales (
    ->     sale_id INT PRIMARY KEY,
    ->     product_id INT,
    ->     quantity INT,
    ->     sale_date DATE,
    ->     FOREIGN KEY (product_id) REFERENCES Products(product_id)
    -> );
ERROR 1046 (3D000): No database selected
mysql>
mysql> INSERT INTO Sales VALUES
    -> (201, 1, 2, '2026-02-01'),
    -> (202, 2, 10, '2026-02-02'),
    -> (203, 3, 5, '2026-02-03'),
    -> (204, 4, 3, '2026-02-05'),
    -> (205, 5, 1, '2026-02-06'),
    -> (206, 2, 4, '2026-02-07'),
    -> (207, 6, 20, '2026-02-08');
ERROR 1046 (3D000): No database selected
mysql>
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
16 rows in set (0.03 sec)

mysql> use sql_prctice;
ERROR 1049 (42000): Unknown database 'sql_prctice'
mysql> use sql_practice;
Database changed
mysql> CREATE TABLE Products (
    ->     product_id INT PRIMARY KEY,
    ->     product_name VARCHAR(50),
    ->     category VARCHAR(50),
    ->     price INT
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql>
mysql> INSERT INTO Products VALUES
    -> (1, 'Laptop', 'Electronics', 55000),
    -> (2, 'Mouse', 'Electronics', 700),
    -> (3, 'Keyboard', 'Electronics', 1500),
    -> (4, 'Chair', 'Furniture', 3500),
    -> (5, 'Table', 'Furniture', 7000),
    -> (6, 'Notebook', 'Stationery', 80);
Query OK, 6 rows affected (0.01 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql>
mysql> CREATE TABLE Sales (
    ->     sale_id INT PRIMARY KEY,
    ->     product_id INT,
    ->     quantity INT,
    ->     sale_date DATE,
    ->     FOREIGN KEY (product_id) REFERENCES Products(product_id)
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql>
mysql> INSERT INTO Sales VALUES
    -> (201, 1, 2, '2026-02-01'),
    -> (202, 2, 10, '2026-02-02'),
    -> (203, 3, 5, '2026-02-03'),
    -> (204, 4, 3, '2026-02-05'),
    -> (205, 5, 1, '2026-02-06'),
    -> (206, 2, 4, '2026-02-07'),
    -> (207, 6, 20, '2026-02-08');
Query OK, 7 rows affected (0.00 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql>
mysql> show Products,show sales;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'Products,show sales' at line 1
mysql> select * from products'
    '> ';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''
'' at line 1
mysql> select * from products;
+------------+--------------+-------------+-------+
| product_id | product_name | category    | price |
+------------+--------------+-------------+-------+
|          1 | Laptop       | Electronics | 55000 |
|          2 | Mouse        | Electronics |   700 |
|          3 | Keyboard     | Electronics |  1500 |
|          4 | Chair        | Furniture   |  3500 |
|          5 | Table        | Furniture   |  7000 |
|          6 | Notebook     | Stationery  |    80 |
+------------+--------------+-------------+-------+
6 rows in set (0.00 sec)

mysql> select * from Sales;
+---------+------------+----------+------------+
| sale_id | product_id | quantity | sale_date  |
+---------+------------+----------+------------+
|     201 |          1 |        2 | 2026-02-01 |
|     202 |          2 |       10 | 2026-02-02 |
|     203 |          3 |        5 | 2026-02-03 |
|     204 |          4 |        3 | 2026-02-05 |
|     205 |          5 |        1 | 2026-02-06 |
|     206 |          2 |        4 | 2026-02-07 |
|     207 |          6 |       20 | 2026-02-08 |
+---------+------------+----------+------------+
7 rows in set (0.00 sec)

====================================================================================

Q11. Show sales with product names.
Expected columns:
sale_id | product_name | quantity | price

mysql> select s.sale_id,p.product_name,s.quantity,p.price from Products p left join Sales s on s.product_id = p.product_id;
+---------+--------------+----------+-------+
| sale_id | product_name | quantity | price |
+---------+--------------+----------+-------+
|     201 | Laptop       |        2 | 55000 |
|     202 | Mouse        |       10 |   700 |
|     206 | Mouse        |        4 |   700 |
|     203 | Keyboard     |        5 |  1500 |
|     204 | Chair        |        3 |  3500 |
|     205 | Table        |        1 |  7000 |
|     207 | Notebook     |       20 |    80 |
+---------+--------------+----------+-------+
7 rows in set (0.00 sec)

mysql> select s.sale_id,p.product_name,s.quantity,p.price from Products p left join Sales s on s.product_id = p.product_id order by p.product_name asc;
+---------+--------------+----------+-------+
| sale_id | product_name | quantity | price |
+---------+--------------+----------+-------+
|     204 | Chair        |        3 |  3500 |
|     203 | Keyboard     |        5 |  1500 |
|     201 | Laptop       |        2 | 55000 |
|     202 | Mouse        |       10 |   700 |
|     206 | Mouse        |        4 |   700 |
|     207 | Notebook     |       20 |    80 |
|     205 | Table        |        1 |  7000 |
+---------+--------------+----------+-------+
7 rows in set (0.00 sec)

-------------------------------------------------------------------------

Q12. Calculate total amount for every sale.
Formula:
quantity * price

Expected columns:
sale_id | product_name | quantity | price | total_amount

mysql> SELECT
    ->     p.product_name,
    ->     s.sale_id,
    ->     s.quantity,
    ->     p.price,
    ->     (s.quantity * p.price) AS total_amount
    -> FROM Products p
    -> LEFT JOIN sales s
    ->     ON p.product_id = s.product_id
    -> ORDER BY s.quantity ASC;
+--------------+---------+----------+-------+--------------+
| product_name | sale_id | quantity | price | total_amount |
+--------------+---------+----------+-------+--------------+
| Table        |     205 |        1 |  7000 |         7000 |
| Laptop       |     201 |        2 | 55000 |       110000 |
| Chair        |     204 |        3 |  3500 |        10500 |
| Mouse        |     206 |        4 |   700 |         2800 |
| Keyboard     |     203 |        5 |  1500 |         7500 |
| Mouse        |     202 |       10 |   700 |         7000 |
| Notebook     |     207 |       20 |    80 |         1600 |
+--------------+---------+----------+-------+--------------+
7 rows in set (0.00 sec)

mysql>

-- this was quite frrestrating but i did managed to get through this