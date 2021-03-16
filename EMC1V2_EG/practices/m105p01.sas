/**********************************************
* Generating Data-Dependent Code: Practice #1 *

1)	Open m105p01.sas from the practices folder. The program submits 
	a PROC PRINT step to generate a report for the requested customer
	type in the mc1.customers table. Submit the program and verify that
	a report listing Gold high activity customers is produced.

2)	Include the code in a macro named GroupList with two parameters, 
	Tab for the input table and Col for the selected column. This macro 
	generalizes the starter program so that a PROC PRINT report is 
	generated for each unique value of the specified column.
		Use a PROC SQL step to select the distinct uppercase values of 
		the Col parameter. Load the values into a numbered series of macro
		variables starting with Val1. Read the column from the table
		specified by the Tab parameter.

		Add a macro %DO loop to repeat the TITLE statement and PROC PRINT 
		step once for each Valn macro variable created. Note: Use the Sqlobs
		macro variable created automatically by the PROC SQL step to
		provide the stop value for the loop.

		Use an indirect macro variable reference to replace GOLD HIGH 
		ACTIVITY with Val1 for the first %DO loop iteration, Val2 for
		the second iteration, and so on.

3)	Call the GroupList macro with mc1.customers and Type as the 
	parameter values. Confirm that a separate PROC PRINT step is executed 
	for each distinct value of Type.

4)	Call the GroupList macro with sashelp.cars and DriveTrain as the 
	parameter values.
		What is the value of DriveTrain for the first report generated?
**********************************************/

title "Group: GOLD HIGH ACTIVITY";
proc print data=mc1.customers;
	where upcase(Type)="GOLD HIGH ACTIVITY";
run;

%macro grouplist(tab,col);
proc sql noprint;
select distinct upcase(&col)
    into :val1-
    from &tab;
quit;

%do i=1 %to &sqlobs;
title "Group: &&val&i";
proc print data=&tab;
    where upcase(&col)="&&val&i";
run;
%end;
%mend grouplist;

%grouplist(mc1.customers, Type)

%grouplist(sashelp.cars, DriveTrain)