function [first,last] = strDetails(A);
% this function takes a string value as input and returns the length of the
% string and the first and last character as outputs.

strlength(A)
first = extract(A,1)
last = extract(A,strlength(A))
end