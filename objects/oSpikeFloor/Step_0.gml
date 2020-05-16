/// @description Insert description here
// You can write your code in this editor
if oPlayer.time_stop_time_left > 0 {
	exit;	
}
switch cur_state {
	case SPIKE_STATE.off: {
		if time_left == 0 {
			time_left = time_on;
			cur_state = SPIKE_STATE.on;
			image_index = 1;
			audio_play_sound_at(sfxSpikesEngage, oCamera.x-x, oCamera.y-y, 0, 200, 500, 10, false, 10);
		}
	}
	case SPIKE_STATE.on: {
		if time_left == 0 {
			time_left = time_off;
			cur_state = SPIKE_STATE.off;
			audio_play_sound_at(sfxSpikeRelease, oCamera.x-x, oCamera.y-y, 0, 200, 500, 10, false, 10);
			image_index = 0;
		}
	}
}


time_left--;
depth = -y;