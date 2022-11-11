
function [day1toDay2] = dayComparer(SubjectID,DayA,DayB)

%dayComparer takes the SubjectID of the participants, the weights 
%lifted and checks whether there was increase in the isometric strength. It
%gives out 2 output matrices containing the SubjectIDs of the participants
% that displayed an increase in the strenght in the following days.

%Again, a "for" loop runs the if conditional 25 times (iterations), as
%there are 25 participants. Partipants who showed an increase in strength
%their subjectIDs are displayed as output and the participants who did not
%show improvements 'NaN' is displayed.

for i = 1:25
    if DayB(i) > DayA(i)
       day1toDay2(i) = SubjectID(i);
    else 
        day1toDay2(i) = NaN
    end
end
end