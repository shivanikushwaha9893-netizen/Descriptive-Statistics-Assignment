------------------------------------------------
-- CREATE DATABASE
------------------------------------------------
CREATE DATABASE StatsDB;
GO
USE StatsDB;
GO

------------------------------------------------
-- Q2 : Mean (Student Marks)
------------------------------------------------
DROP TABLE IF EXISTS StudentMarks;
CREATE TABLE StudentMarks(Marks INT);

INSERT INTO StudentMarks VALUES
(12),(15),(14),(16),(18),(20),(19);

SELECT AVG(Marks) AS MeanMarks FROM StudentMarks;
GO

------------------------------------------------
-- Q3 : Mode (Shoe Sizes)
------------------------------------------------
DROP TABLE IF EXISTS ShoeSizes;
CREATE TABLE ShoeSizes(Size INT);

INSERT INTO ShoeSizes VALUES
(7),(8),(9),(8),(8),(10),(7),(9);

SELECT TOP 1 Size AS Mode
FROM ShoeSizes
GROUP BY Size
ORDER BY COUNT(*) DESC;
GO

------------------------------------------------
-- Q4 : Median (Car Prices)
------------------------------------------------
DROP TABLE IF EXISTS CarPrices;
CREATE TABLE CarPrices(Price INT);

INSERT INTO CarPrices VALUES
(8000),(9500),(10200),(11000),(50000);

SELECT AVG(Price) AS MedianPrice
FROM
(
 SELECT Price,
 ROW_NUMBER() OVER(ORDER BY Price) rn,
 COUNT(*) OVER() total
 FROM CarPrices
) t
WHERE rn IN ((total+1)/2,(total+2)/2);
GO

------------------------------------------------
-- Q5 : Range (Puzzle Time)
------------------------------------------------
DROP TABLE IF EXISTS PuzzleTime;
CREATE TABLE PuzzleTime(TimeTaken INT);

INSERT INTO PuzzleTime VALUES
(25),(30),(27),(35),(40);

SELECT MAX(TimeTaken)-MIN(TimeTaken) AS PuzzleRange FROM PuzzleTime;
GO

------------------------------------------------
-- Q6 : Range (Apple Weight)
------------------------------------------------
DROP TABLE IF EXISTS Apples;
CREATE TABLE Apples(Weight INT);

INSERT INTO Apples VALUES
(100),(105),(98),(110),(120);

SELECT MAX(Weight)-MIN(Weight) AS AppleRange FROM Apples;
GO

------------------------------------------------
-- Q7 : Variance Compare
------------------------------------------------
SELECT 'Company A more consistent' AS Result;
GO

------------------------------------------------
-- Q8 : Risky Coin
------------------------------------------------
SELECT 'Coin B is riskier (higher SD)' AS Result;
GO

------------------------------------------------
-- Q9 : Mean + Standard Deviation (Electricity)
------------------------------------------------
DROP TABLE IF EXISTS Electricity;
CREATE TABLE Electricity(Unit INT);

INSERT INTO Electricity VALUES
(400),(420),(390),(450),(410);

SELECT AVG(Unit) AS MeanUsage,
STDEV(Unit) AS StdDeviation
FROM Electricity;
GO

------------------------------------------------
-- Q10 : Basketball Player
------------------------------------------------
DROP TABLE IF EXISTS Basketball;
CREATE TABLE Basketball(Points INT);

INSERT INTO Basketball VALUES
(15),(18),(20),(22),(25),(17),(19),(21);

SELECT
AVG(Points) AS Mean,
MAX(Points)-MIN(Points) AS Range,
STDEV(Points) AS StdDeviation
FROM Basketball;

SELECT TOP 1 Points AS Mode
FROM Basketball
GROUP BY Points
ORDER BY COUNT(*) DESC;

SELECT AVG(Points) AS Median
FROM
(
 SELECT Points,
 ROW_NUMBER() OVER(ORDER BY Points) rn,
 COUNT(*) OVER() total
 FROM Basketball
) t
WHERE rn IN ((total+1)/2,(total+2)/2);
GO
