/// @description Insert description here
// You can write your code in this editor
if oPlayer.time_stop_time_left > 0 || oTransition.mode != TRANS_MODE.OFF {
	exit;	
}
if time_left == 0 {
	var x_off = sprite_width/2 * cos(image_angle*pi/180);
	var y_off = -sprite_height/2 * sin(image_angle*pi/180);
	var flame = instance_create_depth(x + x_off, y + y_off, -y - y_off, oFlame);
	flame.time_left = time_on;
	flame.image_angle = image_angle;
	time_left = time_on + time_off;
}


time_left--;