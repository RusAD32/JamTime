/// @description Insert description here
// You can write your code in this editor
if oPlayer.time_stop_time_left > 0 {
	exit;	
}
if iframes == 0 {
	if shields == 0 {
		time_left -= 3*60 / defence;
	} else {
		shields--;
	}
	//x += sign(x - other.x) * 5;
	//y += sign(y - other.y) * 5;
	hspd += sign(x - other.x) * 5;
	vspd += sign(y - other.y) * 5;
	audio_play_sound(choose(sfxHit1,sfxHit2,sfxHit3,sfxHit4), 20, false);
	screenshake(10, 30, 0.7);
	iframes = 60;
}