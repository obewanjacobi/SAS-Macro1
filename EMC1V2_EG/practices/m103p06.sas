/************************************************************
* Using the DATA Step to Create Maro Variables: Practice #6 *

1)	Open m103p06.sas from the practices folder. Review and 
	submit the program. Verify that the report title is New Staff: 
	Administration Department and that the sum of Salary is $221,618.

2)	Add a %LET statement to assign the value Administration to a 
	new macro variable named dept, and replace every occurrence of
	Administration with a reference to dept. Submit the modified
	program and verify that the title and report are the same as in 
	number 1.

3)	Change the value of dept to Sales and submit the program. Verify 
	that the report title is New Staff: Sales Department.
		What is the sum of Salary?

4)	Modify the DATA step to create a macro variable named avg to store 
	the average salary on the last iteration. Hint: Use the PUT function 
	and the DOLLAR9. format when assigning the value to avg.
		Add a FOOTNOTE statement before the PROC PRINT step to display 
		the value of avg as shown below. Submit the program and review 
		the results.
			Average Salary: $xx,xxx
		What text is displayed in the footnote?
************************************************************/

%let dept = Sales;

data staff;
	keep Employee_ID Department Job_Title Salary;
	set mc1.newhires end=last;
	where Department="&dept";
	total+salary;
    if last=1 then 
        call symputx("avg",put(total/_n_,dollar11.2));
run;

footnote "Average Salary: &avg";
title "New Staff: &dept Department";
proc print data=staff;
	sum salary;
run;
title;
footnote;