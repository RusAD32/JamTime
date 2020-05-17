/// @description 

var half_w = w/2;

draw_set_color(c_black);
draw_set_alpha(0.5);
draw_roundrect_ext(x-half_w-border, y-h-border*2, x+half_w+border, y, 10,10,false); // 10 10 -- radius of roundness
//draw_sprite(sMarker,0,x,y);
draw_set_alpha(1);

drawSetText(c_white, fCyber, fa_center, fa_top);
draw_text(x, y-h-border, current_text);