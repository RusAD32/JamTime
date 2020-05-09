/// @description Insert description here
// You can write your code in this editor
if other.cur_state == SPIKE_STATE.on && iframes == 0 {
	time_left -= 3*60;
	screenshake(10, 30, 0.7);
	iframes = 60;
}