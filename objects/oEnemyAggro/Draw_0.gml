/// @description Insert description here
// You can write your code in this editor

image_angle = -look_dir / pi * 180;
draw_self();

//x_offs = view_cone_length * cos(look_dir);
//y_offs = view_cone_length * sin(look_dir);
var prev_col = draw_get_color();
var prev_alpha = draw_get_alpha();
draw_set_color(c_red);
draw_set_alpha(0.1);
var i = 0;
var look_dir_min = look_dir - view_cone_angle/2;
draw_primitive_begin(pr_trianglefan);
draw_vertex(x, y);
while i < 10 {
	x_offs = view_cone_length * cos(look_dir_min + i*view_cone_angle/10);
	y_offs = view_cone_length * sin(look_dir_min + i*view_cone_angle/10);
	i++;
	draw_vertex(x+x_offs, y+y_offs);
}
draw_primitive_end();
//draw_line(x, y, x+x1_offs, y+y1_offs);
draw_set_color(prev_col);
draw_set_alpha(prev_alpha);
