***********************************************************;
*  Activity 4.06                                          *;
*  1) Review the program. Notice that the %Test macro     *;
*     includes a parameter named X. X is assigned         *;
*     different values before and during the macro call.  *;
*  2) Submit the program and examine the log to view the  *;
*     value of X before, during, and after macro          *;
*     execution.                                          *;
*  3) What is the scope of the X parameter in the %Test   *;
*     macro?                                              *;
*  4) Add a %GLOBAL statement before the %PUT statement   *;
*     in the %Test macro definition to explicitly declare *;
*     X as global scope. Does the program run             *;
*     successfully?                                       *;
***********************************************************;

 /* Assign a value to X & write to log */
%let X=OutsideMacro;
%put NOTE: &=X before TEST macro execution.;

 /* Define the macro test */
%macro test(X);
/*%global x;*/		/*So this is weird, you CANNOT comment this global*/
					/*statement out with just a *, you must use the full*/
					/*comment method with slashes, otherwise it will run*/
					/*the global statement, which is stupid btw.*/
%put NOTE: &=X during TEST macro execution.;
%mend;

 /* Execute the test macro */
%test(InsideMacro)

 /* Check the value to X after execution */
%put NOTE: &=X after TEST macro execution.;

*
2)  X=OutsideMacro before TEST macro execution.
	X=InsideMacro during TEST macro execution.
	X=OutsideMacro after TEST macro execution.

3)	it's local

4)	No: ERROR: Attempt to %GLOBAL a name (X) which exists in 
	a local environment.
;
