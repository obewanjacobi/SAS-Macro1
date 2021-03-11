***********************************************************;
*  Activity 2.06                                          
*  Open a new program and submit a %PUT statement to list 
*  all user-defined macro variables.
*  Find the Path macro variable in the log. Path was 
*  created with a %LET statement in the libname.sas 
*  program, and it stores the location of the course files. 
*  Submit the following statements to view the value of 
*  Path. How are the messages in the log different?
*		%put NOTE: &=path;
*		%put ERROR- Course files are in &path;
***********************************************************;

%put _user_;

%put NOTE: &=path;
%put ERROR- Course files are in &path;

*
The first put statement gives us a note with the path laid out for us. 
It is printed as a note and in blue text
The second gives us an actual error statement, and even returns the text in
red to show it's an error. This could be useful down the line for error
handling, knowing now how to make error messages appear. 
*;