***********************************************************;
*  Activity 2.07                                          *;
*  1) Review the program and notice that the DATA step    *;
*     creates a table named Avg_MPG. Highlight the DATA   *;
*     step and %PUT statement, and run the selected code. *;
*     Review the log to see all automatic macro variables *;
*     stored in the global symbol table.                  *;
*  2) Identify the macro variables that store the date    *;
*     and the last table created.                         *;
*  3) Use macro variable references in the TITLE2 and     *;
*     FOOTNOTE statements to insert the table name and    *;
*     date into the program.                              *;
***********************************************************;

data Avg_MPG;
    set sashelp.cars;
    MPG_Average=mean(MPG_City, MPG_Highway);
run;

%put _automatic_;

title1 "Distribution of Average Miles Per Gallon";
title2 "Data Source: &syslast";
footnote "Created on &sysdate9";
proc sgplot;
    histogram MPG_Average;
    density MPG_Average;
run;
title;footnote;

*
2) SYSDATE9 stores the date that the SAS session started and SYSLAST 
   stores the name of the last SAS table created.
*;