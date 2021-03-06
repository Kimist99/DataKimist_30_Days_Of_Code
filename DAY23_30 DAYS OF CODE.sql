/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Province]
      ,[healthZone]
      ,[confirmedCases]
      ,[deathsConfirmedCases]
  FROM [dataEbola].[dbo].[dataEbola$]

/* calculate the average number of confirmed cases in all the affected provinces */
SELECT AVG(confirmedCases) AS Confirmed_Cases_By_Provinces
FROM [dbo].[dataEbola$];


/* Determine the provinces above and under the average confirmed cases */
SELECT 
	healthZone,
	confirmedCases,
		CASE
			WHEN confirmedCases > 42.9
				THEN 'Above 42.9 Average'
			ELSE 'Below 42.9 Average'
		END AS COMPARISONS_TO_AVERAGE
FROM [dbo].[dataEbola$]
GROUP BY healthZone, confirmedCases 

/* GET COUNTS FOR ABOVE AND BELOW AVERAGE CONFIRMED CASES */
SELECT
	COUNT(CASE WHEN confirmedCases > 42.9 THEN 'Above 42.9 Average' END) AS Above_Average,
	COUNT(CASE WHEN confirmedCases < 42.9 THEN 'Below 42.9 Average' END) AS Below_Average
FROM [dbo].[dataEbola$]




