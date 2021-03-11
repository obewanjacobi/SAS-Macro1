/*******************************
* Macro Functions: Practice #1 *

1) Open m103p01.sas from the practices folder. Add a 
	%LET statement to convert the value of FullName to 
	uppercase and assign the result to FullName. Write a single 
	%PUT statement to display FullName in a sentence using both 
	its current form and proper case, as shown below. Submit the 
	program and view the log to verify the results.
		ANTHONY MILLER in proper case is Anthony Miller. 

2) Add a %LET statement to extract the first name from FullName, 
	convert it to proper case, and assign the result to a macro 
	variable named First.
	Add another %LET statement to extract the last name from FullName, 
	convert it to proper case, and assign the result to a macro variable 
	named Last.
	Display the values of FullName, First, and Last in the log as shown 
	below.
		FULLNAME=ANTHONY MILLER FIRST=Anthony LAST=Miller

3) Add a %SYMDEL statement to delete FullName, First, and Last from the 
	global symbol table. Use a %PUT statement to write the values of 
	all user-defined macro variables to the log. Submit the two statements 
	and verify that that FullName, First, and Last are no longer listed.
*******************************/

%let fullname=AnTHoNY MilLeR;
%put &fullname;

*1);
%let fullname=%upcase(&fullname);
%put &fullname in proper case is %sysfunc(propcase(&fullname)).;

*2);
%let first=%sysfunc(propcase(%scan(&fullname,1)));
%let last=%sysfunc(propcase(%scan(&fullname,-1)));
%put &=fullname &=first &=last;

*3);
%symdel fullname first last;
%put _user_;