-- Create a new database named 'foodie_app' 
CREATE DATABASE foodie_app;
SHOW DATABASES ;
USE foodie_app;

select * from users limit 5;
alter table users drop column created_at;
-- second highest salary without limit
select username, salary from users where salary =(select max(salary) from users where salary < (select max(salary)from users) );
-- find department having highest average salary 
SELECT department,
       AVG(salary) AS average_salary
FROM employee
GROUP BY department
HAVING AVG(salary) = (
    SELECT MAX(avg_salary)
    FROM (
        SELECT AVG(salary) AS avg_salary
        FROM employee
        GROUP BY department
    ) AS dept_avg
);

--- **using join highest pain employee in each dept ** -- join quaries
SELECT e.employee_name,
       e.department,
       e.salary
FROM employee e
JOIN (
    SELECT department,
           MAX(salary) AS max_salary
    FROM employee
    GROUP BY department
) m
ON e.department = m.department
AND e.salary = m.max_salary;
-- third highest salary with name 
select employee_name , salary from employee where salary = 
(select max(salary) from employee where salary < (select max(salary) from employee where salary < (select max(salary) from employee where salary)));

-- case when 
SELECT employee_name,
       salary,
       CASE
           WHEN salary >= 80000 THEN 'High'
           WHEN salary >= 60000 THEN 'Medium'
           ELSE 'Low'
       END AS salary_grade
FROM employee;
---- 
UPDATE employee
SET salary =
    CASE
        WHEN department = 'IT' THEN salary * 1.20
        WHEN department = 'HR' THEN salary * 1.10
        WHEN department = 'Sales' THEN salary * 1.05
        ELSE salary
    END;
    
    
    1. What is a Window Function        ← YOU ARE HERE
       ↓
2. OVER()
       ↓
3. ORDER BY
       ↓
4. PARTITION BY
       ↓
5. ROW_NUMBER()
       ↓
6. RANK()
       ↓
7. DENSE_RANK()
       ↓
8. Difference: ROW_NUMBER vs RANK vs DENSE_RANK
       ↓
9. 2nd / 3rd highest salary
       ↓
10. Top N employees per department
       ↓
11. Running totals
       ↓
12. LAG() / LEAD()