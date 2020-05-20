/// @description Insert description here
// You can write your code in this editor
if oPlayer.time_stop_time_left > 0 {
	exit;	
}
if other.cur_state == SPIKE_STATE.on && iframes == 0 {
	if shields == 0 {
		time_left -= 3*60 / defence;
	} else {
		shields--;
	}
	screenshake(10, 30, 0.7);
	audio_play_sound(choose(sfxHit1,sfxHit2,sfxHit3,sfxHit4), 20, false);
	iframes = 60;
}