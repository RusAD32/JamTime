/// @description Insert description here
// You can write your code in this editor
switch cur_state {
	case SPIKE_STATE.off: {
		if time_left == 0 {
			time_left = time_on;
			cur_state = SPIKE_STATE.on;
			image_index = 1;
		}
	}
	case SPIKE_STATE.on: {
		if time_left == 0 {
			time_left = time_off;
			cur_state = SPIKE_STATE.off;
			image_index = 0;
		}
	}
}


time_left--;
depth = -y;