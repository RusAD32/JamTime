/// @description Insert description here
// You can write your code in this editor
if place_meeting(x, y, oPlayer) {
	var agree = mouse_check_button_pressed(mb_left) || gamepad_button_check_pressed(0, gp_shoulderlb);
	var disagree = mouse_check_button_pressed(mb_right) || gamepad_button_check_pressed(0, gp_shoulderrb);
	if agree && !disagree {
		oPlayer.time_left -= 5*60;
		if irandom(100) == 1 {
			// POWERUPS.timeStop;
			oPlayer.time_stop_uses++;
		} else if irandom(100) == 1 {
			// POWERUPS.invis;
			oPlayer.invis_uses++;
		} else if irandom(100) < 5 {
			oPlayer.max_speed++;
		} else if irandom(100) < 5 {
			oPlayer.shields+=3;
		} else if irandom(100) < 10 {
			oPlayer.shields++;
		} else if irandom(100) < 10 {
			oPlayer.sprint_frames_max += 1*60;	
			oPlayer.sprint_frames_left += 1*60;	
		} else if irandom(100) < 15 {
			oPlayer.sprint_frames_left = oPlayer.sprint_frames_max;
		} else {
			oPlayer.time_left += 10*60;	
		}
		instance_destroy(self);
	} else if disagree && !agree {
		oPlayer.time_left += 5*60;
		instance_destroy(self);
	}
}
