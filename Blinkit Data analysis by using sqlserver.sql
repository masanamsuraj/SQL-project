SELECT * FROM Blinkit_data;

SELECT COUNT(*) FROM Blinkit_data ;


UPDATE Blinkit_data
set Item_Fat_Content = 
CASE
WHEN Item_Fat_Content IN ('LF', 'Low fat') THEN 'Low Fat'
WHEN Item_Fat_Content IN ('reg') THEN 'Regular'
ELSE Item_Fat_Content
END

SELECT distinct(Item_Fat_Content) from Blinkit_data;

select CAST(sum(Total_Sales)/ 1000000 AS decimal(10,2)) AS Total_Sales_Millions
from Blinkit_data;

select avg(total_sales) AS AVG_sales
from Blinkit_data ;

select CAST(avg(total_sales) AS DECIMAL(10,7)) AS AVG_Sales
from Blinkit_data;

select count(*) AS no_of_items from Blinkit_data;

select CAST(sum(Total_Sales)/ 1000000 AS decimal(10,2)) AS Total_Sales_Millions
from Blinkit_data
WHERE Item_Fat_Content= 'Low Fat' ;

select CAST(sum(Total_Sales)/ 1000000 AS decimal(10,2)) AS Total_Sales_Millions
from Blinkit_data
where Outlet_Establishment_Year =2022 ;

select CAST(AVG(Rating) as decimal(10,7)) AS AVG_Rating
from Blinkit_data;

------------------------------------------------

SELECT * FROM Blinkit_data;

SELECT Item_Fat_Content ,SUM(Total_Sales) 
FROM Blinkit_data
group by Item_Fat_Content;

SELECT Item_Fat_Content, 
CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_sales,
CAST(AVG(Total_Sales) AS DECIMAL(10,1)) AS Avg_sales,
count(*) as No_Of_Items,
CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
from Blinkit_data
WHERE Outlet_Establishment_Year = 2022
GROUP BY Item_Fat_Content;

SELECT Item_Fat_Content, 
CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_sales,
CAST(AVG(Total_Sales) AS DECIMAL(10,1)) AS Avg_sales,
count(*) as No_Of_Items,
CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
from Blinkit_data
GROUP BY Item_Type

select Outlet_Location_Type, Item_Fat_Content,
CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_sales,
CAST(AVG(Total_Sales) AS DECIMAL(10,1)) AS Avg_sales,
count(*) as No_Of_Items,
CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
from Blinkit_data
GROUP BY Outlet_Location_Type,Item_Fat_Content
order by Total_sales ASC;

select Outlet_Location_Type,
ISNULL([Low Fat],0) AS Low_Fat,
ISNULL([Regular],0) AS Regular
FROM
(
select Outlet_Location_Type, Item_Fat_Content,
CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_sales
FROM Blinkit_data
GROUP BY Outlet_Location_Type,Item_Fat_Content 
) AS SourceTable
PIVOT
(
SUM(Total_Sales)
FOR Item_Fat_Content IN ([Low Fat],[Regular])
) AS PivotTable
ORDER BY Outlet_Location_Type;

select Outlet_Establishment_Year,
CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_sales
FROM Blinkit_data
GROUP BY Outlet_Establishment_Year
ORDER BY Outlet_Establishment_Year ASC;

-------------------------------------------------
SELECT* FROM Blinkit_data;

select Outlet_Size,
CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales
CAST(SUM(Total_Sales)*100.0/SUM(SUM(Total_Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage
FROM Blinkit_data
GROUP BY Outlet_Size
ORDER BY Total_Sales DESC;


SELECT Outlet_Location_Type,
CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
CAST(AVG(Total_Sales) AS DECIMAL(10,1)) AS Avg_Sales,
COUNT(*) AS No_Of_Items,
CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
FROM Blinkit_data
GROUP BY Outlet_Location_Type
ORDER BY Total_Sales DESC;

