function [maleIsoIndMeans,femaleIsoIndMeans,maleGroupIsoMean,femaleGroupIsoMean] = genderIsoCalc(Gender,Day1,Day2,Day3)

%genderIsoCalc function takes four input variables(Gender,Day1,Day2, and Day3) from
%the isok_data_6803 data file. There are four outputs generated after
%calling the function. The first two outputs are related to individual
%means of isometric strength across three days in males (maleIsoIndMeans)
%and females(femaleIsoIndMeans). And the last two outputs are grouped
%means of isometric strength of males(maleGroupIsoMean) and
%females(femaleGroupIsoMean)

% "for" loop is used across the length of gender, as the outputs are grouped
% with respect to gender. An "if" conditional is used within the loop to
% define the gender (either males 'M' or/ else females 'F'). Depending on 
% the conditional, indvidual means for M/F across the three days is 
% calculated and saved in the respective variables.

for i = 1:length(Gender)
    if Gender(i) == 'M'
        maleIsoIndMeans(i) = (Day1(i)+Day2(i)+Day3(i))/3
    else
        femaleIsoIndMeans(i) = (Day1(i)+Day2(i)+Day3(i))/3
    end
end

%transposed the output from row to column 
maleIsoIndMeans = [maleIsoIndMeans]'
femaleIsoIndMeans = [femaleIsoIndMeans]'

%Finally, since the first two outputs contains zeros values in between, a
%nonzeros mean function is used below to calculate the grouped means for
%M and F. 

maleGroupIsoMean = mean(nonzeros(maleIsoIndMeans))
femaleGroupIsoMean = mean(nonzeros(femaleIsoIndMeans))








%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FOR MY REFERENCE
% G = findgroups(Gender)
% indMeanDay1 = splitapply(@mean,Day1,G);
% indMeanDay2 = splitapply (@mean,Day2,G);
% indMeanDay3 = splitapply (@mean,Day3,G);
% combinedMeanStrengthDayWise = [indMeanDay1,indMeanDay2,indMeanDay3];
% femaleIsoIndMeans = [combinedMeanStrengthDayWise(1,:)]'
% maleIsoIndMeans = [combinedMeanStrengthDayWise(2,:)]'
% maleGroupIsoMean = sum(maleIsoIndMeans, "all")/3
% femaleGroupIsoMean = sum(femaleIsoIndMeans, "all")/3
% end
