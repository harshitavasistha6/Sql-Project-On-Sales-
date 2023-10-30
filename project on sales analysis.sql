create database sales;
use sales;
 create table salestable
 (sales_id int primary key,
 sales_date date,
 sales_time varchar(20),
 customer_id int,
 product_id int,
 sales_amount int);
 
 drop table salestable;
 
 insert into salestable values
 (1,"2022-01-01","09:00;00",1,1,100),
 (2,"2022-01-02","10:00;00",2,2,200),
 (3,"2022-01-03","11:00;00",3,3,300),
 (4,"2022-01-04","12:00;00",4,4,400),
 (5,"2022-01-05","13:00;00",5,5,500),
 (6,"2022-02-01","09:00;00",1,1,100),
 (7,"2022-02-02","10:00;00",2,2,200),
 (8,"2022-02-03","11:00;00",3,3,300),
 (9,"2022-02-04","12:00;00",4,4,400),
 (10,"2022-02-05","13:00;00",5,5,500),
 (11,"2023-01-01","09:00;00",1,1,100),
 (12,"2023-01-02","10:00;00",2,2,200),
 (13,"2023-01-03","11:00;00",3,3,300),
 (14,"2023-01-04","12:00;00",4,4,400),
 (15,"2023-01-05","13:00;00",5,5,500);
 
 create table product
 (product_id int,
 product_name varchar(20),
 prize int,
 category_id int);
 
 insert into product values
 (1,"A",50,1),
 (2,"B",100,2),
 (3,"C",150,3),
 (4,"D",200,4),
 (5,"E",250,5);
 
 create table customer_table
 (customer_id int,
 customer_name  varchar(20),
 email varchar(30),
 phone varchar(10));
 
 insert into customer_table values
 (1,"jhone","jhone@123","3456789"),
 (2,"harshita","harshi#1233","98765678"),
 (3,"kanak","kannak$123","98074466"),
 (4,"pooja","pooja54#","6753245");
 
 select * from salestable;
 select * from product;
 select * from customer_table;
 
#Question 1: What is the total sales revenue for each year
select year(sales_date),sum(sales_amount) from salestable group by year(sales_date);

#Question 2: What is the average sales revenue per month for the year 2022?
select month(sales_date),avg(sales_amount) from salestable where year(sales_date)=2022 group by month(sales_date);

 #Question 3: Who are the top 5 customers based on total sales revenue?
 select c. customer_name,sum(s.sales_amount) as total_revenu
 from salestable s
 inner join customer_table c on s.customer_id=c.customer_id 
 group by c.customer_name 
 order by  total_revenu desc;
 
#Question 4: Calculate the total sales amount and the number of sales per month?
 select month(sales_date),sum(sales_amount) as higest_sale from salestable  group by month(sales_date) order by higest_sale ;
 
#5.  which product name who made highest sales
 select p.product_name,sum(s.sales_amount) as higest_product_sales
 from salestable s 
 inner join product p on s.product_id =p.product_id 
 group by p.product_name 
 order by higest_product_sales  desc;
 
#Question 6: Get the top 5 customers who made the highest total sales?
 select customer_id ,sum(sales_amount) as higest_sale from salestable  group by customer_id order by higest_sale desc;


 #Question 7: Get the total sales amount and the number of sales for each category? 
select  p.category_id,sum(s.sales_amount)as total_sum ,count(s.sales_amount) as total_sales
from salestable s
inner join product p on s.product_id =p.product_id
group by p.category_id;

#question 8:  Who are the top 5 customers based on total sales revenue and total product name ?
 select c. customer_name,p.product_name ,sum(s.sales_amount),count(s.sales_amount) as toatl_sale
 from salestable  s 
 inner join product p on s.product_id=p.product_id 
 inner join customer_table as c on s.customer_id=c.customer_id 
 group by c.customer_name, p.product_name;
 
 #9 find the 50% record
 select * from salestable where sales_id <=(select count( sales_id)/2 from salestable);
 
 #10  like function
select * from customer_table where  customer_name like "%e";
select * from customer_table where customer_name like "e%";
select * from customer_table where customer_name like "_a%";
select * from customer_table where customer_name like "%_a";

select * from salestable;
select * from product;

#11. find the second heigest sale of product
select max(sales_amount) from salestable;
select max(sales_amount) from salestable where sales_amount != (select max(sales_amount) from salestable);

#12.  count total sale of product with name and show what is the sum of every product 
select  p.product_name,count(s.sales_amount) as product_sales,
sum( p.prize) as total_prize  
from salestable  s inner join product p on s.product_id=p.product_id
group by p.product_name  ;

# join two tables 
select * from salestable  s inner join product p on s.product_id=p.product_id;



   









 
 
 
 

 



 

 




 
 
 
 
