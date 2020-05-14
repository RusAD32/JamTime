depth = -y
time_left--;
iframes = max(0, iframes-1);
dash_frames = max(0, dash_frames-1);

time_stop_time_left = max(0, time_stop_time_left-1);
invis_time_left = max(0, invis_time_left-1);
//show_debug_message(string(dash_frames));
var_sigma += pulse_speed;