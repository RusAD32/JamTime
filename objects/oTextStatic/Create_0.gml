/// @description Insert description here
// You can write your code in this editor

text = "Avsadfasdfasdf\nasdgfasv";
if oPlayer.controller == 0 {
	subtext = "Press SPACE to dismiss";
} else {
	subtext = "Press TRIANGLE to dismiss";
}
drawSetText(c_white, fCyber, fa_center, fa_top)
length = string_length(text);
w = 0;
h = 0;
border = 15;

time_to_live = 300; 


x = oPlayer.x;
y = oPlayer.y - oPlayer.sprite_height;