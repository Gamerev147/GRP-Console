/// @description fast_file_encrypt(input_file, output_file, is_encoded);
/// @function fast_file_encrypt
/// @param0 input_file
/// @param1 output_file
/// @param2 is_encoded
function fast_file_encrypt(argument0, argument1, argument2) {

	// Script by Andrius Valkiunas http://www.existical.com/
	// Part of the "Fast Crypt" bundle at https://marketplace.yoyogames.com/assets/6057/fast-crypt
	// Version 1.3
	// 2nd September 2018

	/*
	****************************************************************************************************
	*** PLEASE NOTE, THIS IS A VERY SIMPLE AND FAST ENCODING INTENDED TO OBFUSCATE AND HIDE YOUR     ***
	*** GAME DATA, AND IT DOES NOT OFFER SECURE PROTECTION AGAINST PROFESSIONAL HACKERS/CRACKERS :)  ***
	*** FOR BEST SECURITY PLEASE USE SCRIPT 'fast_file_key_crypt' or 'fast_file_key_crypt_compress'  ***
	*** AS THEY BOTH USE SECURE ENCRYPTION WITH A SECRET KEY AND ALSO COMPRESSION (LAST SCRIPT ONLY) ***
	****************************************************************************************************

	This is a simple file encoding script which can encode/decode any file by shifting each byte value.
	Compared to function 'fast_file_crypt' this one uses floating number of bits for better encoding.

	Same script is used to Encode and Decode files, but you must use different parameter 'is_encoded' when encoding and decoding.
	Please note: If you use 'true' as 'is_encoded' parameter when encoding file, then you must use 'false' when decoding or vice versa.

	You can use same filename as input and output parameters.

	*********************************************************************
	EXAMPLES:

	* Encoding to different file:
	fast_file_encrypt("game_level_01.ini", "game_level_01.lev", true);
	* Decoding to a different file
	fast_file_encrypt("game_level_01.lev", "game_level_01.ini", false);

	* Encoding to the same file:
	fast_file_encrypt("user_progress.dat", "user_progress.dat", true);
	* Decoding to the same file:
	fast_file_encrypt("user_progress.dat", "user_progress.dat", false);

	*********************************************************************
	*/

	var data, filename_in, filename_out, pos, len, is_encrypted, bit_shift, shift_direction;

	filename_in = argument0; // File name of the input file to read data
	filename_out = argument1; // File name of the output processed file to save data. Can be the same as input file or different new file.
	pos = 0; // Initial 'seek' position in the buffer
	bit_shift = 128; // Initial bit shift value

	var file_buffer = buffer_load(filename_in); // Reading input file into the buffer
	len = buffer_get_size(file_buffer); // Getting lenght of the buffer (file size)
	buffer_seek(file_buffer, buffer_seek_start, pos); // Setting 'seek' at the initial position

	// Setting bit shift direction (increments or decrements)
	if (argument2 == true) { shift_direction = 1; }
	else { shift_direction = -1; }

	while(pos != len) // Processing each byte in the buffer step by step until the end of the buffer
	{
	    data = (buffer_read(file_buffer, buffer_u8) + bit_shift) mod 256; // Reading current byte and encoding it
	
		// Bit shift calculations {{{
		bit_shift += shift_direction;
		if (bit_shift > 255) { bit_shift = 1;}
		else if (bit_shift < 1) { bit_shift = 255;}
	    // Bit shift calculations }}}
	
		buffer_seek(file_buffer, buffer_seek_start, pos); // Setting current 'seek' position in the buffer
		buffer_write(file_buffer, buffer_u8, data); // Writing processed byte to the buffer
		pos = buffer_tell(file_buffer); // Getting current 'seek' position in the buffer
	
		//show_debug_message(string(pos/len * 100) +"%");
	}

	buffer_save(file_buffer, filename_out); // Saving processed buffer into the output file
	buffer_delete(file_buffer); // Removing buffer from memory

	//show_debug_message("Fast File Encryption Completed");
	return 1;


}
