/**************************************************
* Using SQL to Create Maro Variables: Practice #4 *

1)	Open m103p04.sas from the practices folder. 
	Review the code and submit the %LET statements and 
	the PROC SQL step. Verify that Qty (the mean for Quantity) is 
	1.43 and Price (the mean for Total_Retail_Price) is 137.72.

2)	In the TITLE2 statement, replace xxx with the mean for 
	Quantity (1.43), and replace yyy with the mean for 
	Total_Retail_Price (137.72). Submit the TITLE statements and the 
	PROC PRINT step, and review the log and results.
	How many rows were read from the input table?

3)	In the PROC SQL step, add an INTO clause to assign the
	mean for Quantity to a macro variable named Qty, and the mean for 
	Total_Retail_Price to a macro variable named Price. In the TITLE2 
	statement, replace the hardcoded mean values with references to 
	Qty and Price.
	Submit the entire program and review the log and results. 
	Verify that the title displayed correctly.
	How many rows were read from the input table?
	Why is the average price displayed with a leading dollar sign 
	in the title?

4)	Modify the %LET statements to assign 01Feb2019 to start and 
	28Feb2019 to stop. Submit the program again.
	How many rows were read from the input table?
	What are the resolved values of qty and price in TITLE2?
**************************************************/

%let start=01Feb2019;
%let stop=28Feb2019;
proc sql;
	select mean(Quantity) format 4.2 as Qty, 
	       mean(Total_Retail_Price) format=dollar7.2 as Price
		   into :qty trimmed,
		   		:total_retail_price trimmed
	from mc1.orders
	where Order_Date between "&start"d and "&stop"d;
quit;

title1 "Orders from &start to &stop";
title2 "Average Quantity: &qty Average Price: &total_retail_price";
proc print data=mc1.orders;
	where Order_Date between "&start"d and "&stop"d;
	var Order_ID Order_Date Quantity Total_Retail_Price;
	sum Quantity Total_Retail_Price;
	format Total_Retail_Price dollar8.;
run;
title;