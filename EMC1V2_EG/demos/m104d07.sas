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

%macro stormchartrange(basin, start, stop);
%local Season;
    %do Season=&start %to &stop;
        %stormchart(&basin, &season)
    %end;
%mend stormchartrange;

%stormchartrange(EP,2011,2013)
%stormchartrange(NA,2010,2016)

options mcompilenote=none nomlogic nomprint;


