if w == 0 {
	w = max(string_width(text), string_width(subtext)) / 2;
}
if h == 0 {
	h = string_height(text + "\n") / 2 + string_height(subtext) / 4;
}
button_dismiss = keyboard_check(vk_space) || gamepad_button_check(0, gp_face4);

if button_dismiss || time_to_live == 0 {
	instance_destroy(self);
}

time_to_live--;

x = oPlayer.x;
y = oPlayer.y - oPlayer.sprite_height ;