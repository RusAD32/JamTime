/// @description Insert description here
// You can write your code in this editor
with oLevelGenerator {
	level_number++;
}
with oPlayer {
	sprint_frames_left = sprint_frames_max;	
}
transition(TRANS_MODE.RELOAD, room);