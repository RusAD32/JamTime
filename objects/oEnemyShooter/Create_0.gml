/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

event_inherited();

enum SHOOTING_STATE {
	on_path,
	shooting,
}

view_cone_angle = random_range(view_cone_angle_min, view_cone_angle_max);
view_cone_length = irandom_range(view_cone_length_min, view_cone_length_max);
chase_r = irandom_range(view_cone_length, view_cone_length+chase_r_offset_max);
follow = noone;
proj_speed = irandom_range(proj_speed_min, proj_speed_max)
shoot_pause = random_range(shoot_speed_timeout_min, shoot_speed_timeout_max);
shoot_wait_left = 0;
cur_state = SHOOTING_STATE.on_path;
look_dir = 0;