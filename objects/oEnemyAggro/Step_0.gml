/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

switch cur_state {
	
	case FOLLOW_STATE.on_path: {
		var p = collision_circle(x, y, view_cone_length, oPlayer, false, false);
		if p and cosBetweenVectors(cos(vectors[cur_vec, 1]), sin(vectors[cur_vec, 1]), p.x - x, p.y - y) > cos(view_cone_angle) {
			follow = oPlayer;
			cur_state = FOLLOW_STATE.chasing;
			exit;
		}

		//show_debug_message(follow);

		event_inherited();
		look_dir = vectors[cur_vec, 1];
		break;
	}
	case FOLLOW_STATE.chasing: {
		var dist_to_player = sqrt(sqr(x - follow.x) + sqr(y - follow.y));
		if dist_to_player > chase_r || collision_line(x, y, follow.x, follow.y, oCollidable, false, false) {
			follow = noone;
			cur_state = FOLLOW_STATE.returning;
			exit;
		}
		var xdist = follow.x - x
		hspd = sign(xdist) * min(abs(xdist), abs(xdist*max_speed/dist_to_player));
		var ydist = follow.y - y
		vspd = sign(ydist) * min(abs(ydist), abs(ydist*max_speed/dist_to_player));
		
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
		look_dir = cartesianToPolar(xdist, ydist);
		break;
	}
	case FOLLOW_STATE.returning: {
		var p = collision_circle(x, y, view_cone_length, oPlayer, false, false);
		if p != noone && cosBetweenVectors(cos(vectors[cur_vec, 1]), sin(vectors[cur_vec, 1]), p.x - x, p.y - y) > cos(view_cone_angle) {
			follow = oPlayer;
			cur_state = FOLLOW_STATE.chasing;
			exit;
		}
		var dist_to_target = sqrt(sqr(x - init_x) + sqr(y - init_y));
		var xdist = init_x - x;
		hspd = sign(xdist)*min(abs(xdist), abs(xdist/dist_to_target*max_speed));
		var ydist = init_y - y;
		vspd = sign(ydist)*min(abs(ydist), abs(ydist/dist_to_target*max_speed));
		x += hspd;
		y += vspd;
		look_dir = cartesianToPolar(xdist, ydist);
		if x == init_x && y == init_y {
			cur_vec = 0;
			cur_state = FOLLOW_STATE.on_path;
		}
		break;
	}
}
