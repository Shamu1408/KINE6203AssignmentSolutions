%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Name: Shailesh Gardas
%Date: 10th November 2022.
%Introduction: This assignment contains custom made functions designed to 
%compute means, weight normalized means, grouped means of data based on gender, and 
%also checks for increase in strength during the program.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%importfile function reads data from csv file 'isok_data_6803.csv' for the default 
% selection.  Returns the data as column vectors. It inputs all the
% variables in the workspace for further analysis.

[SubjectID, Age, Gender, Weight, Day1, Day2, Day3] = importfile('isok_data_6803.csv')

%genderIsoCalc function calculates the means of strength across three days 
%for individual male and female participants. It then calculates the
%overall grouped means of all the males and females. Detailed description
%of the function can be seen in the genderIsoCalc function sript.

[maleIsoIndMeans,femaleIsoIndMeans,maleGroupIsoMean,femaleGroupIsoMean] = genderIsoCalc(Gender,Day1,Day2,Day3)

%dayComparer function when called evaluates if there is an increase in
%strength amongst the subjects and outputs the subjectsIDs of participants
%who showed improvements in isometric strength or outputs 'NaN' who don't
%show improvement.Detailed description of the function can be seen in the 
%dayComparer function sript

[day1toDay2] = dayComparer(SubjectID,Day1,Day2)
[day2toDay3] = dayComparer(SubjectID,Day2,Day3)

day1toDay2 = [(day1toDay2)]';
day2toDay3 = [(day2toDay3)]';

%Weight normalized isometric strength of Day1, Day2 and Day3 are calculated
%by dividing the raw isometric strength by weight of individual
%participants. 
normDay1 = Day1./Weight; % the 'dot' after the Day is called basic arithmetic operator
normDay2 = Day2./Weight;
normDay3 = Day3./Weight;

%Overall normalized means across different days are calculated using mean
%function.
normDay1mean = mean(normDay1)
normDay2mean = mean(normDay2)
normDay3mean = mean(normDay3)

%The below lines of scripts uses varied functions to compile a table with
%the required outputs and finally export and save the file as
%"iso_results.csv" file.

%A variable 'T' is created consisting of the desired output variables. A
%point to note is that all the output variables have varied number of
%cells/ values under them.
T = {maleIsoIndMeans,femaleIsoIndMeans,maleGroupIsoMean,femaleGroupIsoMean,day1toDay2,day2toDay3,normDay1mean,normDay2mean,normDay3mean};

%deifining the maximum number of values that any of the output contains.
maxNumRow = 25;

%To make the number of values equal across all output variables, 'padarray'
%function is used below. The cells under the output variables which had no
%values have been inserted with 'NaN'.
results = cell2mat(cellfun(@(c){padarray(c,[maxNumRow-numel(c),0],NaN,'Post')},T));

%array2table function is used to assign the columns the appropriate
%variable names.
results = array2table(results, 'VariableNames', {'maleIsoIndMeans','femaleIsoIndMeans','maleGroupIsoMean','femaleGroupIsoMean','day1toDay2','day2toDay3','normDay1mean','normDay2mean','normDay3mean'});

%writetable function saves the final results table and exports it as the
%required csv file.
writetable(results,"iso_results.csv")





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FOR MY REFERENCE
% maxNumRow = max(cellfun(@(c) numel(c), T));  % max length
%maxNumRow = 25;
%results = cell2mat(cellfun(@(c){padarray(c,[maxNumRow-numel(c),0],NaN,'Post')},T));
% writematrix(results,'iso_data_6803.csv');