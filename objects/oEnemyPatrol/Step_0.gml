/// @description Insert description here
// You can write your code in this editor
if oPlayer.time_stop_time_left > 0 {
	exit;	
}
if cur_wait > 0 {
	cur_wait--; 
	if cur_wait == 0 {
		cur_vec++;
		if cur_vec > difficulty {
			cur_vec = 0;	
		}
		dist_left = vectors[cur_vec, 0];	
	}
	exit;
}

if dist_left < max_speed {
	var cur_spd = dist_left;
} else {
	var cur_spd = max_speed;
}

hspd = cos(vectors[cur_vec, 1]) * cur_spd;
vspd = sin(vectors[cur_vec, 1]) * cur_spd;

if place_meeting(x + hspd, y, oCollidable) {
	while ! (place_meeting(x + sign(hspd), y, oCollidable)) {
		x += sign(hspd);
	} 
	hspd = 0;
}
//vertical
if place_meeting(x, y + vspd, oCollidable) {
	while ! place_meeting(x, y + sign(vspd), oCollidable) {
		y += sign(vspd);
	} 
	vspd = 0;
}

x += hspd;
y += vspd;

dist_left -= cur_spd;
if dist_left == 0 {
	cur_wait = wait_time;
}
