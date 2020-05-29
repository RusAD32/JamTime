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
var ang = 0;
with oPlayer {
	ang = cosBetweenVectors(cos(look_angle*pi/180), -sin(look_angle*pi/180), other.x - x, other.y - y)
}
if abs(ang) > 0.7 {
	event_inherited();
} else {
	if audio_emitter_exists(footsteps) {
		audio_emitter_free(footsteps);
		footsteps = noone;
	}
	var p = collision_circle(x, y, view_cone_length, oPlayer, false, false);
	if p && 
			abs(vectors[cur_vec, 1] - cartesianToPolar(p.x - x, p.y - y)) < view_cone_angle &&
			p.invis_time_left == 0{
		follow = oPlayer;
		cur_state = FOLLOW_STATE.chasing;
		exit;
	}	
}

