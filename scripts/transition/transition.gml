///@desc transition(mode, target_room, target_x, target_y)
///@arg mode
///@arg target_room
///@arg target_x
///@arg target_y

with (oTransition) {
	mode = argument0;
	if (argument_count > 1) {
		target = argument1;
	}
}
