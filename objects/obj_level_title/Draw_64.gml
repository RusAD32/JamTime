action_color(16777215);
action_font(font0, 0);
var col, alp;

col = draw_get_colour();
alp = draw_get_alpha();

draw_set_colour(c_black);
draw_set_alpha(0.5);
draw_rectangle(0,0, __view_get( e__VW.WPort, 0 ), 
                            __view_get( e__VW.HPort, view_current )/4, false);

                           
draw_set_colour(c_white);
draw_set_alpha(1);
draw_text(__view_get( e__VW.WView, view_current )/8, __view_get( e__VW.HView, view_current )/8, string_hash_to_newline(title));

draw_set_colour(col);
draw_set_alpha(alp);


