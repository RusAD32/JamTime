/// @description Insert description here
// You can write your code in this editor
spd = 10;
angle = 0;
emitter = audio_emitter_create();
audio_emitter_falloff(emitter, 250, 1000, 20);
audio_emitter_gain(emitter, 0.1);
audio_emitter_pitch(emitter, 0.7);
audio_play_sound_on(emitter, sfxFire, true, 10);
