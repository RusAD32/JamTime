/// @desc updating postion of the player

/**
*
* Block of getting inputs, both from keyboard and controller
*
*/


//movement control on keyboard
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_up = keyboard_check(ord("W"));
key_down = keyboard_check(ord("S"));
key_attack = mouse_check_button(mb_left) || keyboard_check(vk_space) ||
	gamepad_button_check(0, gp_face3) || gamepad_button_check(0, gp_shoulderr);
// key_dash = keyboard_check(vk_lshift) || gamepad_button_check(0, gp_face1);
// key_throw = mouse_check_button(mb_right) || gamepad_button_check(0, gp_shoulderl) || gamepad_button_check(0, gp_face4);

//checking for controller connected
if (gamepad_is_connected(0)) {
	controller = 1;
}

//if it is connected, but any of the buttons are pressed
if (keyboard_check(vk_anykey)) {
	controller = 0;
}

// getting movement in different axis 
if (controller) {
	var move_hor = gamepad_axis_value(0, gp_axislh);
	var move_vert = gamepad_axis_value(0, gp_axislv);
	
} else {
	var move_vert = key_down - key_up;
	var move_hor = key_right - key_left;
}


/**
*
* Calculating the movement
*
*/

// normalizing the vectors so that diagonal movement wasn't faster
var move_vector_len_total = sqrt( sqr(move_vert) + sqr(move_hor))

// we need partial movement, but we don't need it to be > 1
var move_vector_len = max(1, move_vector_len_total); 

var move_normalized_vert = move_vert / move_vector_len;
var move_normalized_hor = move_hor / move_vector_len;

//calculating last direction to choose the correct sprite
var cur_vert = round(move_vert/move_vector_len_total);
var cur_hor = round(move_hor/move_vector_len_total);
if (cur_vert != 0 || cur_hor != 0) {
	up = cur_vert;
	left = cur_hor;
}

if (move_normalized_hor != 0) {
	hspd = sign(move_normalized_hor) * min(max_speed * abs(move_normalized_hor), abs(hspd) + accel*abs(move_normalized_hor));
} else {
	hspd = sign(hspd) * max(0, abs(hspd) - decel);
}

if (move_normalized_vert != 0) {
	vspd = sign(move_normalized_vert) * min(max_speed * abs(move_normalized_vert), abs(vspd) + accel*abs(move_normalized_vert));
} else {
	vspd = sign(vspd) * max(0, abs(vspd) - decel);
}

// converting speed to integer while storing the fractions for later
// initial fractions are 0
vspd += vspd_fraction;
vspd_fraction = vspd - sign(vspd) * floor(abs(vspd));
vspd -= vspd_fraction;
hspd += hspd_fraction;
hspd_fraction = hspd - sign(hspd) * floor(abs(hspd));
hspd -= hspd_fraction;

// calculating collision

if place_meeting(x, y, oCollidable) {
	var col = instance_place(x, y, oCollidable);
	var x_dir = sign(x - col.x);
	if x_dir > 0 {
		x += col.bbox_right - bbox_left;
	} else if x_dir < 0 {
		x -= bbox_right - col.bbox_left;
	} else {
		var y_dir = sign(y - col.y);
		if y_dir > 0 {
			y += col.bbox_bottom - bbox_top;
		} else {
			y -= bbox_bottom - col.bbox_top;
		}
	}
}
//horizontal
if place_meeting(x + hspd, y, oCollidable) {
	while ! (place_meeting(x + sign(hspd), y, oCollidable)) {
		x += sign(hspd);
	} 
	hspd = 0;
}
// with room borders
if x + hspd < 0 || x + hspd > room_width{
	hspd = 0	
} 
//vertical
if place_meeting(x, y + vspd, oCollidable) {
	while ! place_meeting(x, y + sign(vspd), oCollidable) {
		y += sign(vspd);
	} 
	vspd = 0;
}
// with room borders
if y + vspd < 0 || y + vspd > room_height {
	vspd = 0	
} 

/*
*
* applying the calculated velocity
*
*/

x += hspd;
y += vspd;

