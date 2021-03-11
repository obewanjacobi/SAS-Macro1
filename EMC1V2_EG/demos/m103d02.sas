/************************
* Macro Functions: Demo *
************************/

%let year=2015;
%let windm=150;
%let dtfoot = %str(footnote "Report Created on %sysfunc(today(), date9.) 
			  at %sysfunc(time(), timeampm.)";);

title1 "&year Storms";
title2 "Winds Exceeding &windm M/H or %sysevalf(&windm*1.61) KM/H";
&dtfoot
proc print data=mc1.storm_final noobs;
   where Season=&year and MaxWindMPH>=&windm;
run;
title;footnote;

