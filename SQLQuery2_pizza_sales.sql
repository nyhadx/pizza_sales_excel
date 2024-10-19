SELECT *
FROM pizza_sales

SELECT SUM(total_price) AS Total_Revenue
FROM pizza_sales

SELECT SUM(total_price)/COUNT(DISTINCT order_id) AS Avg_Order_Value
FROM pizza_sales

SELECT SUM(quantity) AS Quantity
FROM pizza_sales

SELECT COUNT(DISTINCT order_id) AS Total_order
FROM pizza_sales

SELECT CAST(SUM(quantity) AS decimal)/CAST(COUNT(DISTINCT order_id)AS decimal)AS Average_Pizza_Order
FROM pizza_sales

--DAILY TREND
SELECT DATENAME(WEEKDAY,order_date) AS week_day, COUNT(DISTINCT order_id) AS Total_order
FROM pizza_sales
GROUP BY DATENAME(WEEKDAY,order_date)

--HOURLY TREND
SELECT DATEPART(HOUR,order_time) AS hour_of_day, COUNT(DISTINCT order_id) AS Total_order
FROM pizza_sales
GROUP BY DATEPART(HOUR,order_time)
ORDER BY DATEPART(HOUR,order_time)

--PIZZA POPULARITY BY PIZZA CATEGORY
SELECT pizza_category, SUM(total_price)*100/(SELECT SUM(total_price) FROM pizza_sales) AS pizza_sales_perc
FROM pizza_sales
GROUP BY pizza_category

--PERCENTAGE OF SALES BY PIZZA SIZE
SELECT pizza_size, SUM(total_price)*100/(SELECT SUM(total_price) FROM pizza_sales) AS pizza_size_perc
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size

--TOTAL PIZZAS SOLD BY PIZZA CATEGORY
SELECT pizza_category, SUM(quantity) AS Total_pizzas_sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY SUM(quantity) DESC

--TOP 5 Pizza
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_pizzas_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_pizzas_sold DESC

--WORST 5 Pizzas
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_pizzas_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_pizzas_sold
