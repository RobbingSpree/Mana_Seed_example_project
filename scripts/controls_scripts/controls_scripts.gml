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
	hold_update();
}

function esdf_update(){ //I like using ESDF ok
	d_left =	keyboard_check(ord("S"));
	d_right =	keyboard_check(ord("F"));
	d_down =	keyboard_check(ord("D"));
	d_up =		keyboard_check(ord("E"));
	hold_update();
}

function dpad_update(){ 
	d_left =	keyboard_check(vk_left);
	d_right =	keyboard_check(vk_right);
	d_down =	keyboard_check(vk_down);
	d_up =		keyboard_check(vk_up);
	hold_update();
}

