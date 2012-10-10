function [] = montyDecision ()
% Jason Atwood
% 10/10/2012
% test of Monty Decision probabilities
tic
clc
clear all
close all
commandwindow
warning on verbose
% insert code here

% Documentation:
% - Both "game" and "player" actions are contained in this one script.
%
% - The presence/absence of a prize behind the three doors is stored in
%   'doors' vector. A value of 0 equals no prize. a value of 1 equals prize.
%   For example doors = [0, 1, 0] means prize is behind door #2

% system setup
numberOfTimesToPlayTheGame = 500;
results = [0, 0, 0, 0, 0]% results table

% 1. number of wins by switching
% 2. number of times switching
% 3. number of wins by NOT switching
% 4. number of times NOT switching
% 5. number of times the player got the decision right on the first time (without knowing it)

for i = 1:numberOfTimesToPlayTheGame
    fprintf('\n------ new game %d of %d --------\n', i, numberOfTimesToPlayTheGame)
    % PLAY THE GAME:
    % game generates doors
    doorWithPrize = randi(3,1); % randomly pick which of the 3 doors has prize
    doors = zeros(1,3);        % generate vector to binary door values
    doors(doorWithPrize) = 1;    % update vector to set door with prize
    fprintf('\tprize is behind door # %d\n',doorWithPrize)
    
    % player picks one door
    playerFirstDecision = randi(3,1); % randomly pick one of the three doors
    if playerFirstDecision == doorWithPrize % add to results
        results(5) = results(5) + 1;
    end
    fprintf('\tplayer initially picks door # %d\n',playerFirstDecision)
    
    % system puts unpicked door numbers into new vector
    unpickedDoors = [1, 2, 3]; 
    unpickedDoors(unpickedDoors==playerFirstDecision) = []; 
    
    % game reveals an unpicked door that does NOT have prize.
    revealedDoorNumber = randsample(unpickedDoors,1); % randomly picks which door to reveal
    revealedDoorValue = doors(revealedDoorNumber);    % gets the value of that door (prize or no prize)
    if (revealedDoorValue == 1)                      % if the game randomly picked the door w/ the prize
        unpickedDoors(unpickedDoors == revealedDoorNumber) = []; % remove that door from list of unpicked doors
        revealedDoorNumber = unpickedDoors(1);         % then tell the player about the other (only remaining) unpicked door
        revealedDoorValue = doors(revealedDoorNumber); % should always be 0
    end
    fprintf('\tgame reveals door # %d\n',revealedDoorNumber)
    
    % player decides to stay with initial decision or switch doors
    playerSecondDecision = randi(2,1) ;
        % binary decision:
        % 2 = switch to other door. 
        % 1 = stay with initial decision
    if playerSecondDecision == 1
        finalDecision = playerFirstDecision;
        fprintf('\tplayer decides to stick with initial decision\n')
    elseif playerSecondDecision == 2
        finalDecision = [1, 2, 3];  % to store final decision
        finalDecision(finalDecision == playerFirstDecision) = []; % not first decision,
        finalDecision(finalDecision == revealedDoorNumber) = []; % not revealed door
        finalDecision = finalDecision(1); % only one value left in array
        fprintf('\tplayer decides to change his decision to door # %d\n',finalDecision)
    end
        
    % game reveals decision of player
    resultOfGame = doors(finalDecision);
    if resultOfGame == 0
        fprintf('\tplayer loses\n')
    elseif resultOfGame == 1
        fprintf('\tplayer wins\n')
    end
    
    % system adds results to results table
    if playerSecondDecision == 1 % stay with initial decision
        results(4) = results(4) +1;
        if resultOfGame == 1
            results(3) = results(3) + 1;
        end
    elseif playerSecondDecision == 2 % switch from initial decision
        results(2) = results (2) + 1;
        if resultOfGame == 1
            results(1) = results(1) + 1;
        end
    end
    
end % done playing games
fprintf('\n\n=========== RESULTS =========\n')    
% system displays results to screen
fprintf('probability of guessing correctly on the first guess: %f percent\n',100*results(5)/numberOfTimesToPlayTheGame)
fprintf('probability of winning after switching: %f percent\n',100*results(1)/results(2))
fprintf('probability of winning after NOT switching: %f percent\n\n',100*results(3)/results(4))

% end code
fprintf('\nDone!\n')
toc
end
