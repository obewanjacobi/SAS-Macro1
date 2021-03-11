***********************************************************;
*  Activity 2.04                                          *;
*  1) Notice that the program includes two TITLE          *;
*     statements, each referencing a macro variable.      *;
*  2) At the top of the program, turn on the SYMBOLGEN    *;
*     option. At the bottom of the program, turn off      *;
*     SYMBOLGEN.                                          *;
*  3) Run the program and review the log and results.     *;
*     What is printed as the second title?                *;
*  4) In the TITLE2 statement, change the single          *;
*     quotation marks to double quotation marks and run   *;
*     the program again. How do the results and the log   *;
*     differ?                                             *;
***********************************************************;

options symbolgen;
%let type=Truck;
%let hp=250;
title1 "Car Type: &type";
title2 'Horsepower > &hp';
proc print data=sashelp.cars;
    var Make Model MSRP Horsepower;
    where Type="&type" and Horsepower>&hp;
run;
title;

options nosymbolgen;

*
Using the symbolgen option, the second title now displays "Horsepower > &hp"
instead of using the actual hp value given in our macro. 

The macro variable hp didn't resolve because it was enclosed in single 
quotation marks. There is a SYMBOLGEN note in the log for type but there's 
no note for hp because it didn't resolve.

When single quotation marks are used, the word scanner ignores macro 
triggers and ampersands and percent signs are treated as plain text.

Let's fix this and run it again below:
*;

options symbolgen;
%let type=Truck;
%let hp=250;
title1 "Car Type: &type";
title2 "Horsepower > &hp";
proc print data=sashelp.cars;
    var Make Model MSRP Horsepower;
    where Type="&type" and Horsepower>&hp;
run;
title;

options nosymbolgen;