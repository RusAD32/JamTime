/// @description Insert description here
// You can write your code in this editor
x += spd * cos(angle);
y += spd * sin(angle);
if place_meeting(x, y, oCollidable) {
	instance_destroy(self);	
}
depth = -y;