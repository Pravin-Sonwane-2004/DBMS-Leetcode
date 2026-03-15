
-- use leetcode_collections 

-- Create table If Not Exists Employee (id int, name varchar(255), salary int, managerId int);
-- Truncate table Employee;
-- insert into Employee (id, name, salary, managerId) values ('1', 'Joe', '70000', '3');
-- insert into Employee (id, name, salary, managerId) values ('2', 'Henry', '80000', '4');
-- insert into Employee (id, name, salary, managerId) values ('3', 'Sam', '60000', NULL);
-- insert into Employee (id, name, salary, managerId) values ('4', 'Max', '90000', NULL);


-- leetcode 181

-- Create table If Not Exists Employee (id int, name varchar(255), salary int, managerId int)
-- Truncate table Employee
-- insert into Employee (id, name, salary, managerId) values ('1', 'Joe', '70000', '3')
-- insert into Employee (id, name, salary, managerId) values ('2', 'Henry', '80000', '4')
-- insert into Employee (id, name, salary, managerId) values ('3', 'Sam', '60000', NULL)
-- insert into Employee (id, name, salary, managerId) values ('4', 'Max', '90000', NULL)

-- in this question they have not given the manager table access 

-- ohh i was thinking that manager is different table but it is the same ok so 
-- we have manager access as wall as employee because manager is also employee

-- Input: 
-- Employee table:
-- +----+-------+--------+-----------+
-- | id | name  | salary | managerId |
-- +----+-------+--------+-----------+
-- | 1  | Joe   | 70000  | 3         |
-- | 2  | Henry | 80000  | 4         |
-- | 3  | Sam   | 60000  | Null      |
-- | 4  | Max   | 90000  | Null      |
-- +----+-------+--------+-----------+
-- Output: 
-- +----------+
-- | Employee |
-- +----------+
-- | Joe      |
-- +----------+


-- ans
-- select e.name from 
-- Employee e join Employee m
-- on e.managerId = m.id
-- where e.salary > m.salary


-- today tool overview of index 

-- -- 📌 Practice Task for You
-- -- Create a small database:
-- -- users
-- -- orders
-- -- products
-- -- order_items

-- -- Add indexes:
-- -- CREATE INDEX idx_orders_user
-- -- ON orders(user_id);

-- -- Then test with:
-- -- EXPLAIN SELECT * FROM orders WHERE user_id = 5;

-- -- Observe performance.
-- -- Create users table

-- EXPLAIN SELECT * FROM orders WHERE user_id = 5;

-- CREATE INDEX idx_orders_users
-- ON orders(user_id);




-- CREATE TABLE users (
--     user_id INTEGER PRIMARY KEY AUTO_INCREMENT,
--     name VARCHAR(100) NOT NULL,
--     email VARCHAR(100) UNIQUE NOT NULL
-- );

-- -- Create products table
-- CREATE TABLE products (
--     product_id INTEGER PRIMARY KEY AUTO_INCREMENT,
--     name VARCHAR(100) NOT NULL,
--     price DECIMAL(10, 2) NOT NULL
-- );

-- -- Create orders table
-- CREATE TABLE orders (
--     order_id INTEGER PRIMARY KEY AUTO_INCREMENT,
--     user_id INTEGER NOT NULL,
--     order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     FOREIGN KEY (user_id) REFERENCES users(user_id)
-- );

-- -- Create order_items table (junction table)
-- CREATE TABLE order_items (
--     order_item_id INTEGER PRIMARY KEY AUTO_INCREMENT,
--     order_id INTEGER NOT NULL,
--     product_id INTEGER NOT NULL,
--     quantity INTEGER NOT NULL,
--     unit_price DECIMAL(10, 2) NOT NULL,
--     FOREIGN KEY (order_id) REFERENCES orders(order_id),
--     FOREIGN KEY (product_id) REFERENCES products(product_id)
-- );


-- -- Populate users
-- INSERT INTO users (name, email) VALUES 
-- ('Alice Smith', 'alice@example.com'), 
-- ('Bob Jones', 'bob@example.com');

-- -- Populate products
-- INSERT INTO products (name, price) VALUES 
-- ('Laptop', 1200.00), 
-- ('Mouse', 25.00), 
-- ('Keyboard', 75.00);

-- -- Populate orders
-- INSERT INTO orders (user_id) VALUES (1), (2);

-- -- Populate order_items
-- INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES 
-- (1, 1, 1, 1200.00), -- Alice bought a Laptop
-- (1, 2, 1, 25.00),   -- Alice also bought a Mouse
-- (2, 3, 2, 75.00);   -- Bob bought two Keyboards

-- EXPLAIN SELECT * FROM orders WHERE user_id = 1;


