/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
if oPlayer.time_stop_time_left > 0 || oTransition.mode != TRANS_MODE.OFF {
	if audio_emitter_exists(footsteps) {
		audio_emitter_free(footsteps);
		footsteps = noone;
	}
	exit;	
}
switch cur_state {
	
	case SHOOTING_STATE.on_path: {
		var p = collision_circle(x, y, view_cone_length, oPlayer, false, false);
		if p && 
				cosBetweenVectors(cos(vectors[cur_vec, 1]), sin(vectors[cur_vec, 1]), p.x - x, p.y - y) > cos(view_cone_angle) &&
				collision_line(x, y, p.x, p.y, oCollidable, false, false) == noone {
			follow = oPlayer;
			cur_state = SHOOTING_STATE.shooting;
			look_dir = cartesianToPolar(follow.x - x, follow.y - y);
			if audio_emitter_exists(footsteps) {
				audio_emitter_free(footsteps);
				footsteps = noone;
			}
			exit;
		}

		//show_debug_message(follow);

		event_inherited();
		look_dir = vectors[cur_vec, 1];
		break;
	}
	case SHOOTING_STATE.shooting: {	
		if shoot_wait_left == 0 {
			look_dir = cartesianToPolar(follow.x - x, follow.y - y);
			var proj = instance_create_depth(x, y, -y, oEnemyProjectile);
			proj.spd = proj_speed;
			proj.angle = look_dir;
			shoot_wait_left = shoot_pause;
		} else if sqrt(sqr(follow.x - x) + sqr(follow.y - y)) > chase_r || collision_line(x,y, follow.x, follow.y, oCollidable, false, true) != noone {
			follow = noone;
			
			footsteps = audio_emitter_create();

			audio_emitter_pitch(footsteps, pitch);
			audio_emitter_gain(footsteps, gain);
			audio_play_sound_on(footsteps, footstep_sound, true, 25)
			shoot_wait_left = shoot_pause;
			cur_state = SHOOTING_STATE.on_path;
			look_dir = vectors[cur_vec, 1];
		} else {	
			look_dir = cartesianToPolar(follow.x - x, follow.y - y);
		}
		shoot_wait_left = max(shoot_wait_left-1, 0);
	}
}