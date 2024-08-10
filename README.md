# conway_game_of_life

First of all, this is more of a simulation than a game. The Game of Life is the brainchild of mathematician John Conway and is Turing complete. Specify your starting state in "first" in the testbed file "conway_tb.v". Change the number of times you want to run the simulation by editing the clock settings in the testbed file. Simulations appear as a 16X16 grid of 0's and 1's where 1's denote cells that are alive. The simulation follows these rules:

-Living cells with lesser than 2 living neighbors die (underpopulation).

-Living cells with 2 or 3 living neighbors survive.

-Living cells with more than 3 living neighbors die (overpopulation).

-Dead cells with 3 living neighbors become live.

