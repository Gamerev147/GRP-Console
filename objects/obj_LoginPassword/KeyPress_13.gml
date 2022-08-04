///@description

if (string(input) = string(user_pass)) {
	
	if (user_phrase == "") {
		var i = instance_create(0, 0, obj_Fade);
		i.target = "display";
		closing = true;
		image_speed = 1;
	
		audio_play_sound(snd_Login, 1, false);
	} else {
		closing = true;
		image_speed = 1;
	
		var i = instance_create(0, 0, obj_Fade);
		i.target = "factor";
	}
	
} else {
	
	input = "";
	keyboard_string = "";	
	ATTEMPTS += 1;
	audio_play_sound(snd_LoginFail, 1, false);
	
}
