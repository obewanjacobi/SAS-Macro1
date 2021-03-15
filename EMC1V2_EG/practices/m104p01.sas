/********************************************
* Defining and Calling a Macro: Practice #1 *
********************************************/

%macro customers(type=inactive);

%let type=%upcase(&type);
title "&type Customers"; 
proc sql number;
select Name, Age_Group, Type 
    from mc1.customers 
    where upcase(Type) contains "&type"; 
quit; 
title;

%mend customers;

%customers(type=Gold)
%customers(type=High Activity)
%customers()