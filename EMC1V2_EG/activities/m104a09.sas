***********************************************************;
*  Activity 4.09                                          *;
*  1) Run the program and examine the log. Identify and   *;
*     correct the syntax error and rerun the program.     *;
*     Verify that the macro compiled successfully.        *;
*  2) Call the %AllCylinders macro with a start value of  *;
*     3 and stop value of 12.                             *;
*         %allcylinders(3,12)                             *;
*  3) Examine the reports and log. Why are there some     *;
*     values between 3 and 12 that did not produce        *;
*     reports?                                            *;
***********************************************************;

options mlogic mprint;
%macro allcylinders(start,stop);
%do num=&start %to &stop;
    title "&num-Cylinder Cars";
    proc print data=sashelp.cars noobs;
        where Cylinders=&num;
        var Make Model Type Origin 
            MSRP MPG_City MPG_Highway;
    run;
%end;
title;
%mend allcylinders;

options nomlogic nomprint;

%allcylinders(3,12)

/*If a cylinder number did not show up in the report, it's because it had
  0 observations for that # cylinder vehicle.*/
