/// @description Insert description here
// You can write your code in this editor
if iframes == 0 {
	time_left -= 3*60;
	//x += sign(x - other.x) * 5;
	//y += sign(y - other.y) * 5;
	hspd += sign(x - other.x) * 5;
	vspd += sign(y - other.y) * 5;
	screenshake(10, 30);
	iframes = 60;
}