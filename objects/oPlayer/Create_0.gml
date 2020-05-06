/// @description init player

// variables for movement
max_speed = 10;

hspd = 0;
vspd = 0;
vspd_fraction = 0;
hspd_fraction = 0;

accel = 2;
decel = 1;

controller = 0;

move_vector_len = 0;

// variables for direction
up = 0;
left = 0;


w = display_get_gui_width();
h = display_get_gui_height();

deactivaion_offset = 1000;
show_debug_message("Я родился!")

time_left = 1*60*60 // 1 minute
look_angle = 0;

iframes = 0;