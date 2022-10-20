function [primeNonprime] = findPrime(num)
%this function takes a number as input and returns true if the number is a
% prime number and false if the number is not prime

primeNonprime = isprime(num)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This is for shailesh's reference. Please grade the assignment on the
% above function.
% function [primeNonprime] = findPrime(num)
% if isprime(num)
%    primeNonprime = "1"
% else 
%    primeNonprime = "0"
% end