time_text = string(time_left div (60*60)) + ":" + string((time_left mod (60*60)) div 60)
draw_text_transformed(30, 30, time_text,3,3,0);