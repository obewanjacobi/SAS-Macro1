/**************************************
* Conditional Processing: Practice #7 *

1)	Open m104p07.sas from the practices folder.

2)	Modify the CustomerList macro to test the country parameter. 
	If the value is null, insert the following statements into the 
	PROC PRINT step:
		title "All Customers";
		var ID Name Country Type Age_Group;

	If the value is not null, insert the following statements into 
	the PROC PRINT step:
		title "Customers from Country: &country";
		where Country="&country";
		var ID Name Type Age_Group;

3)	Submit the macro definition and call the macro using a null value. 
	Verify that the title is All Customers and that 1800 rows were 
	included in the report.

4)	Submit the macro call again with a value of AU for the country parameter.
	What is the report title?
	How many customers are included in the report?
**************************************/

%macro customerlist(country);
proc print data=mc1.customers noobs;
    %if &country= %then %do;
        title "All Customers";
        var ID Name Country Type Age_Group;
    %end;
    %else %do;
        title "Customers from Country: &country";
        where Country="&country";
        var ID Name Type Age_Group;
    %end;
run;
%mend customerlist;

%customerlist()

%customerlist(AU)
