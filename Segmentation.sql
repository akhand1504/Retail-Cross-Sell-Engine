CREATE SCHEMA Retail_Project;


USE Retail_Project;
SHOW TABLES;

USE Retail_Project;

/* 1. Make sure we are reading from the right table */
/* If your table is named 'germany_data' or 'Sheet1', change 'germany_sales' below to that name */
CREATE OR REPLACE VIEW Clean_Germany AS
SELECT
    Invoice,
    Description,
    Quantity,
    Price,
    `Customer ID` as CustomerID,
    InvoiceDate -- We are reading this as TEXT first to avoid errors
FROM germany_data
WHERE `Customer ID` IS NOT NULL; 
/* ^ IF YOU GET ERROR 1146 HERE: Your table is NOT named 'germany_sales'. Check Step 1. */

/* 2. Run the Segmentation */
DROP TABLE IF EXISTS Segmented_Germany;

CREATE TABLE Segmented_Germany AS
WITH RFM_Calculations AS (
    SELECT
        CustomerID,
        COUNT(DISTINCT Invoice) as Frequency
    FROM Clean_Germany
    GROUP BY CustomerID
),
RFM_Scoring AS (
    SELECT
        CustomerID,
        NTILE(2) OVER (ORDER BY Frequency) as F_Score
    FROM RFM_Calculations
)
SELECT
    t.Invoice,
    TRIM(t.Description) as Product,
    CASE
        WHEN r.F_Score = 2 THEN 'VIP'
        ELSE 'Standard'
    END as Customer_Segment
FROM Clean_Germany t
JOIN RFM_Scoring r ON t.CustomerID = r.CustomerID;

/* 3. Check the result */
SELECT * FROM Segmented_Germany LIMIT 10
SELECT * FROM Segmented_Germany;