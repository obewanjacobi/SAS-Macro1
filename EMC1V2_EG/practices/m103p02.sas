/*******************************
* Macro Functions: Practice #2 *

1) Open m103p02.sas from the practices folder and review the 
	code. Submit the program and review the results. Note that
	the footnote includes the date and time that the SAS session 
	started.

2) Create a macro variable named Product and assign the value R&D.
	Reference Product in the TITLE and WHERE statements, replacing Jacket.
	Modify the FOOTNOTE statement to display the current date and time,
	using the DATE9 and TIMEAMPM9 formats respectively.

3) Submit the program and verify that the title is Product Names 
	Containing 'R&D' and that the current date and time are displayed 
	in the footnote.
	How many rows are in the report?
*******************************/

%let d=%sysfunc(date(), date9.);
%let t=%sysfunc(time(),timeampm9.);
%let product = %nrstr(R&D);

title1 "Product Names containing '&product'";
footnote "Report Produced &d &t";
proc print data=mc1.products;
	where Product_Name contains "&product";
	var Product_Name Product_ID Supplier_Name;
run;
title;footnote;

*3)
The report has 8 rows.
*;