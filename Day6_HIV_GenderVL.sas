/* HIV Gender Race VL */

/* Import HIV data file */
PROC IMPORT DATAFILE = '/folders/myfolders/30DaysOfCode_Jun20/dataPracHIVCrop.csv'
 OUT = work.dataPracHIVCrop1
DBMS = CSV;
RUN;

/* view file */
PROC PRINT DATA = dataPracHIVCrop1;
RUN;

/* Sort by viral load */
TITLE "VIRAL SUPPRESSION BY GENDER";
PROC FREQ DATA= dataPracHIVCrop1;
	TABLES
		  viralSupp * Gender
		  viralSupp /out=FreqCount outexpect sparse;
RUN;
