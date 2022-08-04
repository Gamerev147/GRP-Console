/// @description Get Audio
snd = audio_create_stream(sndPath);
playSnd = audio_play_sound(snd, 1, false);
sndLength = audio_sound_length(playSnd);