time_text = string(time_left div (60*60)) + ":" + string((time_left mod (60*60)) div 60)
draw_text_transformed(30, 30, time_text,3,3,0);

var p = sprint_frames_left / sprint_frames_max * 100;
draw_healthbar(30, h-30, 60, h-200, p, c_gray, c_red, c_yellow, 2, true, true);