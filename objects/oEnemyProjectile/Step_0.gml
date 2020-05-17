/// @description Insert description here
// You can write your code in this editor
if oPlayer.time_stop_time_left > 0 || oTransition.mode != TRANS_MODE.OFF {
	exit;	
}
x += spd * cos(angle);
y += spd * sin(angle);
if place_meeting(x, y, oCollidable) {
	instance_destroy(self);	
}
depth = -y;