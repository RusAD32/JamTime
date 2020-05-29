/// @description EM_STEP

em_step(
    keyboard_check_pressed(vk_up) || gamepad_button_check_pressed(0, gp_padu),
    keyboard_check_pressed(vk_down) || gamepad_button_check_pressed(0, gp_padd),
    keyboard_check_pressed(vk_enter)|| gamepad_button_check_pressed(0, gp_face1)
);

