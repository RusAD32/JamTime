/// @description Insert description here
// You can write your code in this editor
if iframes == 0 {
	if time_stop_time_left == 0 {
		if shields == 0 {
			time_left -= 3*60 / defence;
		} else {
			shields--;
		}
		hspd += sign(x - other.x) * 3 + cos(other.image_angle*pi/180) * 3;
		vspd += sign(y - other.y) * 3 + sin(other.image_angle*pi/180) * 3;
		screenshake(10, 30, 0.7);
		iframes = 60;
	}
	instance_destroy(other);
}