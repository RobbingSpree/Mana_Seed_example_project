/// @charecter and statemachine update

animation_update();

//only use input in states where input is read
if state == states.idle || state == states.walk || state == states.run {
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
		
	}
	if !position_meeting(x,y+moveY,solid_) {
		//commit to movement, release any holds
		y += moveY;
		hold_count = 0;
	} else {

	}

	//check if any direction buttons are pressed
	if inputX != 0 || inputY != 0 {
		//sprite update to move
		if input.shift
			state_set(states.run);
		else
			state_set(states.walk);
	} else {
		//sprite update to idle
		state_set(states.idle);
	}
}

if state == states.push || state == states.pull {
	
}

depth = -y; //to replace with z tilting eventually 



