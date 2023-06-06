function step_event(sm, parent) {
	switch sm.state_name {
		case "idle": idle_step(parent); break;
		case "walk": move_step(parent); break;
		case "push": push_step(parent); break;
		case "pull": break;
		case "jump": break;
		case "run" : move_step(parent); break
	}
}

function idle_step(parent) {
	with parent {
		//check for dpad input
		if input.inputX != 0 || input.inputY != 0 {
			if input.shift 
				state = states.run;
			else
				state = states.walk;
			move_step(parent);
		}
		//check for interact button input and a nearby object to interact with
	
		//check for attack input
	
	}
}

function move_step(parent) {
	with parent {
		//check for dpad0
		if input.inputX == 0 && input.inputY == 0 {
			state = states.idle;
		}
		//check for dpad input
		var m_mod = 1 + running_mult * keyboard_check(vk_shift);
		moveX = lerp(moveX, input.inputX * moveSpeed*m_mod, 0.2);
		moveY = lerp(moveY, input.inputY * moveSpeed*m_mod, 0.2);
		//check for shift toggle
		if state.state_name == "walk" && input.shift {
			state = states.run;
		}
		if state.state_name == "run" && !input.shift {
			state = states.walk;
		}
		//check for attack input 
	
		//check for pushing
	
		//commit to earlier input to movement
		move_and_collide(moveX,moveY,solid_,2);
	}
}

function push_step(parent) {
	with parent {
		
	}
}

function attack_step(parent) {
	with parent {
		//check animation end
	}
}