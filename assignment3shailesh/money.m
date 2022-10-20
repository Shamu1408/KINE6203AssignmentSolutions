function [totalAmount] = money(quarter, dime,nickel,penny)
%this function takes in the number of quarters, dimes, nickels,and pennies 
% as input and returns the total amount as output

totalAmount = (0.25*quarter)+(0.10*dime)+(0.05*nickel)+(0.01*penny)
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1usd = 0.25 quarter *4, 1usd = 0.05 nickel * 20, 1usd = 0.10 dime * 10 ,
% 1usd  = 0.1 penny * 100
