/// @description Insert description here
// You can write your code in this editor

randomize()
// Inherit the parent event
event_inherited();
view_cone_angle = random_range(view_cone_angle_min, view_cone_angle_max);
view_cone_length = irandom_range(view_cone_length_min, view_cone_length_max);
chase_r = irandom_range(view_cone_length, view_cone_length+chase_r_offset_max);
enum FOLLOW_STATE {
	on_path,
	chasing,
	returning,
}
follow = noone;
cur_state = FOLLOW_STATE.on_path;
look_dir = vectors[cur_vec, 1];