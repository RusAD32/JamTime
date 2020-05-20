/// @description camera controls

/// @description create camera
audio_falloff_set_model(audio_falloff_inverse_distance_clamped);

cam = view_camera[0];
follow = oPlayer;
view_w_half = camera_get_view_width(cam) / 2;
view_h_half = camera_get_view_height(cam) / 2;

x_to = xstart;
y_to = ystart;

shake_amp = 0;
shake_len = 30;
shake_rem = 0;

buff = 16
audio_listener_orientation(0,1,0,0,0,1);