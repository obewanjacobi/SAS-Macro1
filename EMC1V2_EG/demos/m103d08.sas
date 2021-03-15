/***********************************************
* Indirect References to Macro Variables: Demo *
***********************************************/

%let year=2015;
%let cat=2;
%let basin=WP;

proc sql noprint;
select MinWind, Damage
    into :wind1-, :damage1-
    from mc1.storm_cat;
quit;

data _null_;
    set mc1.storm_basin_codes;
    call symputx(Basin, BasinName);
run;

title1 "&&&basin &year Category &cat+ Storms";
footnote "Cetegory &cat storms typically cause %lowcase(&&damage&cat)";
proc print data=mc1.storm_final noobs;
	where Basin="&basin" and
		  MaxWindMPH>=&&wind&cat and
		  Season=&year;
run;
title;footnote;
