///@description

if (!file_exists(string("users/" + input + ".user"))) {
	keyboard_string = "Denied";
	alarm[2] = 60;
	audio_play_sound(snd_LoginFail, 1, false);
} else {
	global.USER = string(input);
	input = "";
	keyboard_string = "";
	closing = true;
	image_speed = 0.9;
	instance_create(0, 0, obj_Fade);
	audio_play_sound(snd_Login, 1, false);
}

if ((input = "guest") || (input = "Guest")) {
	global.USER = "Guest";
	closing = true;
	image_speed = 0.9;
	
	var i = instance_create(0, 0, obj_Fade);
	i.target = "next";
	
	audio_play_sound(snd_Login, 1, false);
}
