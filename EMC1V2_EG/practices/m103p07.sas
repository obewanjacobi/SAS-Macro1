/*************************************************************
* Using the DATA Step to Create Macro Variables: Practice #7 *

1)	Open m103p07.sas from the practices folder and review the program. 
	The sashelp.vmacro data source is a dynamic view that contains the 
	name and value of all macro variables in the current SAS session. 
	Run the program and view the report.

2)	Insert a DATA _NULL_ step before the PROC PRINT step to create a 
	series of macro variables using the values stored in the 
	mc1.Storm_Ocean_Codes table. Use the values in Ocean to name the 
	macro variables. Use the values in OceanName as the macro variable 
	values.

3)	Modify the PROC PRINT step to display only macro variables with 
	one-character names. Submit the entire program and verify that five 
	macro variables were created.
		What is the value of the macro variable, S?
*************************************************************/


data _null_;
    set mc1.Storm_Ocean_Codes;
    call symputx(Ocean,OceanName);
run; 
proc print data=sashelp.vmacro;
	var Name Value;
	where name like "_";
run;

*3) Southern (Antarctic);