/// @description camera controls

/// @description create camera

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