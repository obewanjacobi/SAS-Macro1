/*************************************
* Iterative Processing: Practice #10 *

1)	Open m104p10.sas from the practices folder. Review and submit 
	the program. Verify that it generates a PROC MEANS report for 
	Type 1 orders.

2)	Convert the code to a macro named Orders that uses a %DO loop to 
	generate a separate PROC MEANS step for order types 1, 2, and 3. 
	Add a call to the Orders macro. Submit the program and verify that
	it generates three PROC MEANS reports, one for each order type.
	Confirm that the mean of Total_Retail_Price for type 2 orders is
	162.43.

3)	Modify the program.
		- Insert a DATA _NULL_ step after the %MACRO statement.
		- Create a series of macro variables, type1 to typen, where 
		n is the number of order types found in the 
		mc1.order_type_codes table.
		- For each macro variable name, concatenate the prefix type 
		with the value of order_type_code.
		- Assign the corresponding value of Order_Type to the macro variable.
		- Create a macro variable named numTypes and assign it the 
		number of type macro variables created. Hint: Use the END= option
		in the SET statement.
		- Use numTypes as the stop value for the %DO loop.
		- Use an indirect reference to include the order type in the 
		title as shown below.
			Order Type: Retail Store
*************************************/

title "Order Type: 1";
proc means data=mc1.orders sum mean maxdec=2;
    where Order_Type=1;
    var Total_Retail_Price CostPrice_Per_Unit;
run;

%macro orders;
data _null_;
    set mc1.order_type_codes end=last;
    call symputx(cats("type",Order_type_code),Order_type);         
    if last=1 then call symputx("numTypes", _n_);
run;
%do i=1 %to &numTypes;
    title "Order Type: &&type&i";
    proc means data=mc1.orders sum mean maxdec=2;
        where Order_Type=&i;
        var Total_Retail_Price CostPrice_Per_Unit;
    run;
%end;
%mend orders;

%orders