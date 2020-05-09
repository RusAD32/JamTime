/// @description Insert description here
// You can write your code in this editor
enum SPIKE_STATE {
	off,
	on
}
cur_state = SPIKE_STATE.off;

time_on = irandom_range(time_on_for_min, time_on_for_max);
time_off = irandom_range(time_on, time_off_for_max);
time_left = time_off;
