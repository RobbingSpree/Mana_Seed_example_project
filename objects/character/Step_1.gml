/// @description Gather Input

//intend to replace this with an impart force approach so npcs can have the same controller

//gather input
var left = keyboard_check(vk_left) || keyboard_check(ord("A"));
var right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var down = keyboard_check(vk_down) || keyboard_check(ord("S"));
var up = keyboard_check(vk_up) || keyboard_check(ord("W"));

inputX = right - left;
inputY = down - up;

//update facing 
//facing favors left and right, to change this move the direction to favor to the bottom of the list
if down facing = 0;
if up facing = 1;
if left facing = 3;
if right facing = 2;