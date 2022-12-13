clear all
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Importfile script%
mainPath = "C:\Users\gardass21\OneDrive - East Carolina University\Fall 2022\MATLAB\Stepwatches Data MATLAB Project Idea\"
num = 001;
introStr = "RLIC_";
comboStr = strcat(introStr,"00",num2str(num));
comboStr = strcat(introStr,"00",num2str(num),"\StepWatches");
comboStr = strcat(introStr,"00",num2str(num),"\StepWatches\", "Stepwatches_\");

Pre = 1;
Post = 2;
disp("Enter 1 = for accessing StepWatches_Pre folder and Enter 2 for accessing Stepwatches_Post folder!!")
askPrePost = input('Which folder do you want to access: 1 or 2:' ,"s");

if askPrePost == '1'
   comboStr = strcat(introStr,'00',num2str(num),'\StepWatches\', 'Stepwatches_Pre\')
else
   comboStr = strcat(introStr,"00",num2str(num),"\StepWatches\", "Stepwatches_Post\")
end

Right = 3;
Left = 4;
disp("Enter 3 = for accessing Right limb within StepWatches_Pre/ Post folder and Enter 4 for accessing Left limb within Stepwatches_Pre/ Post folder!!")
askLimb = input('Which folder do you want to access: 3 or 4:' ,"s");

if askLimb == '3'&& askPrePost == '1'
comboStr = strcat(introStr,'00',num2str(num),'\StepWatches\', 'Stepwatches_Pre\','Right\')
elseif askLimb == '3' && askPrePost == '2'
comboStr = strcat(introStr,"00",num2str(num),"\StepWatches\", "Stepwatches_Post\","Right\")
end

if askLimb == '4' && askPrePost == '1'
    comboStr = strcat(introStr,"00",num2str(num),"\StepWatches\", "Stepwatches_Pre\","Left\")
elseif askLimb == '4' && askPrePost == '2'
    comboStr = strcat(introStr,"00",num2str(num),"\StepWatches\", "Stepwatches_Post\","Left\")
end

disp(comboStr)

comboStr = strcat(comboStr, "RLIC_","00",num2str(num),"_Metric");

filePath = strcat(mainPath,comboStr);

MetricData = readtable(filePath)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Data analysis Script%
Steps = MetricData(:,13);
Steps = table2array(Steps);
TotalSteps = sum(Steps)

MinutesActive = MetricData(:,14);
MinutesActive = table2array(MinutesActive);
TotalMinutesActive = sum(MinutesActive)

PercentinAct = MetricData(:,15);
PercentinAct = table2array(PercentinAct);

for i = 1:length(PercentinAct)
if PercentinAct(i) > 0.99
PercentinAct(i) = 0
end
end
PercentinAct = nonzeros(PercentinAct);
meanPercentinAct = mean(PercentinAct)

PercentTimeLowAct = MetricData(:,16);
PercentTimeLowAct = table2array(PercentTimeLowAct);
PercentTimeLowActivity = mean(nonzeros(PercentTimeLowAct))

PercentTimeMedAct = MetricData(:,17);
PercentTimeMedAct = table2array(PercentTimeMedAct);
PercentTimeMediumActivity = mean(nonzeros(PercentTimeMedAct))

PercentTimeHighAct = MetricData(:,18);
PercentTimeHighAct = table2array(PercentTimeHighAct);
PercentTimeHighActivity = mean(nonzeros(PercentTimeHighAct))

PeakPerfIndex = MetricData(:,27);
PeakPerfIndex = table2array(PeakPerfIndex);
peakPerfIndex = max(PeakPerfIndex)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Exporting results script%

T = {TotalSteps, TotalMinutesActive, meanPercentinAct, PercentTimeLowActivity, PercentTimeMediumActivity, PercentTimeHighActivity, peakPerfIndex};
results = cell2table(T);
table_headers={'TotalSteps','TotalMinutesActive','meanPercentinAct','PercentTimeLowActivity','PercentTimeMediumActivity','PercentTimeHighActivity','peakPerfIndex'};
results_table = renamevars(results,1:7,table_headers);
writetable(results_table,'stepwatch_results.csv')

%%%% THANK YOU PATRICK FOR TEACHING ME ALL OF THIS. I am so glad to have taken this class. %%%%


