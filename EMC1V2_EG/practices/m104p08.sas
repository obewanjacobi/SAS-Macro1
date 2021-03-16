/**************************************
* Conditional Processing: Practice #8 *

1)	Open m104p08.sas from the practices folder. Run the program 
	and verify that a table named Profit was created in the work 
	library, and that a bar chart was produced.

2)	Create the table in a permanent library.
	Add a LIBNAME statement to create a library named Orion that points 
	to the practices folder in the course files. Use the path 
	"&path/practices".
	Add a %PUT statement to write the value of the automatic macro variable 
	syslibrc to the log. If the LIBNAME statement ran successfully, the
	value of syslibrc is zero. Otherwise, it is a value other than zero.
	Run the LIBNAME and %PUT statements.

3)	Modify the program.
	Modify the CREATE TABLE statement to write the Profit table to the 
	Orion library.
	Add macro conditional statements.
	If syslibrc is not equal to zero, then write a custom error message
	to the log indicating the rest of the program will not execute because 
	of the failure of the LIBNAME statement.
	If syslibrc is equal to zero, run the PROC SQL and SGPLOT steps.

4)	Test the program with and without an error in the LIBNAME statement. 
	If the graph is created successfully, which Product_Category value has 
	the highest sum of Profit?
**************************************/

libname orion "&path/practices";
%put &=syslibrc;

proc sql;
create table profit as
select o.product_id, Product_Name, Product_Category, 
    (Total_Retail_Price-(CostPrice_per_Unit*Quantity)) 
        as Profit format=dollar12.2 
    from mc1.orders as o inner join mc1.products as p 
	on o.product_id=p.product_id;
quit;
	
proc sgplot data=profit noautolegend;
    hbar Product_Category / response=Profit fillType=gradient 
	categoryorder=respdesc;
run;