/********************************************
* Using SQL to Create Macro Variables: Demo *
********************************************/

 /* Section 1 */

proc sql noprint;
select mean(cost) format = dollar22.2
    into :avgcost trimmed
    from mc1.storm_damage;
quit;

%put &=avgcost;
%put &=sqlobs;

proc sql noprint;
select mean(cost) format = dollar22.2,
	   median(cost) format = dollar22.2
	   into :avgcost trimmed,
	   		:medcost trimmed
	   from mc1.storm_damage;
quit;

%put &=avgcost;
%put &=medcost;
%put &=sqlobs;

 /* Section 2 */

proc sql;
select *
	from mc1.storm_type_codes;
quit;

proc sql noprint;
select StormType
	into :Type1-
	from mc1.storm_type_codes;
quit;

%put &=type1 &=type2 &=type3 &=type4 &=type5;
%put &=sqlobs;

proc sql noprint;
select StormType
	into :typelist separated by ", "
	from mc1.storm_type_codes;
quit;

%put &=typelist;
%put &sqlobs;