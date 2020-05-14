/// @description Insert description here
// You can write your code in this editor
if invis_time_left > 0 {
	var alpha = 0.5;	
} else {
	var alpha = 1 - (iframes div 5 mod 2)	
}

surface_set_target(glow_surface);
shader_set_uniform_f(uni_glow_blur_sigma, sin(var_sigma));
shader_set_uniform_f(uni_glow_resolution, sprite_width, sprite_height);
draw_circle(sprite_width, sprite_height, min(sprite_width, sprite_height), false);
surface_reset_target();
texture_set_stage(samp_glow_surface, surface_get_texture(glow_surface));
shader_set(shd_glow_map);
draw_surface(glow_surface, x-sprite_width, y-sprite_height);
shader_reset();
draw_sprite_ext(sprite_index, image_index,x,y, 1, 1, look_angle, c_white, alpha);

if time_stop_time_left {
	draw_set_color(c_black);
	draw_set_alpha(0.4);
	draw_circle(x, y, 500, false);
	draw_set_alpha(1);
}