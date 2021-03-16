/****************************
* Iterative %DO Loops: Demo *
****************************/

options mcompilenote=all mlogic mprint;

%macro stormchart(basin, season);
title1 "Storm Frequency by Type";
title2 "&basin Basin, &season Season";
proc sgplot data=mc1.storm_final;
	vbar StormType / dataskin=pressed;
    where Basin="&basin" and Season=&season;
run;
title;
%mend stormchart;

%stormchart(NA,2015)

%macro allbasins(year);
%local i;
proc sql noprint;
select basin
	into :basin1-
	from mc1.storm_basin_codes;
quit;

%do i=1 %to &sqlobs;
	%stormchart(&&basin&i, &year)
%end;
%mend allbasins;

options mlogic mprint;

%allbasins(2015)

%allbasins(2009)


options nomlogic nomprint;


