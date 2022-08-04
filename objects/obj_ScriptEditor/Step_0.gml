///@description Edit Text

//editor step
tte_ext_input_step();


//shortcut to save the file
if keyboard_check(vk_control) && keyboard_check(ord("S")) {
	save_text_input(file_name);
}
