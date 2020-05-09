/// @description Insert description here
// You can write your code in this editor
if time_left == 0 {
	var x_off = sprite_width * cos(image_angle*pi/180);
	var y_off = -sprite_height * sin(image_angle*pi/180);
	var arrow = instance_create_depth(x + x_off, y + y_off, -y - y_off, oArrow);
	arrow.image_angle = image_angle;
	arrow.spd = proj_speed;
	time_left = time_off;
}


time_left--;