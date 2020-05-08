/// @description Insert description here
// You can write your code in this editor

image_angle = -look_dir / pi * 180;
draw_self();

//x_offs = view_cone_length * cos(look_dir);
//y_offs = view_cone_length * sin(look_dir);
var prev_col = draw_get_color();
var prev_alpha = draw_get_alpha();
draw_set_color(c_red);
draw_set_alpha(0.25);
var i = 0;
while i < view_cone_angle {
	x1_offs = view_cone_length * cos(look_dir + i);
	y1_offs = view_cone_length * sin(look_dir + i);

	x2_offs = view_cone_length * cos(look_dir - i);
	y2_offs = view_cone_length * sin(look_dir - i);
	i += view_cone_angle/5
	draw_line(x, y, x+x1_offs, y+y1_offs);
	draw_line(x, y, x+x2_offs, y+y2_offs);
}
//draw_line(x, y, x+x1_offs, y+y1_offs);
draw_set_color(prev_col);
draw_set_alpha(prev_alpha);
