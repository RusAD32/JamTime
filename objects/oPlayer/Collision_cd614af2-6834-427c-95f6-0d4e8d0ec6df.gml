/// @description Insert description here
// You can write your code in this editor
if iframes == 0 {
	if shields == 0 {
		time_left -= 3*60 / defence;
	} else {
		shields--;
	}
	screenshake(10, 30, 0.7);
	iframes = 60;
}