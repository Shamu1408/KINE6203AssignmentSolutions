function guessThatNumber()  % *** WARNING: CONTAINS INTENTIONAL BUGS! ***
%---------------------------------------------------------------
%       USAGE: guessThatNumber() - Assignment 5
%
%        NAME:
%
%         DUE: November 17
%
%
% DESCRIPTION: This program is supposed to allow the user to play
%              the Number Guessing Game, however, it contains bugs.
%              Your job is to find, correct, and mark the errors with
%              comments describing the bug, how you found it, 
%              and how you corrected it. Correct the bugs and submit this
%              corrected file on github. There are between 9 - 12 bugs,
%              depending on how you correct them. 
%
%      INPUTS: None
%
%     OUTPUTS: None
%
%---------------------------------------------------------------

beginner = 1;               % beginner level #
moderate = 2;               % moderate level #
advanced = 3;               % advanced level #
beginnerHighest = 10;       % highest possible number for beginner
moderateHighest = 100;      % highest possible number for moderate
advancedHighest = 1000;    % highest possible number for advanced

% clear screen and display game introduction

clc()
fprintf(['Guess That Number Game (buggy)\n\n', ...
'This program plays the game of Guess That Number in which you have to guess\n', ...
'a secret number.  After each guess you will be told whether your \n', ...
'guess is too high, too low, or correct.\n\n'])

% Get level of play (1-3) from user

fprintf('Please select one of the three levels of play:\n')
fprintf('   1) Beginner (range is 1 to %d)\n', beginnerHighest)
fprintf('   2) Moderate (range is 1 to %d)\n', moderateHighest)
fprintf('   3) Advanced (range is 1 to %d)\n', advancedHighest)

level = input('Enter level (1-3): ','s'); 

while level ~= beginner || level ~= moderate || level ~= advanced; 
    %Bug No.1: An or (||) logical operator was used earlier. Using ||
    % returns the game back to line 50 nd restarts the game. Whereas use
    % of && operator, ends the game after the user guesses the correct
    % number.
fprintf('Sorry, that is not a valid level selection.\n');
level = input('Please re-enter a level of play (1-3): ');

% set highest secret number based on level selected
if level == beginner 
    %%Bug no. 2: I found this by trying to run the code and getting a 
    % incorrect use of '=' error message. To determine equality we need to 
    % '==' instead of '='.
highest = beginnerHighest;

elseif level == moderate
highest = moderateHighest;

elseif level == advanced; 
highest = advancedHighest; 
%Bug no.3: I found this while running the code. Incorrect spelling of highest
%used. Corrected the small letter h with capital 'H' in advancedHighest. 

end

% randomly select secret number between 1 and highest for level of play

%Bug no.4: Although there was no error message displayed while running the
%code for the below line. However, I noticed that, earlier because of the use of 
% '+1' in the below line of code, the only secretNumber selected by default
% was the highest number from the respective levels of play. Removing the
% '+1' from the line enabled the user to select (guess) any number from the
% given range for each level.
secretNumber = floor(rand() * highest);     

% initialize number of guesses and User_guess

%Bug no.5: numOfTries needs to start from 0 or else one additional number
%of tries used is added in the end after the user correctly guesses the
%number. Therefore, numOfTries value changes from 1 to 0.
numOfTries = 0; 
userGuess = 0;

% repeatedly get user's guess until the user guesses correctly
while userGuess ~= secretNumber
%end      %%Bug no.6: The presence of end in this line made the game end here. 
% The script after line 93 was not executed wherein the user enters the guess and
% game moves forward. After commenting the 'end' at line 93, the game went 
% ahead properly.

% get a valid guess (an integer from 1-Highest) from the user
fprintf('\nEnter a guess (1-%d): ', highest);
userGuess = input('');

% add 1 to the number of guesses the user has made
numOfTries = numOfTries + 1; % Bug : moved this from bottom to top.

while userGuess < 1 || userGuess > highest 
    % Bug no.7: The greater than pr equals highest made the secretNumber 
    % (with the highest number) unreachable. Hence, removed the equals sign
    % and replaced >= by >.
fprintf('Sorry, that is not a valid guess.\nRe-enter a guess (1-%d): ', highest);
userGuess = input('');
end % of guess validation loop


% report whether the user's guess was high, low, or correct

% Bug no.8: Replaced the > operator in the below line of code with a <
% operator to satisfy all the either & or conditions for number guesses that
% are less or greater than the secret number.
if userGuess < secretNumber 
fprintf('Sorry, %d is too low.\n', userGuess);
elseif userGuess > secretNumber 
fprintf('Sorry, %d is too high.\n', userGuess);
elseif numOfTries == 1
fprintf('\nLucky You!  You got it on your first try!\n\n');
else
    %Bug no.9:There was no error message for below line of code
    %while running the script. The end message only showed the secret number
    %that was chosen randomly and not the number of tries used by the user
    %to guess that number. Adding 'numOfTries' in the below line gave that
    %additional information at the end of the game.
fprintf('\nCongratulations!  You got %d in %d tries.\n\n', ...
secretNumber,numOfTries);

fprintf('Game Over. Thanks for playing the Guess That Number game.\n\n');

end  % of guessing while loop
end 
end
% end of game