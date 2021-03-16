/**********************************************
* Generating Data-Dependent Code: Practice #2 *

1)	Open m105p02.sas from the practices folder. Review and submit
	the program. Open the Excel file to confirm storms from the NA
	basin are included.
		Enterprise Guide: In the Servers window, expand Local > Files
		and navigate to the course data folder. Double-click the 
		NAStorms.xlsx file. Close the Excel file after viewing it.

2)	Create a macro named BasinXLS that writes storms for each distinct 
	value of Basin to a different worksheet in an Excel workbook named 
	BasinStorms.xlsx. Include the following logic in the macro program:
		Use the automatic macro variable Syslibrc to verify whether the
		LIBNAME statement runs successfully (SYSLIBRC=0). If it does not 
		run successfully (SYSLIBRC?0), write a custom error message to 
		the log and terminate macro execution.

		Create a numbered series of macro variables for each value of 
		Basin and BasinName in the mc1.storm_basin_codes table. Remove 
		all spaces from the BasinName values before assigning them to 
		macro variables.

		Use a macro %DO loop to repeat the DATA step for each value of Basin.

3)	Call the %BasinXLS macro and open the BasinStorms.xlsx file. Confirm 
	that six worksheets are included.
		What is the name of the first storm listed in the 
		SouthIndian_Storms worksheet?
**********************************************/

libname storm xlsx "&path/NAStorms.xlsx";

data storm.NorthAtlantic_Storms;
	set mc1.storm_final;
	where Basin="NA";
run;

libname storm clear;

%macro basinxls;
libname storm xlsx "&path/basinstorms.xlsx";
%if &syslibrc ne 0 %then %do;
    %put ERROR: BasinStorms.xlsx was not successfully assigned. Check the path and filename.;
%end;

%else %do;
    proc sql noprint;
    select Basin, compress(BasinName)
        into :basin1-, :basinname1-
	   from mc1.storm_basin_codes;
    quit;
	
    %do i=1 %to &sqlobs;
    data storm.&&basinname&i.._Storms;
        set mc1.storm_final;
        where Basin="&&basin&i";
    run;
    %end;
%end;
libname storm clear;
%mend basinxls;

%basinxls