/// @description Insert description here
// You can write your code in this editor
if oPlayer.time_stop_time_left > 0 || oTransition.mode != TRANS_MODE.OFF {
	exit;	
}
if place_meeting(x, y, oPlayer) {
	var agree = mouse_check_button_pressed(mb_left) || gamepad_button_check_pressed(0, gp_shoulderlb);
	var disagree = mouse_check_button_pressed(mb_right) || gamepad_button_check_pressed(0, gp_shoulderrb);
	if agree && !disagree {
		oPlayer.time_left -= 5*60;
		var roll = random(1);
		if roll < 0.05 {
			// POWERUPS.timeStop;
			var txt = instance_create_depth(x,y,-y, oTextStatic);
			txt.text = "Time stop charge!\nPress E to use"
			oPlayer.time_stop_uses++;
		} else if roll < 0.10 {
			// POWERUPS.invis;
			var txt = instance_create_depth(x,y,-y, oTextStatic);
			txt.text = "Invisibility charge!\nPress Q to use"
			oPlayer.invis_uses++;
		} else if roll < 0.20 {
			var txt = instance_create_depth(x,y,-y, oTextStatic);
			txt.text = "Speed up!"
			oPlayer.max_speed++;
		} else if roll < 0.30 {
			var txt = instance_create_depth(x,y,-y, oTextStatic);
			txt.text = "Three shields!\n They'll protect you"
			oPlayer.shields+=3;
		} else if roll < 0.50 {
			var txt = instance_create_depth(x,y,-y, oTextStatic);
			txt.text = "A shield!\nIt will protect you"
			oPlayer.shields++;
		} else if roll < 0.65 {
			var txt = instance_create_depth(x,y,-y, oTextStatic);
			txt.text = "Stamina up!\n+1 second"
			oPlayer.sprint_frames_max += 1*60;	
			oPlayer.sprint_frames_left += 1*60;	
		} else if roll < 0.80 {
			var txt = instance_create_depth(x,y,-y, oTextStatic);
			txt.text = "Stamina restored!"
			oPlayer.sprint_frames_left = oPlayer.sprint_frames_max;
		} else {
			var txt = instance_create_depth(x,y,-y, oTextStatic);
			txt.text = "10 extra seconds!"
			oPlayer.time_left += 10*60;	
		}
		instance_destroy(self);
	} else if disagree && !agree {
		oPlayer.time_left += 5*60;
		instance_destroy(self);
	}
}
