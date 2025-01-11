create database pizza_sales_db ;


use pizza_sales_db;





----------- 1. Total Revenue 


SELECT 
    ROUND(SUM(total_price), 3) AS total_revenue
FROM
    pizza_sales;








----------- 2. Average spent per order

SELECT 
    ROUND(SUM(total_price) / COUNT(DISTINCT order_id),
            4) AS Average_Spent
FROM
    pizza_sales;
    
    
    
    
    
    
 ----------- 3.   Total Pizza Sold 
 
SELECT 
    SUM(quantity) AS Total_pizzas_sold
FROM
    pizza_sales;
    
    
    
    
    
    
    ----------- 4. Total Orders Placed
    
   SELECT 
    COUNT(DISTINCT order_id) AS Total_orders
FROM
    pizza_sales;
    
    
    
    
    
    
    
    ----------- 5. Average pizza per order 
    
    
    
    SELECT 
    (ROUND(SUM(quantity) / COUNT(DISTINCT order_id),
            5)) AS Average_Pizza_ordered
FROM
    pizza_sales;
    
    
    
    
    
    
    
    
 ----------- 6. Daily basis Orders
 
 
 SELECT 
    DAYNAME(order_date) AS Order_day,
    COUNT(DISTINCT order_id) AS Total_order
FROM
    pizza_sales
GROUP BY Order_day
ORDER BY Total_order DESC;







----------- 7. Hourly Trend 


SELECT 
    EXTRACT(HOUR FROM order_time) as Order_hours ,
    COUNT(DISTINCT order_id) AS Total_order
FROM
    pizza_sales
GROUP BY Order_hours 
ORDER BY Total_order DESC;








----------- 8. Category Wise Sales Percentage Contribution


SELECT 
    pizza_category,
    SUM(total_price) AS Total_sales,
    ROUND(SUM(total_price) * 100 / (SELECT 
                    SUM(total_price)
                FROM
                    pizza_sales),
            3) AS percentage_of_sales
FROM
    pizza_sales
GROUP BY pizza_category
ORDER BY percentage_of_sales;








----------- 9. Size wise Sales percentage contribution



SELECT pizza_size , sum(total_price) as total_sales ,round(sum(total_price) * 100 / (select sum(total_price) from pizza_sales),3) as percentage_of_sales 
from pizza_sales 
group by pizza_size order by percentage_of_sales desc ;







----------- 10. Category wise total pizzas sold


SELECT 
    pizza_category, SUM(quantity) AS total_sales
FROM
    pizza_sales
GROUP BY pizza_category
ORDER BY total_sales DESC; 







----------- 11. Top 5 Best selling pizzas


SELECT 
    pizza_name, SUM(quantity) AS Total_pizzas_sold
FROM
    pizza_sales
GROUP BY pizza_name
ORDER BY SUM(quantity) DESC
LIMIT 5;





----------- 12. Top 5 Least selling pizzas


SELECT 
    pizza_name, SUM(quantity) AS Total_pizzas_sold
FROM
    pizza_sales
GROUP BY pizza_name
ORDER BY SUM(quantity) 
limit 5 ;




