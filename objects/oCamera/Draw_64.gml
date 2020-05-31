/// @description Insert description here
// You can write your code in this editor
if instance_exists(oPlayer) {
	with oPlayer {
		drawSetText(c_white, fCyber, fa_left, fa_top);
		var seconds = string((time_left mod (60*60)) div 60);
		if string_length(seconds) == 1 {
			seconds = "0" + seconds;	
		}
		time_text = string(time_left div (60*60)) + ":" + seconds;
		draw_text_transformed(30, 30, time_text, 2, 2, 0);

		var p = sprint_frames_left / sprint_frames_max * 100;
		draw_healthbar(30, h-30, 60, h-200, p, c_gray, c_red, c_yellow, 2, true, true);
		draw_sprite(timeStop, 0,30, 80);
		draw_text_transformed(80, 80,string(time_stop_uses), 2, 2, 0);
		draw_sprite(invis, 0,30, 130);
		draw_text_transformed(80, 130,string(invis_uses), 2, 2, 0);
		draw_sprite(shield, 0,30, 180);
		draw_text_transformed(80, 180,string(shields), 2, 2, 0);
	}
}