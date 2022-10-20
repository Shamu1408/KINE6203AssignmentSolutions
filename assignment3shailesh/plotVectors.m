function plotVectors(vec1,vec2)
% this function takes two vectors and plots their values on a figure. The
% following codes inserts the chart title and axes labels to the figure.

plot(vec1,vec2)
title('vectorFigure')
xlabel('x')
ylabel('y')
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plotVector with a specific color and linestyle
% function plotVectors(x,y,color,style)
% plot(x,y,"Color",color,"LineStyle",style)
% title('vectorFigure')
% xlabel('x')
% ylabel('y')
% end