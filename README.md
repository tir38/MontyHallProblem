Monty Hall Problem
================
This is a little MATLAB script I wrote to help me understand the Monty Hall Problem ( http://en.wikipedia.org/wiki/Monty_Hall_problem). The script handles both "game show" and "player" sides of the game. The script creates and executes "the game" a user-defined number of times. Each time, the initial setup and user decisions are purely random. The results of each game are tabulated in the "results" array. 

=== To Use ====
Simply run the matlab script (from within matlab). The only option to adjust is the number of times the game is played, contained in the "numberOfTimesToPlayTheGame" variable. The only output is a series of messages to the MatLab command window. The messages display the steps of each game and finish with displaying the cumulative results. A sample output of these messages is contained in the "results.txt" file contained in this repo.

== Why? == 
Simply put, the rules of the game, while simple, create some confusion about the expected outcome. The Monty Hall Problem is a veridical paradox, which "produces a result that appears absurd but is demonstrated to be true nevertheless", to quote wikipedia. So what better way to cut through the debate than SHOW results. Thats exactly what this script was for.

