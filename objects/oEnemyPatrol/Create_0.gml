/// @description Insert description here
// You can write your code in this editor

difficulty = oLevelGenerator.level_number;

init_x = x;
init_y = y;

max_speed = round(random_range(2, 10));
var i = difficulty - 1;
repeat(difficulty) {
	show_debug_message([x, y])
	// choosing vectors to build path from
	var vec_r = random_range(200, 1000);
	var vec_phi = random(2*pi);
	show_debug_message(vec_phi);
	var vec_x = cos(vec_phi) * vec_r;
	var vec_y = sin(vec_phi) * vec_r;
	var start_x = x;
	var start_y = y;
	// rounding not to get anything weird in sub-pixels
	vec_x = round(vec_x);
	vec_y = round(vec_y);
	
	// simulating the path to calculate collision
	dist_left = vec_r;
	while dist_left > 0 {
		if dist_left < max_speed {
			var cur_spd = dist_left;
		} else {
			var cur_spd = max_speed;
		}

		hspd = cos(vec_phi) * cur_spd;
		vspd = sin(vec_phi) * cur_spd;
		var flag = false;
		//horizontal
		if place_meeting(x + hspd, y, oCollidable) {
			while ! (place_meeting(x + sign(hspd), y, oCollidable)) {
				x += sign(hspd);
			} 
			flag = true
		}
		//vertical
		if place_meeting(x+hspd, y + vspd, oCollidable) {
			while ! place_meeting(x+hspd, y + sign(vspd), oCollidable) {
				y += sign(vspd);
			} 
			vspd = 0;
			flag = true;
		}

		if flag {
			vec_x = x - start_x;
			vec_y = y - start_y;
			break;
		}

		x += hspd;
		y += vspd;

		dist_left -= cur_spd;
	}
	
	vec_r = sqrt(sqr(vec_x) + sqr(vec_y));
	vec_phi = cartesianToPolar(vec_x, vec_y);

	vectors[i, 0] = vec_r;
	vectors[i, 1] = vec_phi;
//	x += vec_x;
//	y += vec_y;
	i--;
}
show_debug_message([x, y]);
// last vector to return to initial position
vec_x = init_x - x;
vec_y = init_y - y;
vectors[difficulty, 0] = sqrt(sqr(vec_x) + sqr(vec_y));
vectors[difficulty, 1] = cartesianToPolar(vec_x, vec_y);
x = init_x;
y = init_y;
//show_debug_message([x, y]);

cur_vec = 0;
dist_left = vectors[cur_vec, 0];

wait_time = round(random(180)); // frames
cur_wait = 0;

show_debug_message(vectors);