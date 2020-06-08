/* Relationship between housing status and being virally suppressed

/* Import HIV data file */
PROC IMPORT DATAFILE = '/folders/myfolders/30DaysOfCode_Jun20/dataPracHIVCrop.csv'
 OUT = work.dataHIV3
DBMS = CSV;
RUN;

PROC PRINT DATA = dataHIV3;
RUN;

/* SQL ***************************************** SAS */
PROC SQL;
	TITLE "Count of Virally Suppressed Patients by Housing Status";
	SELECT Gender, viralSupp, housingStatus
	FROM dataHIV3
	GROUP BY housingStatus;
QUIT;

/* Type of Housing Status Associated with Viral Suppression */
TITLE "VIRAL SUPPRESSION BY HOUSING STATUS TYPE";
PROC FREQ DATA= dataHIV3;
	TABLES
		  viralSupp * housingStatus
		  viralSupp /out=FreqCount outexpect sparse;
RUN;