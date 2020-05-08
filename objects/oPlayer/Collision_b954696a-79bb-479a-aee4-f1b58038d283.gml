/// @description Insert description here
// You can write your code in this editor
if iframes == 0 {
	time_left -= 3*60;
	hspd += sign(x - other.x) * 3 + cos(other.angle) * 3;
	vspd += sign(y - other.y) * 3 + sin(other.angle) * 3;
	screenshake(10, 30, 0.7);
	iframes = 60;
}