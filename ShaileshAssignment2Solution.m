%% Tic Tac Toe

% Author:SG

% Displays a welcome message to the players.
disp("Welcome to Tic Tac Toe") 

% Asks the user if they want to play the game. 
wannaPlayTicTacToe = input('Do you want to play a game of Tic Tac Toe with me?(yes/no)',"s");

% "if" conditional evaluates the user input (yes/no) and then carries out
%the appropriate action. If user says yes, the game begins or if user says
% no, the game ends with a goodbye message.

% The gameboard is made of a number matrix from 1 to 9 representing the nine
%available moves. The gameboard was then converted from a double type to
%string so that it doesnt conflict with the input (number) entered by the
%players. (for eg: if we dont convert the gameboard to string, once the user enters the
%move, NaN was displayed in the matrix instead of an 'x' or '0'

if wannaPlayTicTacToe=="no"||wannaPlayTicTacToe=="NO"||wannaPlayTicTacToe=="No" 
    fprintf("Sad that you are not interested. May be next time!!") 
    return
end
    
while wannaPlayTicTacToe=="yes" ||wannaPlayTicTacToe== "Yes" ||wannaPlayTicTacToe== "YES"   %play Tic Tac Toe
board=[1 2 3;4 5 6;7 8 9];
gameBOARD = string(board);
disp("Instructions: In this game, you (human) will be playing against the computer. " + ...
    "The first move is played by you (human). The gameboard is" + ...
    " constructed with a number matrix from 1 to 9. To make a move, you " + ...
    "need to input a number between 1 to 9 (available moves) and press enter. Your move will " + ...
    "be denoted by an 'x' and computers move will be denoted by a '0'. " + ...
    "After every move the available moves will be updated and showed to you.")
disp("LET's PLAY!!")
disp(gameBOARD)
availableMoves = 1:9;
availableMoves = string(availableMoves)


% This game requires two players. One is a human and other is the computer.
%The game starts with the first move performed by human followed by
%computer. humanMove == x & computerMove == 0

% Below is the first for loop of the game, which includes the first two moves
%of the human and the computer.

%% Script for human moves
for i = 1:2
humanMove=input("Where do you want to move, 'Human'?","s");

% "while" loop is used here in case the user inputs any number other than the
% availableMoves. For eg: 10 or 11 or a letter - an error message will be displayed urging them to reenter a valid
% move.
while humanMove ~= availableMoves
        fprintf 'Invalid move. Please enter a number from the availableMoves!';
        humanMove = input('Please re-enter a valid move, human:','s');
end

% "switch" function is used instead of "if"  "elseif" statement to reduce the 
% number of lines in the code. Depending on the move chosen, the switch 
% function inserts "x" in the particular position on the gameboard matrix.

switch humanMove
    case '9'
    gameBOARD(3,3)="x"
    case '1'
    gameBOARD(1,1)="x"
    case '2'
    gameBOARD(1,2)="x"
    case '3'
    gameBOARD(1,3)="x"
    case '4'
    gameBOARD(2,1)="x"
    case '5'
    gameBOARD(2,2)="x"
    case '6'
    gameBOARD(2,3)="x"
    case '7'
    gameBOARD(3,1)="x"
    case '8'
    gameBOARD(3,2)="x"
end

% "setxor" function eliminates the number (move) played by the
% human and creates an updated availableMoves variable which is then
% displayed to the users.

availableMoves=setxor(availableMoves,humanMove);
disp("Available moves are") 
disp(availableMoves)

% Script for computerMove, computerMove = 0
computerMove = randi(numel(availableMoves));
computerMove = availableMoves(computerMove)

% Same as discussed in the human move section above. 
while computerMove ~= availableMoves 
    fprintf 'Invalid move. Please enter a number from the availableMoves!';
    computerMove = randi(numel(availableMoves)); % This command allows the
    %computer to randomly select an element from the availableMoves. 
    computerMove = availableMoves(computerMove); % this code gives us the 
    % index of the randomly selected move (from availableMoves) by the 
    % computer.
end

switch computerMove
    case '9'
  gameBOARD(3,3)="0"
    case '1'
  gameBOARD(1,1)="0"
    case '2'
  gameBOARD(1,2)="0"
    case '3'
  gameBOARD(1,3)="0"
    case '4'
  gameBOARD(2,1)="0"
    case '5'
  gameBOARD(2,2)="0"
    case '6'
  gameBOARD(2,3)="0"
    case '7'
  gameBOARD(3,1)="0"
    case '8'
  gameBOARD(3,2)="0"
end

disp("Computer played ")
disp(computerMove)

availableMoves=setxor(availableMoves,computerMove);
disp("Available moves are") 
disp(availableMoves)
end

%% This is the second "for" loop of the game, i.e., next four moves by the
%human and computer. After the 5th move (which is by the human), there
%is is a possibility of a win. So, we need to check and write codes for
%win condition after the 5th human move.

for i = 1:2

    humanMove=input("Where do you want to move, 'Human'?","s");

while humanMove ~= availableMoves
        fprintf 'Invalid move. Please enter a number from the availableMoves!';
        humanMove = input('Please re-enter a valid move, human:','s');
end

switch humanMove
    case '9'
   gameBOARD(3,3)="x"
    case '1'
   gameBOARD(1,1)="x"
    case '2'
   gameBOARD(1,2)="x"
    case '3'
   gameBOARD(1,3)="x"
    case '4'
   gameBOARD(2,1)="x"
    case '5'
   gameBOARD(2,2)="x"
    case '6'
   gameBOARD(2,3)="x"
    case '7'
   gameBOARD(3,1)="x"
    case '8'
   gameBOARD(3,2)="x"
end

availableMoves=setxor(availableMoves,humanMove);
disp("Game continues")
disp("Available moves are") 
disp(availableMoves)

% Checking for win conditions after this humanMove. There are 8 results
%possible; 3 vertical, 3 horizontal and 2 diagonal wins situations. If
%after the 5th move, any of these conditions are met, then the human wins
%and a congratulations message is displayed. If not, the game
%continues with a new set of availableMoves.

%1+2+3
result(1) = gameBOARD(1,1) + gameBOARD (1,2) + gameBOARD (1,3);
%4+5+6
result(2) = gameBOARD(2,1) + gameBOARD (2,2) + gameBOARD (2,3);
%7+8+9
result(3) = gameBOARD(3,1) + gameBOARD (3,2) + gameBOARD (3,3);
%1+4+7
result(4) = gameBOARD(1,1) + gameBOARD (2,1) + gameBOARD (3,1);
%2+5+8
result(5) = gameBOARD(1,2) + gameBOARD (2,2) + gameBOARD (3,2);
%3+6+9
result(6) = gameBOARD(1,3) + gameBOARD (2,3) + gameBOARD (3,3);
%1+5+9
result(7) = gameBOARD(1,1) + gameBOARD (2,2) + gameBOARD (3,3);
%3+5+7
result(8) = gameBOARD(1,3) + gameBOARD (2,2) + gameBOARD (3,1);
result = [result(1:8)];
if any(result =="xxx")
   disp('Congratulations Human!! You WON!! Thank you for playing!!')
   break
else

disp ("Game continues!!") 
% The game continues if the win condition is not satisfied
disp('Its computer turn to play!'); 
computerMove = randi(numel(availableMoves));
computerMove = availableMoves(computerMove);

while computerMove ~= availableMoves
    computerMove = randi(numel(availableMoves));
    computerMove = availableMoves(computerMove);
end

switch computerMove
    case '9'
    gameBOARD(3,3)="0"
    case '1'
    gameBOARD(1,1)="0"
    case '2'
    gameBOARD(1,2)="0"
    case '3'
    gameBOARD(1,3)="0"
    case '4'
    gameBOARD(2,1)="0"
    case '5'
    gameBOARD(2,2)="0"
    case '6'
    gameBOARD(2,3)="0"
    case '7'
    gameBOARD(3,1)="0"
    case '8'
    gameBOARD(3,2)="0"
end

disp("Computer played ")
disp(computerMove)

availableMoves=setxor(availableMoves,computerMove);
disp("Available moves are") 
disp(availableMoves)

% Now, after the 6th move (by computer) there is a possibility of the computer 
% winning. Hence, below is the code for checking the win condition for the 
% computer. If after this 6th move, any of these conditions are met, then 
% the computer wins and a congratulations message is displayed. 
% If not, the game continues with a new set of "availableMoves". 

%1+2+3
result(1) = gameBOARD(1,1) + gameBOARD (1,2) + gameBOARD (1,3);
%4+5+6
result(2) = gameBOARD(2,1) + gameBOARD (2,2) + gameBOARD (2,3);
%7+8+9
result(3) = gameBOARD(3,1) + gameBOARD (3,2) + gameBOARD (3,3);
%1+4+7
result(4) = gameBOARD(1,1) + gameBOARD (2,1) + gameBOARD (3,1);
%2+5+8
result(5) = gameBOARD(1,2) + gameBOARD (2,2) + gameBOARD (3,2);
%3+6+9
result(6) = gameBOARD(1,3) + gameBOARD (2,3) + gameBOARD (3,3);
%1+5+9
result(7) = gameBOARD(1,1) + gameBOARD (2,2) + gameBOARD (3,3);
%3+5+7
result(8) = gameBOARD(1,3) + gameBOARD (2,2) + gameBOARD (3,1);
result = [result(1:8)];

if any(result =="000")
   disp('Computer WON!! Better luck next time!! Thank you for playing!!')
   break
end
end
end

if any(result == "xxx" | result =="000")
   disp("Thank you for playing!!")
   wannaPlayTicTacToe = input(['Do you want to play again?(yes/no)'],"s"); 
else

%% This is the 9th (last) move of the game which will always be played by a
% human. Therefore, we have the human win condition code in the end.

humanMove=input("Where do you want to move, 'Human'?","s");

while humanMove ~= availableMoves
        fprintf 'Invalid move. Please enter a number from the availableMoves!';
        humanMove = input('Please re-enter a valid move, human:','s');
end

switch humanMove
    case '9'
   gameBOARD(3,3)="x"
    case '1'
   gameBOARD(1,1)="x"
    case '2'
   gameBOARD(1,2)="x"
    case '3'
   gameBOARD(1,3)="x"
    case '4'
   gameBOARD(2,1)="x"
    case '5'
   gameBOARD(2,2)="x"
    case '6'
   gameBOARD(2,3)="x"
    case '7'
   gameBOARD(3,1)="x"
    case '8'
   gameBOARD(3,2)="x"
end

% Check for win condition after this humanMove
%1+2+3
result(1) = gameBOARD(1,1) + gameBOARD (1,2) + gameBOARD (1,3);
%4+5+6
result(2) = gameBOARD(2,1) + gameBOARD (2,2) + gameBOARD (2,3);
%7+8+9
result(3) = gameBOARD(3,1) + gameBOARD (3,2) + gameBOARD (3,3);
%1+4+7
result(4) = gameBOARD(1,1) + gameBOARD (2,1) + gameBOARD (3,1);
%2+5+8
result(5) = gameBOARD(1,2) + gameBOARD (2,2) + gameBOARD (3,2);
%3+6+9
result(6) = gameBOARD(1,3) + gameBOARD (2,3) + gameBOARD (3,3);
%1+5+9
result(7) = gameBOARD(1,1) + gameBOARD (2,2) + gameBOARD (3,3);
%3+5+7
result(8) = gameBOARD(1,3) + gameBOARD (2,2) + gameBOARD (3,1);
result = [result(1:8)];
if any(result =="xxx")
   disp('Congratulations Human!! You WON!! Thank you for playing!!')
   wannaPlayTicTacToe = input(['Do you want to play again?(yes/no)'],"s");

else any(result ~= "xxx" & result ~= "000")  
   %If after the 9th move nobody wins, then a message is displayed saying
   %the game is tied.
    disp("Game is a tie!! Thank you for playing!!")
    wannaPlayTicTacToe = input('Do you want to play again?(yes/no)',"s");
end 
end
end

































