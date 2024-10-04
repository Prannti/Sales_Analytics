select count(*) from sales.customers;
select * from sales.transactions limit 5;
select * from sales.transactions where market_code="Mark001";
select count(*) from sales.transactions where market_code="Mark001";
select * from sales.transactions where currency="USD";
#transactions in 2020, we will do inner join
select sales.transactions.*, sales.date.* from sales.transactions INNER JOIN sales.date ON sales.transactions.order_date=sales.date.date where sales.date.year=2020;
#total revenue in year 2020
select sum(sales.transactions.sales_amount) from sales.transactions INNER JOIN sales.date ON sales.transactions.order_date=sales.date.date where sales.date.year=2020;