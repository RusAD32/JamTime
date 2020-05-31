/// @description init 

// variables for movement
max_speed = 10;

hspd = 0;
vspd = 0;
vspd_fraction = 0;
hspd_fraction = 0;
look_at_x = 0;
look_at_y = 0;
accel = 2;
decel = 1;

controller = 0;


// variables for direction
up = 0;
left = 0;


w = display_get_gui_width();
h = display_get_gui_height();

deactivaion_offset = 1000;
show_debug_message("Я родился!")

time_left = 5*60*60 // 5 minutes
look_angle = 0;

iframes = 0;

dash_frames = 0;
dash_frames_max = 10;

sprint_frames_left = 10*60; // 10 seconds;
sprint_frames_max = 10*60;

shields = 0;
defence = 1;
time_stop_uses = 1;
invis_uses = 1;

time_stop_time_left = 0;
time_stop_time_max = 3*60;

invis_time_left = 0;
invis_time_max = 5*60;

footsteps = noone;
ambience = audio_play_sound(sfxAmbience, 100, true);