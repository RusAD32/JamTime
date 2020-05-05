/// @description Insert description here
// You can write your code in this editor

randomize()
// Inherit the parent event
event_inherited();
max_speed = round(random_range(2, 6));
view_cone_angle = random_range(pi/4, pi/2);
view_cone_length = irandom_range(100, 300);
chase_r = irandom_range(view_cone_length, view_cone_length+300);
on_path = true;
enum FOLLOW_STATE {
	on_path,
	chasing,
	returning,
}
follow = noone;
cur_state = FOLLOW_STATE.on_path;
look_dir = vectors[cur_vec, 1];