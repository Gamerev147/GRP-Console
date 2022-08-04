///@description Input Text

if (closing = false) {
	if (string_length(keyboard_string) < limit) {
		input = keyboard_string;
	} else {
		keyboard_string = input;	
	}
}

//Destroy the Sprite
if (image_index >= 26) { 
	instance_destroy();
}
