/// @description Initalize

//controller handeler
input = new controller_handler();

//movement variables
moveSpeed = 1.5; //pixles per frame movement speed
running_mult = 1; //how much faster running makes the movement speed
moveX = 0; //how far we would be moving in the x axis
moveY = 0; //how far we would be moving on the y axis
facing = 0; //holder for enum of what 4-way duirection the character is facing
pushing = noone; //ID of an object you're currently pushing
hold_count = 0; //count for charging or walking into a pushable object
push_dir = ""; //used to track and lock movement to the dimention you're pushing along
push_max = 80; //max number before walking into an object becomes pushing

//animation variables
ani = 0; //current frame of animation we're on, doesn't correspond to image_index
hold_max = 240; //max number of frames till a held attack auto launches
jump_dist = 32; //distance the character will travel during a jump
delta = 0; //time in miliseconds used for sub-frame animation handler
image_speed = 0; //set to 0 on purpose, frame progress is handled by a script
y_offset = 0; //used for fake vertical elevation
under_layer = char_a_p1_0bas_humn_v01; //skin tone

split = false; //true if you've split the sheet into indervidual frames, false if it's still one image

//outfit variables
outfit = new char_display();

//initalize state machine 
//state call syntax: ("name of state", index for checking if change has occured between frames, if the frames information needs just a start and end point or if all frames need to be named)
states = {
	idle :	new State("idle",0, true),
	walk :	new State("walk",1, true),
	run :	new State("run",2, false),
	jump:	new State("jump",3, false),
	push:	new State("push",4, true),
	pull:	new State("pull",5, true),
}

//gotta be a way to make this part of the constructor, but it tries to point to LWO before they exist somehow
state_graph(states.idle);
state_graph(states.walk);
state_graph(states.run);
state_graph(states.jump);
state_graph(states.push);
state_graph(states.pull);

//set initial state
state = states.idle;
