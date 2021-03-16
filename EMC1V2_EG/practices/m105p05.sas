/*************************************
* Validating Parameters: Practice #5 *
Open m105p05.sas from the practices folder. Review and submit 
the program.

Use PROC SQL to create the macro variables MinSeason and MaxSeason
that store the minimum and maximum values of the Season column in 
the mc1.storm_final table. Add a condition to verify that the Season 
parameter is between MinSeason and MaxSeason.

If the Season parameter is valid, use PROC SQL to create a 
space-delimited list of valid Basin codes from the mc1.storm_basin_codes
table. Load the list into a macro variable.

If the Basin parameter is in the list of valid codes, execute the 
TITLE statements and the PROC SGPLOT step.

Note: Be sure to use the MINOPERATOR option in the %MACRO statement
to enable the macro IN operator.
*************************************/

%macro stormchart(basin, season);
title1 "Storm Frequency by Type";
title2 "&basin Basin, &season Season";
proc sgplot data=mc1.storm_final noborder;
	vbar StormType / filltype=gradient;
    where Basin="&basin" and Season=&season;
    yaxis grid;
run;
title;
%mend stormchart;

%stormchart(NA,2015)



%macro stormchart(basin, season) / minoperator;
proc sql noprint;
select min(season), max(season)
    into :minseason trimmed, :maxseason trimmed
    from mc1.storm_final;
quit;

%if &season<&minseason or &season>&maxseason %then %do;
    %put ERROR: Valid Seasons are between &minseason and &maxseason;
%end;

%else %do;
    proc sql noprint;
    select Basin
        into :basinlist separated by " "
        from mc1.storm_basin_codes;
    quit;
    %if &basin in &basinlist %then %do;
        title1 "Storm Frequency by Type";
        title2 "&basin, &season";
        proc sgplot data=mc1.storm_final noborder;
            vbar StormType / filltype=gradient;
            where Basin="&Basin" and Season=&Season;
            yaxis grid;
        run;
        title;
    %end;
    %else %do;
        %put ERROR: &basin is an invalid basin code. Basin codes include &basinlist..;
    %end;
%end;
%mend stormchart;

%stormchart(NA,2020)
%stormchart(EP,2010)
%stormchart(AA,2010)