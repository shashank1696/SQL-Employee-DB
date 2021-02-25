/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [EmpID]
      ,[EmpFname]
      ,[EmpLname]
      ,[Department]
      ,[Project]
      ,[Address]
      ,[DOB]
      ,[Gender]
  FROM [Test].[dbo].[EmployeeInfo]

 select * from EmployeePosition
 select * from EmployeeInfo

 --Write a query to fetch top N records.
 select * from EmployeePosition order by salary desc LIMIT N

 --Write a query find number of employees whose DOB is between 02/05/1970 to 31/12/1975 and are grouped according to gender
 select count(EmpID), Gender from EmployeeInfo 
 where left(DOB,10) BETWEEN '02/05/1970' AND '31/12/1975' group by gender;

--Q12. Write a query to fetch all the records from the EmployeeInfo table ordered by EmpLname in
--descending order and Department in the ascending order.
select * from EmployeeInfo order by Department asc, EmpLname desc;

-- Write a query to fetch all employees who also hold the managerial position.
select * from EmployeePosition e1 inner join EmployeeInfo e2 on e1.EmpID = e2.EmpID where e1.EmpPosition = 'Manager';

--Write a query to fetch the department-wise count of employees sorted by department’s count in ascending order.
select count(EmpID), Department from  EmployeeInfo group by Department order by Department

select EmpID from (select ROW_NUMBER as row, EmpID from EmployeeInfo) where MOD(row,2)=1;

--Write a SQL query to retrieve employee details from EmployeeInfo table who have a date of joining in the EmployeePosition table.
select * from EmployeeInfo e1 where EXISTS (select e2.DateOfJoining, e2.EmpID from EmployeePosition e2 where e1.EmpID = e2.EmpID);

--Write a query to retrieve two minimum and maximum salaries from the EmployeePosition table.
select max(Salary) as sal from EmployeePosition 
where Salary < (select MAX(salary) from EmployeePosition)

select distinct salary from EmployeePosition e1 where 2 >= (select count(distinct(salary)) from EmployeePosition e2
where e1.EmpID >= e2.EmpID ) order by e1.Salary desc;

select top 30 PERCENT * from EmployeeInfo