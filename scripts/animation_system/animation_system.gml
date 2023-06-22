/*
this function translates real time into framerate
time information, stored in the frame_rate array, is checked against a live clock
if the running total is greater than the amount to check against it will advance the frame forward by one
there's a commented out line that you can swap delta = 0; for if you want the most accurate framerate possible
But I've not seen a noticable difference so I've commented it out in favor of a line that does a similar job with less overhead
*/


function animation_update(){
	delta += delta_time/1000;
	if delta > state.frame_rate[ani] {
		delta = 0;
		ani++
	}
	if ani > state.length
		ani = 0;
}


function ani_reset() {
	//resets variables used in animation
	ani = 0;
	delta = 0;
	//image_index = state.first_frame[facing];
}

/*I
function animation_update(){
	delta += delta_time/1000;
	if delta > state.frame_rate[ani] {
		delta = 0;
		//delta -= state.frame_rate[ani]
		ani++
		if ani >= state.length {
			ani = 0;
			if state.stateOnEnd != undefined
				state_set(state.stateOnEnd);
			else 
				image_index = state.first_frame[facing];
		} else {
			image_index = state.frames[facing,ani];
		}
	}

	depth = -y;
}