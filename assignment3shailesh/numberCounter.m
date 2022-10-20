function numberCounter(lowNum,highNum)
% this function takes 2 numbers as input and displays a counter from the 
% lower number to the higher number

while (lowNum>=0 && highNum>lowNum)
    fprintf('%d\n', lowNum);
    lowNum=lowNum+1;
end

