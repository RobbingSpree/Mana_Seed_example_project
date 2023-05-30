
function round_n(num, multi) {
	//rounds a number (num) to closest multiple (multi)
	return round(num/multi)*multi;
}

function reset_drawing_modes() {
	draw_set_halign(-1);
	draw_set_valign(-1);
	draw_set_font(-1);
}

function if_walk_comes_to_push(dir,_shift) { 
//this script might have a problem where you can push diagonally against the side of an object and move it vertically due to the facing variable being not able to show diagonality
	if hold_count >= push_max { //you've walked into an object long enough to justify switching to pushing//pulling
		state = global.states.push
		if _shift
			state = global.states.pull
		pushing = instance_nearest(x,y,solid_);
		if !pushing.movable { //if object immovable
			state = global.states.idle;
			pushing = noone;
			hold_count = 0;
			return "";
		} else {
			//get facing direction and lock movement to that axis
			if dir > 1 {
				//left or right movement
				return "horr";
			} else {
				//up and down movement
				return "vert";
			}
		}
	}
}