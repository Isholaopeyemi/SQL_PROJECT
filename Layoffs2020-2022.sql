--Dataset source-->https://layoffs.fyi/

-- Add '[Year]' to table '[Layoffs_data]' in schema '[dbo]'
ALTER TABLE dbo.layoffs_data
ADD YEAR DATE

alter TABLE dbo.layoffs_data 
ADD YEAR VARCHAR(50)
UPDATE [layoffs_data ]
SET Year = year(Date_added)

-- 

SELECT *
FROM dbo.layoffs_data 
WHERE Laid_off_count is not NULL
AND Percentage is not NULL

-- Drop '[Fund_Raised]' from table '[Layoffs_data]' in schema '[dbo]'
ALTER TABLE dbo.layoffs_data
DROP COLUMN Funds_Raised
GO

SELECT *
FROM dbo.layoffs_data 
ORDER BY
Country ASC

--Count number of industries in each country

SELECT
Industry, Count(Industry) as Number_of_Industry
From layoffs_data
Group BY Industry
order by Number_of_Industry DESC

--
Select Company, Industry
FROM [layoffs_data ]
Order BY Industry

--Looking at the AVG Total of layoffs in each industry

SELECT
Location, Country, Industry, Avg(Laid_off_Count) AS Average_Total_Laid_off
From layoffs_data
Where Industry is not NULL
and Country is not NULL
Group BY Location, Country, Industry
order by Average_Total_Laid_off ASC

SELECT
Industry, Avg(Laid_off_Count) AS Industry_Total_Laid_off 
From layoffs_data
Where Industry is not NULL
Group BY Industry
Order by Industry_Total_Laid_off 

--Shows the Max and Min total of layoff in each industry 

SELECT
Location, Country, Industry, Max(Laid_off_Count) AS Max_Laid_off ,Min(Laid_off_Count) AS Min_Laid_off
From layoffs_data
Where Industry is not NULL
and Country is not NULL
Group BY Location, Country, Industry
order by Max_Laid_off DESC, Min_Laid_off

--Looking at the Avg Total of laidoff by Company stages

SELECT
Stage, Avg(Laid_off_Count) AS StageAverage_Total_Laid_off
From layoffs_data
Group BY stage
order by StageAverage_Total_Laid_off

--Look at what year had the SUM highest and lowest layoffs

SELECT YEAR, Sum(Laid_off_count) AS Sum_of_Laidoff
FROM layoffs_data 
GROUP BY Year
ORDER by Year DESC 

--Highesst and lowest layoff by Countries

SELECT Country, sum(laid_off_count) as Country_laid_off
FROM [layoffs_data ]
WHERE Laid_Off_Count is not NULL
GROUP BY Country
ORDER BY Country_laid_off DESC

--Look at what countries had the highest and lowest by Industry 

SELECT Industry, sum(laid_off_count) as Industry_laid_off
FROM [layoffs_data ]
WHERE Laid_Off_Count is not NULL
GROUP BY Industry
ORDER BY Industry_laid_off DESC

--Count Total of Industry by Country

SELECT Country, Industry
FROM [layoffs_data ]
ORDER BY Country

-- Drop a temporary table called 'Layoffs_2020'
-- Drop the table if it already exists
IF OBJECT_ID('tempDB..Layoffs_2020', 'U') IS NOT NULL
DROP TABLE Layoffs_2020
GO
-- Create the temporary table from a physical table called 'Layoffs_data' in schema 'dbo' in database 'DatabaseName'
SELECT *
INTO Layoffs_2020
FROM [DatabaseName].[dbo].[Layoffs_data]
WHERE YEAR =2020

SELECT *
From [Layoffs_2020]

-- Drop a temporary table called 'Layoffs_2021'
-- Drop the table if it already exists
IF OBJECT_ID('tempDB..Layoffs_2021', 'U') IS NOT NULL
DROP TABLE Layoff_2021
GO
-- Create the temporary table from a physical table called 'Layoffs_data' in schema 'dbo' in database 'DatabaseName'
SELECT *
INTO Layoffs_2021
FROM [DatabaseName].[dbo].[layoffs_data ]
WHERE YEAR =2021

SELECT *
From Layoffs_2021

-- Drop a temporary table called 'Layoffs_20202
-- Drop the table if it already exists
IF OBJECT_ID('tempDB..Layoffs_2022', 'U') IS NOT NULL
DROP TABLE Layoffs_2022
GO
-- Create the temporary table from a physical table called 'Layoffs_data' in schema 'dbo' in database 'DatabaseName'
SELECT *
INTO Layoffs_2022
FROM [DatabaseName].[dbo].[layoffs_data ]
WHERE YEAR=2022

SELECT *
From Layoffs_2022