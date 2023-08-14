----Combine Two Tables--
SELECT 
  p.firstname, 
  p.lastname, 
  a.city, 
  a.state 
FROM 
  person p 
  JOIN address a on p.personid = a.personid;

 ----176. Second Highest Salary--
 SELECT 
  MAX(salary) AS SecondHighestSalary 
FROM 
  employee 
WHERE 
  salary < (
    SELECT 
      MAX(salary) 
    FROM 
      employee
  )

 
 -----Nth highest salary------
 
 CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT BEGIN 
SET 
  N = N - 1;
RETURN (
  IFNULL(
    (
      SELECT 
        DISTINCT Salary 
      FROM 
        Employee 
      ORDER BY 
        Salary DESC 
      LIMIT 
        1, N
    ), 
    NULL
  )
);
END

---------178. Rank Scores

SELECT 
  score, 
  DENSE_RANK() OVER(
    ORDER BY 
      score DESC
  ) AS 'rank' 
FROM 
  Scores;

--------180. Consecutive Numbers
 
select 
  distinct l1.num as ConsecutiveNums 
from 
  Logs l1 
  join Logs l2 on l2.id = l1.id + 1 
  and l2.num = l1.num 
  join Logs l3 on l3.id = l1.id + 2 
  and l3.num = l1.num
  
 ----------181. Employees Earning More Than Their Managers
  
  select 
  e1.name as Employee 
from 
  Employee e1 
  join Employee e2 on e1.managerId = e2.id 
  and e1.salary > e2.salary

-----------182. Duplicate Emails
 
 select 
  email as Email 
from 
  (
    select 
      email, 
      count(*) as c 
    from 
      Person 
    group by 
      email
  ) temp 
where 
  temp.c > 1;


--------------183. Customers Who Never Order
 
 SELECT 
  name AS Customers 
FROM 
  customers c 
  LEFT JOIN orders o ON c.id = o.customerid 
WHERE 
  o.id IS NULL;

 
 -------------196. Delete Duplicate Emails
 
 DELETE p1 
FROM 
  Person p1 
  JOIN Person p2 ON p1.email = p2.email 
  AND p1.id > p2.id;

 -------------197. Rising Temperature
 
 SELECT
  w1.id AS Id
FROM
  Weather w1
JOIN
  Weather w2 ON w1.recordDate = w2.recordDate + INTERVAL 1 DAY
            AND w1.temperature > w2.temperature;

           
 --------------511. Game Play Analysis I
 --------------512. Game Play Analysis II
 --------------534. Game Play Analysis III
 --------------570. Managers with at Least 5 Direct Reports
 
 