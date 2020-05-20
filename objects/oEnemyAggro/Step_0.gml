/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
if oPlayer.time_stop_time_left > 0 || oTransition.mode != TRANS_MODE.OFF{
	if audio_emitter_exists(footsteps) {
		audio_emitter_free(footsteps);
		footsteps = noone;
	}
	exit;	
}

switch cur_state {
	
	case FOLLOW_STATE.on_path: {
		var p = collision_circle(x, y, view_cone_length, oPlayer, false, false);
		if p && 
				abs(vectors[cur_vec, 1] - cartesianToPolar(p.x - x, p.y - y)) < view_cone_angle &&
				collision_line(x, y, p.x, p.y, oCollidable, false, false) == noone &&
				p.invis_time_left == 0 {
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
		if !audio_emitter_exists(footsteps) {
			footsteps = audio_emitter_create();
			audio_emitter_pitch(footsteps, pitch);
			audio_emitter_gain(footsteps, gain);
			audio_play_sound_on(footsteps, footstep_sound, true, 25);
		}
		
		audio_emitter_position(footsteps, x, y, 0);
		look_dir = cartesianToPolar(xdist, ydist);
		break;
	}
	case FOLLOW_STATE.returning: {
		var p = collision_circle(x, y, view_cone_length, oPlayer, false, false);
		if p != noone && 
				abs(vectors[cur_vec, 1] - cartesianToPolar(p.x - x, p.y - y)) < view_cone_angle &&
				p.invis_time_left == 0{
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
		if !audio_emitter_exists(footsteps) {
			footsteps = audio_emitter_create();
			audio_emitter_pitch(footsteps, pitch);
			audio_emitter_gain(footsteps, gain);
			audio_play_sound_on(footsteps, footstep_sound, true, 25);
		}
		
		audio_emitter_position(footsteps, x, y, 0);
		look_dir = cartesianToPolar(xdist, ydist);
		if x == init_x && y == init_y {
			cur_vec = 0;
			cur_state = FOLLOW_STATE.on_path;
			audio_emitter_free(footsteps);
			footsteps = noone;
		}
		break;
	}
}