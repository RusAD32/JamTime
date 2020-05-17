/// @description Insert description here
// You can write your code in this editor
if oPlayer.time_stop_time_left > 0 || oTransition.mode != TRANS_MODE.OFF {
	exit;	
}
time_alive_left--;
if time_alive_left == 0 {
	instance_destroy(self);	
}