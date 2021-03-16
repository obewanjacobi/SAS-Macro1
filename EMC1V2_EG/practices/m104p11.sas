/*************************************
* Iterative Processing: Practice #11 *

1)	Open m104p11.sas from the practices folder. Review and submit
	the program. Verify that the maximum wind speed for the 2015 season 
	was 213 MPH.

2)	Modify the Storms macro to accept a space-separated list of years. 
	Use a %DO %UNTIL loop and the %SCAN macro function to generate a 
	report for each year in the list. Submit the macro definition and 
	verify that it completed compilation without errors.

3)	Call %Storms to generate a report for the 2011 and 2014 seasons as 
	shown below.
		%storms(2011 2014)
*************************************/

%macro storms(yr);
title "&yr Storms";
proc means data=mc1.storm_final n min mean max maxdec=0;
    var MaxWindMPH MinPressure;
    where season=&yr;
run;
%mend storms;

%storms(2015)

%macro storms(years);
%let i=1;
%let yr=%scan(&years,&i);
%do %until(&yr eq );
    title "&yr Storms";
    proc means data=mc1.storm_final n min mean max
               maxdec=0;
        var MaxWindMPH MinPressure;
        where season=&yr;
    run;
    %let i=%eval(&i+1);
    %let yr=%scan(&years,&i);
%end;
title;
%mend storms;

%storms(2011 2014)