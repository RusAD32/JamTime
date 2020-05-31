/// @description Insert description here
// You can write your code in this editor

if instance_exists(oPlayer) && oPlayer.controller == 0 {
	subtext = "Press SPACE to dismiss";
} else {
	subtext = "Press TRIANGLE to dismiss";
}
length = string_length(text);
w = 0;
h = 0;
border = 15;

time_to_live = 300; 

if instance_exists(oPlayer) {
	x = oPlayer.x;
	y = oPlayer.y - oPlayer.sprite_height;
}