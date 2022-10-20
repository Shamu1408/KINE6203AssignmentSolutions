function [logicalTriangle] = triangle(x)
%this function takes a single 3-element array (e.g. [3 4 5]), and returns a logical
% value (0 or 1) indicating if the 3 elements of the array represent the 
% sides of a valid triangle. 

x = sort(x);
if x(1,1)+x(1,2)>x(1,3)
   logicalTriangle = "1"
else
   logicalTriangle = "0"
end


% function [logicalTriangle] = triangle(a,b,c)
% if abs(a+b>c)
%     logicalTriangle = "1"
% elseif abs(a+b<c)
%     logicalTriangle = "0"
% elseif abs(b+c>a)
%     logicalTriangle = "1"
% elseif abs(b+c<a)  
%     logicalTriangle = "0"      
% elseif abs(a+c>b)
%     logicalTriangle = "1"
% elseif abs(a+c<b)
%     logicalTriangle = "0"     
% end



    
    
    



