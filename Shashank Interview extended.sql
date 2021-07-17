----------------Q1
select *, ROW_NUMBER() over( ORDER BY Employee_Salary desc) as Rank 
from Emptab
------Where manager and emp are same
select DISTINCT(e1.Employee_Name), e1.Employee_Salary from Emptab e1, Emptab e2 
where e1.Employee_Name = e2.Manager_Name

select Employee_Id, Employee_Salary,
CAST(Employee_Salary as decimal(18,2))*100/SUM(Employee_Salary) over() as PCt from Emptab
where Manager_Name = Employee_Name group by Employee_Id, Employee_Salary;

select Employee_Id, Employee_Name, Employee_Salary,
Round(PERCENT_RANK()
OVER (ORDER BY Employee_Salary desc),2) as Pr from Emptab
ORDER BY Pr,Employee_Salary

--------------Q4
select e1.Emp_Id as Manager_ID, Emp_name as Manager, 
e2.Avg_sal as Average_salary_under_manager 
from Empman as e1 
INNER JOIN 
(select distinct Manager_Id as Emp_ID, AVG(salary) over (PARTITION by manager_id) as Avg_sal
from Empman where Manager_Id>0) as e2
ON e1.Emp_Id = e2.Emp_ID

--------------Q2

---a)
select  top 5 r.category, city, r.amount, AVG(r.amount) OVER(Partition by city) as Avg_salary_for_category  from  User1 u
FULL outer join Rides r
on 
u.id = r.id group by u.city, amount,  category order by amount desc;
select * from Rides

----------Q3

select  AVG(Date_diff) OVER(partition by has_reaction) as Avg_no_of_day_first_convo from(
select  sender_id, has_reaction ,CONVERT(DATE, Reaction.Date) as Date, DATEDIFF(DAY,LAG(CONVERT(DATE, Reaction.Date),1 ) 
OVER( ORDER BY CONVERT(DATE, Reaction.Date)asc),CONVERT(DATE, Reaction.Date)) as Date_diff
from Reaction)b

----------------------------------
