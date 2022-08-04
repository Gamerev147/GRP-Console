///@description

if (string(input) == user_auth) {
	var i = instance_create(0, 0, obj_Fade);
	i.target = "display";
	closing = true;
	image_speed = 1;
	
	audio_play_sound(snd_Login, 1, false);
} else {
	input = "";
	keyboard_string = "";	
	ATTEMPTS += 1;
	audio_play_sound(snd_LoginFail, 1, false);
}
