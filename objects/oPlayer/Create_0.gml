/// @description init player
event_inherited();
polygon = polygon_from_instance(id);
// variables for movement
max_speed = 7;

hspd = 0;
vspd = 0;
vspd_fraction = 0;
hspd_fraction = 0;

accel = 3;
decel = 2;

controller = 0;

move_vector_len = 0;

// variables for direction
up = 0;
left = 0;


w = display_get_gui_width();
h = display_get_gui_height();

deactivaion_offset = 1000;
tick = 0;