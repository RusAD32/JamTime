/// @description Insert description here
// You can write your code in this editor
if not touched {
	with oLevelGenerator {
		if level_number == 5 && !oLevelGenerator.endless {
			transition(TRANS_MODE.GOTO, rVictory);
		}
		level_number++;
	}
	with oPlayer {
		sprint_frames_left = sprint_frames_max;	
	}
	transition(TRANS_MODE.RELOAD, room);
	touched = true;
}