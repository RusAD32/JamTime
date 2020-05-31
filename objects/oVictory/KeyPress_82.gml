/// @description Insert description here
// You can write your code in this editor
if room == rVictory or room == rDefeat {
	oLevelGenerator.level_number = 1;
	transition(TRANS_MODE.GOTO, rMainGame);
}