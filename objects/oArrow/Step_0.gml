/// @description Insert description here
// You can write your code in this editor
if oPlayer.time_stop_time_left > 0 {
	exit;	
}
x += spd * cos(image_angle*pi/180);
y += spd * sin(image_angle*pi/180);
if place_meeting(x, y, oCollidable) {
	instance_destroy(self);	
}
depth = -y;