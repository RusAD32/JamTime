/// @description Insert description here
// You can write your code in this editor

time_left += other.time * 60;
audio_play_sound(sfxClockPickup, 20, false);
instance_destroy(other);