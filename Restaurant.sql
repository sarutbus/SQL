.open restaurant.db
.mode column

insert into customers values
(1,'Bus',24,'M'),
(2,'Sabu',21,'F'),
(3,'Oat',23,'M'),
(4,'Au',24,'M'),
(5,'Bumbim',30,'F') 

insert into invoices values
(1,'2023-05-23',50.45,1),
(2,'2023-04-20',142.5,1),
(3,'2023-01-14',1240.1,2),
(4,'2022-05-20',2400.56,2),
(5,'2022-10-15',2542.65,3),
(6,'2023-02-05',124.6,3),
(7,'2022-01-07',120,4),
(8,'2023-05-06',50,4),
(9,'2023-02-05',60,5),
(10,'2023-10-04',78.45,5)

insert into employee values
(1,'David','Cashier',1),
(2,'Jame','Waiter',3),
(3,'Peter','Waiter',1),
(4,'John','Cashier',3),
(5,'Alice','Sale',2),
(6,'Pond','Sale',2) 

insert into branch values
(1,'Bangkok','Thailand'),
(2,'Berlin','Germany'),
(3,'Paris','France') 

--With Common Table Expression
with sub1 as
(select * from customers
  where gender ='M'),
sub2 as (
  select * from invoices
  where strftime('%Y',Date) = '2022'
)

select sub1.name,
        sub1.age,
        sub2.total as Total_bill
from sub1 join sub2
on sub1.id = sub2.id; 

--Aggregate Function
select 
  bra.country,
  bra.state,
  cast(sum(inv.total) as int) as SUM_REV
  from invoices as inv
    join employee as emp
    on inv.employeeID = emp.employeeID
      join branch as bra
      on emp.BranchID = bra.BranchID
where bra.country = 'Thailand';

--Sub query
select sub_2.Position,
      sum(sub_1.total) as SUM_REV
  from
  (select * from invoices
    where strftime('%Y',Date) = '2023') as sub_1
  join (select * from employee
  where Position ='Waiter') as sub_2
  on sub_1.employeeID = sub_2.employeeID;

--CASE When
 Select 
  invoiceid,total,
  case when total <= 100 Then 'Low'
  when total <=500 Then 'Medium'
  else 'High'
end as segment
from invoices; 

--Having country
select 
  bra.country,
  count(emp.employeeID) as No_employee
from employee as emp
join branch as bra
on emp.BranchID = bra.BranchID
group by bra.country
Having bra.country in ('France', 'Thailand');



    
  
