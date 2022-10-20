function [WooHah] = sumEvenOrOdd(num1,num2)
%this function takes 2 numbers as inputs and returns Woo if their sum is 
% even and Hah if their sum is odd. 

if mod((num1+num2),2) == 0
    WooHah = 'Woo'
elseif mod((num1+num2),2) == 1
    WooHah = 'Hah'
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%if mod(num,2) ==0 (to determine if the number is even or odd, use either
%function mod or rem. In this case, if the remainder is 1 then the number
%is odd and if the remainder is 0, then the number is even)
% or use function-- iseven isodd 