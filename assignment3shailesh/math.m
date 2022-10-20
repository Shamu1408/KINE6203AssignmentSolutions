function [sum,difference,product,maxi] = math(num1,num2)
%this function that takes 2 numbers (num1,num2) as input and returns values for the 
% sum, difference, product and max of the two numbers as outputs

sum = num1+num2
difference = abs(num1-num2)
product = num1*num2
maxi = max(num1,num2)
end



