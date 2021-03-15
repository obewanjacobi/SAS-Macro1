/*************************************
* Defining and Calling a Macro: Demo *
*************************************/

options mcompilenote=all;
%macro StormChart(Basin,Season,MaxWind);
title1 "Storm Frequency by Type";
title2 "&Basin Basin, &Season Season, Max Wind > &maxwind MPH"; 
proc sgplot data=mc1.storm_final;
    vbar StormType / dataskin=pressed;
    where Basin="&Basin" and Season=&Season and MaxWindMPH>&maxwind; 
run;
title;
%mend StormChart;

options mprint;
%StormChart(EP, 2015,125)
options nomprint;