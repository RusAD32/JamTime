/// @description Insert description here
// You can write your code in this editor
if room == rVictory or room == rDefeat {
	instance_destroy(oCamera);
	instance_destroy(oLevelGenerator);
	transition(TRANS_MODE.GOTO, rMainMenu);
}