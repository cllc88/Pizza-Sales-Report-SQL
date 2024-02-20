/*

Queries used for PowerBI 

1-5 KPI'S

*/


-- 1.

SELECT SUM(total_Price) AS Total_Revenue FROM pizza_sales_excel_file

-- 2.

SELECT SUM(total_price)/ COUNT(DISTINCT order_id) AS Avg_Order_Value FROM 
pizza_sales_excel_file

--3.

SELECT SUM(quantity) AS Total_Pizza_Sold FROM pizza_sales_excel_file

--4.

SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales_excel_file

--5.

SELECT CAST(CAST(SUM(quantity) AS DECIMAL (10,2)) /
CAST(COUNT(DISTINCT order_id) AS DECIMAL (10,2)) AS DECIMAL (10,2)) AS
Avg_Pizzas_Per_Order FROM pizza_sales_excel_file


--SQL Queries 

--Daily Trend For Total Orders

SELECT DATENAME (DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS
Total_Orders
FROM pizza_sales_excel_file
GROUP BY DATENAME(DW, order_date)

--Monthly Trend for Orders

SELECT DATENAME(MONTH, order_date) AS Month_Name, COUNT(DISTINCT order_id) AS
Total_Orders
FROM pizza_sales_excel_file
GROUP BY DATENAME(MONTH, order_date)

--% Of Sales by Pizza Category

SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL (10,2)) AS Total_Revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM (total_price) FROM pizza_sales_excel_file) AS
decimal (10,2)) AS PCT
FROM pizza_sales_excel_file
GROUP BY pizza_category 

--% Of Sales by Pizza Size

SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales_excel_file
GROUP BY pizza_size
ORDER BY pizza_size

--Total Pizzas Sold by Pizza Category

SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC

--Top 5 Pizzas by Revenue

SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales_excel_file
GROUP BY pizza_name
ORDER BY Total_Revenue DESC

--Bottom 5 Pizzas by Revenue

SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales_excel_file
GROUP BY pizza_name
ORDER BY Total_Revenue ASC

--Top 5 Pizzas by Quantity

SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Quantity FROM pizza_sales_excel_file
GROUP BY pizza_name
ORDER BY Total_Quantity DESC

--Bottom 5 Pizzas by Quantity

SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales_excel_file
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC

--Top 5 Pizzas by Total Orders 

SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales_excel_file
GROUP BY pizza_name
ORDER BY Total_Orders DESC

--Bottom 5 Pizzas By Total Orders

SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales_excel_file
GROUP BY pizza_name
ORDER BY Total_Orders ASC





