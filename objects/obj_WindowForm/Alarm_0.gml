/// @description Show Window

//Create the main form
fmain = ef_add_form(0, 0, 480, 240, string(title), true, -1, false);
fmain_desc_text = ef_add_text(fmain, 32, 32, string(text));


//Show Window
ef_center(fmain);
ef_show(fmain);
audio_play_sound(snd_Notification, 1, false);
