///@desc screenshake(amplitude, len)
///@arg amplitude amplitude of shaking in pixels
///@arg length of shaking in frames

with oCamera {
	if argument0 > shake_rem { 
		shake_amp = argument0;
		shake_rem = argument0;
		shake_len = argument1;
		if argument_count > 2 {
			with oPlayer {
				if controller {
					 gamepad_set_vibration(0, argument2, argument2)
				}
			}
		}
	}
}
