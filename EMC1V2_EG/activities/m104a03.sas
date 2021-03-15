***********************************************************;
*  Activity 4.03                                          *;
*  1) Modify the %MACRO statement to use keyword          *;
*     parameters. Assign default values of NA to Basin,   *;
*     2016 to Season, and 20 to MaxWind. Run the program  *;
*     and verify that the macro compiles successfully.    *;
*  %macro stormchart(basin=NA, season=2016, maxwind=20);  *;
*  2) Call the %StormChart macro with no parameter values *;
*     provided. Confirm in the log that the default       *;
*     parameter values are used.                          *;
*         %stormchart()                                   *;
*  3) Call the %StormChart macro with Season as 2015 and  *;
*     Basin as EP. View the log. Is the table subset by   *;
*     MaxWind, even though it is not included as a        *;
*     parameter in the macro call?                        *;
***********************************************************;

options mcompilenote=all;
%macro stormchart(basin=NA, season=2016, maxwind=20);
title1 "Storm Frequency by Type";
title2 "&basin Basin, &season Season, Max Wind > &maxwind MPH"; 
proc sgplot data=mc1.storm_final;
    vbar StormType / dataskin=pressed;
    where Basin="&basin" and Season=&season and MaxWindMPH>&maxwind; 
run;
title;
%mend stormchart;

%stormchart()

%stormchart(season = 2015, basin = EP)