/// @description Insert description here
// You can write your code in this editor
if oPlayer.time_stop_time_left > 0 || oTransition.mode != TRANS_MODE.OFF {
	if audio_emitter_exists(emitter) {
		audio_emitter_free(emitter);
		emitter = noone;
	}
	exit;	
}
x += spd * cos(angle);
y += spd * sin(angle);
if !audio_emitter_exists(emitter) {	
	emitter = audio_emitter_create();
	audio_emitter_falloff(emitter, 250, 1000, 20);
	audio_emitter_gain(emitter, 0.1);
	audio_emitter_pitch(emitter, 0.7);
	audio_play_sound_on(emitter, sfxFire, true, 10);
	
}
audio_emitter_position(emitter, x, y, 0);
if place_meeting(x, y, oCollidable) {
	instance_destroy(self);
}
depth = -y;