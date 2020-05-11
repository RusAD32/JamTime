/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
if oPlayer.time_stop_time_left > 0 {
	exit;	
}
var ang = 0;
with oPlayer {
	ang = cosBetweenVectors(mouse_x - x, mouse_y - y, other.x - x, other.y - y);
}
if ang < 0.7 {
	event_inherited();
} else {
	var p = collision_circle(x, y, view_cone_length, oPlayer, false, false);
	if p && 
			abs(vectors[cur_vec, 1] - cartesianToPolar(p.x - x, p.y - y)) < view_cone_angle &&
			p.invis_time_left == 0{
		follow = oPlayer;
		cur_state = FOLLOW_STATE.chasing;
		exit;
	}	
}

