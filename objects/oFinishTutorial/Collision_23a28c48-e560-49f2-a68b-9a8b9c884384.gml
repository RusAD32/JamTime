/// @description Insert description here
// You can write your code in this editor
if not touched {
	instance_destroy(oPlayer);
	transition(TRANS_MODE.GOTO, rMainMenu);
	touched = true;
}