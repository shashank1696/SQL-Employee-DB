
USE Test
GO
CREATE TABLE HumanResource
(
Phone varchar(20),
PlaceName varchar (50),
County varchar (50),
City varchar (50),
States varchar (50),
Zip  varchar (50),
Region varchar (50),
MonthofJoining  varchar (50),
MonthNameofJoining varchar (50),
ShortMonth varchar (50),
DayofJoining  varchar (50),
DOWofJoining varchar (50),
ShortDOW varchar (50),
AgeinCompany  varchar (50),
Salary varchar (50),
EmpID varchar (50) NOT NULL,
NamePrefix varchar (50),
FirstName varchar (50),
MiddleInitial varchar (50),
LastName varchar (50),
Gender varchar (50),
EMail varchar (255))
GO


BULK INSERT HumanResource
FROM 'H:\SQL\Data\Human Resources sample.csv'
WITH
(

    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n'  --Use to shift the control to next row
)

select top 40 PERCENT [Salary], EmpID from HumanResource where DATALENGTH(Salary)>0 order by Salary desc;

delete from HumanResource
from (select top 1 * from HumanResource) dd

select * from HumanResource

--Write a query to fetch the PlaceName from the HumanResource table in upper case and use the ALIAS name as PName.
select UPPER(PlaceName) as PName from HumanResource

--Write a query to fetch the number of employees working in the city ‘ashland’.
select COUNT(EmpID) as Number_of_Emps
from HumanResource where city = 'ashland'

--Write a query to get the current date.
select getdate();

--Write a query to retrieve the first four characters of  EmpLname from the HumanResource table
select SUBSTRING(LastName,1,4) from HumanResource;

select r1.manager, r2.manager from rides r1, rides r2 
where r1.manager = r2.manager and r2.manager IS NOT NULL;

select * from HumanResource

--Write a query to fetch only the email name(string before brackets) 
--from the Address column of EmployeeInfo table.
select SUBSTRING(EMail, 0, CHARINDEX('@',EMail))
from HumanResource

select SUBSTRING(Phone,0,CHARINDEX('-',Phone))
 from HumanResource

 select EmpID from HumanResource where 
 MonthofJoining BETWEEN '10' AND '11'

 select count(EmpID) from HumanResource
 where EmpID BETWEEN '500000' AND '600000'
 group by ShortDOW

 
