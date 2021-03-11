/**************************************************
* Creating and Using Macro Variables: Practice #1 *
**************************************************/

%let country=AU;
%let age1=25;
%let age2=34;

title "&country Customers Ages &age1 to &age2"; 
proc print data=mc1.customers; 
    var Name Age Type; 
    where Country = "&country"
        and Age between &age1 and &age2;
run; 
title; 
