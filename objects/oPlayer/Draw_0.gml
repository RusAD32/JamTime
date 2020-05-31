/// @description Insert description here
// You can write your code in this editor
if invis_time_left > 0 {
	var alpha = 0.5;	
} else {
	var alpha = 1 - (iframes div 5 mod 2)	
}
draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, look_angle-90, c_white, alpha);


if time_stop_time_left {
	draw_set_color(c_black);
	draw_set_alpha(0.4);
	draw_circle(x, y, 500, false);
	draw_set_alpha(1);
}