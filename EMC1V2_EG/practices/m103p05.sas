/**************************************************
* Using SQL to Create Maro Variables: Practice #5 *

1)	Open m103p05.sas from the practices folder. Review 
	and submit the code in part a. Verify that the reported 
	average wind speed is 79.

2)	Review the code in part b. Replace every occurrence of 
	XX with the average wind speed from step a. Submit the code 
	in part b and review the results.
		How many rows are in the table?
		Which bar has the highest frequency?

3)	Modify the PROC SQL step.
		Suppress the PROC SQL output.
		Store the calculated value in a macro variable named 
		AvgWind with no leading spaces.
		Add another SELECT statement to select the BasinName 
		value from mc1.storm_basin_codes where Basin is equal to the 
		basincode macro variable. Write the value to a macro variable 
		named BasinName.

4)	Modify the report code.
		Replace all hardcoded values of 79 with a reference to AvgWind.
		Replace all hardcoded text values of North Atlantic with a 
		reference to BasinName.
		Submit the modified code and verify that the report contains 
		the same information as the report generated in step b.

5)	Modify the %LET statements to assign 2015 to Year and EP to 
	BasinCode. Submit the entire program, including the modified %LET 
	statements and the PROC SQL step. Review the log to ensure that there 
	are no errors or warnings. Verify that the report title is East Pacific 
	Storms in 2015 Season Max Wind > Season Average of 92 MPH.
		How many rows are in the table?
		Which bar has the highest frequency?
**************************************************/

 /* Part a. */
%let year=2015;
%let basincode=EP;

proc sql noprint;
select round(mean(MaxWindMPH)) as AvgWind
	into :avgwind trimmed
    from mc1.storm_final
    where Season=&year and Basin="&basincode";
select BasinName 
   into :basinname trimmed
   from mc1.storm_basin_codes
   where basin="&basinCode";
quit;

 /* Part b. */
title1 "&basinname Basin Storms in &year Season";
title2 "Max Wind > Season Average of &avgwind MPH"; 
proc print data=mc1.storm_final noobs;
	var Name StartDate EndDate MaxWindMPH MinPressure;
	where MaxWindMPH>&avgwind and Season=&year and Basin="&basincode"; 
run;
title;

proc sgplot data=mc1.storm_final;
    where MaxWindMPH>&avgwind and Season=&year and Basin="&basincode"; 
	vbar StormType;
	yaxis display=(noline) grid;
run;

