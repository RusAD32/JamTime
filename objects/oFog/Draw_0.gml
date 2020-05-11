/// @description Insert description here
// You can write your code in this editor
shader_set(sFog);
var res = shader_get_uniform(sFog, "u_resolution");
var offs = shader_get_uniform(sFog, "u_offset");
var time = shader_get_uniform(sFog, "u_time");

shader_set_uniform_f_array(res, [w*2, h*2]);
shader_set_uniform_f_array(offs, [x*2, y*2]);
shader_set_uniform_f_array(time, [0,0]);
draw_rectangle(x, y, x+w, y+h, false); 
shader_reset();
