// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function State(name, ind, lin, parent) constructor{
	state_name = name;
	state_index = ind; //not used for anything yet, was kinda put in place to make reading the state enums easier but haven't needed it yet
	linear = lin; 
	frames = [];
	first_frame = [];
	frame_rate = [];
	length = 0; //default value, will be set below
	page = 0; //which page of the sprite sheets to look at
	stateOnEnd = undefined;
	
	if linear {
		//array facing order: [down, up, right, left]
		switch state_name {
			case "idle": first_frame =[0,8,16,24]; length = 0; frame_rate=[0]; break;
			case "walk": first_frame =[32,40,48,56]; length = 6; frame_rate=[135,135,135,135,135,135]; break;
			case "push": first_frame =[1,9,17,25]; length = 2; frame_rate=[300,300]; break;
			case "pull": first_frame =[3,11,19,27]; length = 2; frame_rate=[400,400]; break;
		}
			
		for (var i=0; i<length; i++) {
			frames[0,i]=first_frame[0]+i;
			frames[1,i]=first_frame[1]+i;
			frames[2,i]=first_frame[2]+i;
			frames[3,i]=first_frame[3]+i;
		}
	} else {
		switch state_name {
			case "jump": frames=[[5,6,6,7,7],[13,14,14,15,15],[21,22,22,23,23],[29,30,30,31,31]]; length=5; frame_rate=[300,150,100,150,300]; break;
			case "run": frames=[[32,33,38,34,35,39],[40,41,46,43,44,47],[48,49,54,51,52,55],[56,57,62,59,60,63]]; length = 6; frame_rate=[80,55,125,80,55,125]; break; 
		}
		first_frame[0] = frames[0,0];
		first_frame[1] = frames[1,0];
		first_frame[2] = frames[2,0];
		first_frame[3] = frames[3,0];
	}
}

function state_graph(_state) { //mosatly used if you want a state to last only as long as the animation or to only run once
	switch _state {
		case "walk":	return states.walk; break;
		case "run":		return states.run; break;
		case "push":	return states.push; break;
		case "pull":	return states.pull; break;
		default:		return states.idle; break;
	}
}

function char_display() constructor{
	enum dl { //short for draw layers
		skin,
		outerware,
		capes,
		face_items,
		hair,
		hats,
		tools,
		weapons
	}
	
	var num_of_files = [1,4,0,0,2,2,0,0] 
	//the number of files in each catagory according to the enum in char_display function
	//update this array if you aquire any of the paid versions and import them into the project
	for (var i=0; i<=dl.weapons;i++)
		for (var k=0; k<num_of_files[i];k++) {
			fn[i,k] = noone; //fn short for file names
		}
	//skin tones
	fn[dl.skin,0] = char_a_p1_0bas_humn_v01;
	//outerware
	fn[dl.outerware, 0] = char_a_p1_1out_boxr_v01;
	fn[dl.outerware, 1] = char_a_p1_1out_fstr_v04;
	fn[dl.outerware, 2] = char_a_p1_1out_pfpn_v04;
	fn[dl.outerware, 3] = char_a_p1_1out_undi_v01;
	//hair
	fn[dl.hair,0] = char_a_p1_4har_bob1_v01;
	fn[dl.hair,1] = char_a_p1_4har_dap1_v01;
	//hats
	fn[dl.hats,0] = char_a_p1_5hat_pfht_v04
	fn[dl.hats,1] = char_a_p1_5hat_pnty_v04
	
	//struct for character draw layers
	layers_visible = [true,true,false,false,true,false,false,false]; //defaults to just showing hair and underware for now
	defaults = [fn[dl.skin,0],fn[dl.outerware,0],noone,noone,fn[dl.hair,1],noone,noone,noone];	
	layers = [];
	layers = defaults;
	
}

function controller_handler() constructor{
	//dpad movement
	d_left = false;
	d_right = false;
	d_down = false;
	d_up = false;
	left_held = 0;
	right_held = 0;
	down_held = 0;
	up_held = 0;
	
	//dpad maths
	inputX = 0;
	inputY = 0;
	
	//action buttons
	shift = false;
	interact = false;
	attack = false;
	
	//control scheme //for on the sly control scheme changes
	control_scheme = "WASD";
	
	function check_dpad() {
		switch (control_scheme) {
			case "WASD": wasd_update(); break;
			case "ESDF": esdf_update(); break;
			case "ARROW": dpad_update(); break;
			default: wasd_update();
		}
	}
	
	function check_interact() {
		//currently has no way to rebing key to something else, need a method to pass functions as variables to store which key or button is used
		return keyboard_check(vk_space);
	}
	
	function check_shift() {
		return keyboard_check(vk_shift);
	}
	
	function check_attack() {
		return keyboard_check(ord("Q"));
	}
	
	function hold_update() {
		if d_left { left_held++ } else { left_held = 0; }
		if d_right { right_held++ } else { right_held = 0; }
		if d_down { down_held++ } else { down_held = 0; }
		if d_up { up_held++ } else { up_held = 0; }
	}

	function wasd_update(){
		d_left =	keyboard_check(ord("A"));
		d_right =	keyboard_check(ord("D"));
		d_down =	keyboard_check(ord("S"));
		d_up =		keyboard_check(ord("W"));
		other_buttons();
	}

	function esdf_update(){ //I like using ESDF ok
		d_left =	keyboard_check(ord("S"));
		d_right =	keyboard_check(ord("F"));
		d_down =	keyboard_check(ord("D"));
		d_up =		keyboard_check(ord("E"));
		other_buttons();
	}

	function dpad_update(){ 
		d_left =	keyboard_check(vk_left);
		d_right =	keyboard_check(vk_right);
		d_down =	keyboard_check(vk_down);
		d_up =		keyboard_check(vk_up);
		other_buttons();
	}

	function other_buttons() {
		hold_update();
		shift = check_shift();
		interact = check_interact();
		attack = check_attack();
		inputX = d_right - d_left;
		inputY = d_down - d_up;
	}
	
}

