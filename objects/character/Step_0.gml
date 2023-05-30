/// @charecter and statemachine update

animation_update();

var _shift = keyboard_check(vk_shift); //might make this a object variable instead of local variable so it can be collected in begin step

//only use input in states where input is read
if state == global.states.idle || state == global.states.walk || state == global.states.run {
	//check for move modifiers
	var m_mod = 1 + running_mult * keyboard_check(vk_shift);
	moveX = lerp(moveX, inputX * moveSpeed*m_mod, 0.2);
	moveY = lerp(moveY, inputY * moveSpeed*m_mod, 0.2);
	
	//check for collision
	if !position_meeting(x+moveX,y,solid_) {
		//Commit to movement, release any holds
		x += moveX;
		hold_count = 0; 
	} else {
		hold_count++;
		push_dir = if_walk_comes_to_push(facing,_shift);
	}
	if !position_meeting(x,y+moveY,solid_) {
		//commit to movement, release any holds
		y += moveY;
		hold_count = 0;
	} else {
		hold_count++;
		push_dir = if_walk_comes_to_push(facing,_shift);
	}

	//check if any direction buttons are pressed
	if inputX != 0 || inputY != 0 {
		//sprite update to move
		if _shift
			state_set(global.states.run);
		else
			state_set(global.states.walk);
	} else {
		//sprite update to idle
		state_set(global.states.idle);
	}
}

if state == global.states.push || state == global.states.pull {
	
}

depth = -y; //to replace with z tilting eventually 



