/// @description Insert description here
// You can write your code in this editor
if oPlayer.time_stop_time_left > 0 || oTransition.mode != TRANS_MODE.OFF {
	exit;	
}
x += spd * cos(image_angle*pi/180);
y += -spd * sin(image_angle*pi/180);
if place_meeting(x, y, oCollidable) {
	audio_play_sound_at(sfxArrowWallHit, x, y, 0, 100, 250, 10, false, 10);
	instance_destroy(self);	
}
depth = -y;