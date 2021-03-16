***********************************************************;
*  Activity 5.01                                          *;
*  1) This program creates a macro named PrintTable in    *;
*     the default work.sasmacr catalog. PROC CATALOG      *;
*     lists the contents of work.sasmacr.                 *;
*  2) Run the program. The report includes all macros in  *;
*     work.sasmacr, including PRINTTABLE and its          *;
*     description.                                        *;
*  3) Uncomment the second CONTENTS statement. This       *;
*     statement will create a table including the macros  *;
*     in work.sasmacr. The WHERE= data set option is      *;
*     used to filter the results.                         *;
*  4) Run the program. How many macros include TABLE in   *;
*     the name?                                           *;
***********************************************************;

options mlogic mautolocdisplay;
%macro printtable(dsn=sashelp.cars,obs=5) /des='Print a table. Parms: DSN= OBS=';
    proc print data=&dsn(obs=&obs);
    run; 
%mend printtable;

proc sql;
select *
    from dictionary.catalogs
    where objname='PRINTTABLE';
quit;

proc catalog catalog;
    contents;
    contents out=macrolist(where=(name like '%TABLE%'));
run;

options nomlogic;
/*This doesn't work because I don't know where Macros are saved
  by default here at Humana.*/