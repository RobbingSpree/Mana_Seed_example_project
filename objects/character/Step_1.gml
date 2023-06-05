/// @description Gather Input

//intend to replace this with an impart force approach so npcs can have the same controller

//gather input
input.check_dpad();

inputX = input.d_right - input.d_left;
inputY = input.d_down - input.d_up;

//update facing 
//facing favors left and right, to change this move the direction to favor to the bottom of the list
if input.d_down facing = 0;
if input.d_up facing = 1;
if input.d_left facing = 3;
if input.d_right facing = 2;