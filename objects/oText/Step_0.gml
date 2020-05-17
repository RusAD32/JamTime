/// @description 
current_letter += spd;
current_text = string_copy(text, 1, floor(current_letter));

if h == 0 {
	h = string_height(text);
}
w = string_width(current_text);

if current_letter >= length && (keyboard_check(vk_anykey) || mouse_check_button(mb_any)){
	instance_destroy();
}
