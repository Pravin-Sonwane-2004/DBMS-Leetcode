
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