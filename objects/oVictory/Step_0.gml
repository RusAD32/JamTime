/// @description Insert description here
// You can write your code in this editor
sel = gamepad_button_check(0, gp_select);
st = gamepad_button_check(0, gp_start);

if sel {
	oLevelGenerator.level_number = 1;
	transition(TRANS_MODE.GOTO, rMainGame);
	exit;
}
if st {
	instance_destroy(oCamera);
	instance_destroy(oLevelGenerator);
	transition(TRANS_MODE.GOTO, rMainMenu);
}