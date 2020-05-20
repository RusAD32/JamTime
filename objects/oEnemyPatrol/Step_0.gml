/// @description Insert description here
// You can write your code in this editor
if oPlayer.time_stop_time_left > 0 || oTransition.mode != TRANS_MODE.OFF {
	if audio_emitter_exists(footsteps) {
		audio_emitter_free(footsteps);
		footsteps = noone;
	}
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
show_debug_message(audio_emitter_exists(footsteps));

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
if audio_emitter_exists(footsteps) {
	audio_emitter_position(footsteps, x, y, 0);	
}

dist_left -= cur_spd;
if dist_left == 0 {
	audio_emitter_free(footsteps);
	footsteps = noone;
	cur_wait = wait_time;
} else if not audio_emitter_exists(footsteps) {
	footsteps = audio_emitter_create();

	audio_emitter_pitch(footsteps, pitch);
	audio_emitter_gain(footsteps, gain);
	audio_play_sound_on(footsteps, footstep_sound, true, 25);
	audio_emitter_position(footsteps, x, y, 0);		
}
