/******************************************************
* Indirect References to Macro Variables: Practice #9 *

1)	Open m103p09.sas from the practices folder and review the 
	code. Submit the program and review the results. Verify that 
	the report is titled Customers Residing in LU and that there 
	are three rows in the report.

2)	At the top of the program, insert a DATA _NULL_ step to create
	a series of macro variables from the mc1.country_codes table. Use
	the value in the CountryCode column as the macro variable name, 
	and use the value of the corresponding CountryName column as the 
	macro variable's value. Submit the DATA _NULL_ step to create the
	macro variables.

3)	Modify the TITLE statement to include the country name based on the 
	value of the code macro variable. Verify that the title is 
	Customers Residing in Luxembourg.

4)	Modify the %LET statement to assign a value of ZA to the macro 
	variable, code. Submit the program and review the results.
		How many customers are from ZA, and what is the country name?
******************************************************/

data _null_;
    set mc1.country_codes;
    call symputx(CountryCode,CountryName);
run;

%let code=ZA;
title "Customers Residing in &&&code";
proc print data=mc1.customers;
    id ID;
    var Name Age_Group;
    where Country="&code";
run;
title;

*There are seven customers from South Africa.;