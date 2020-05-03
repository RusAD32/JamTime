/// @description camera movement

// destination
if instance_exists(follow) {
	x_to = follow.x;
	y_to = follow.y;
}

//movement

x += (x_to - x) / 20;
y += (y_to - y) / 20;

x = clamp(x, view_w_half + buff, room_width - view_w_half -buff)
y = clamp(y, view_h_half + buff, room_height - view_h_half - buff)

//shaking
x += random_range(-shake_rem, shake_rem)
y += random_range(-shake_rem, shake_rem)

shake_rem = max(0, shake_rem - ((1/shake_len) * shake_amp));
shake_len = max(0, shake_len - 1);

camera_set_view_pos(cam, x - view_w_half, y - view_h_half)
