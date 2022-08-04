/// @description fast_file_crypt(input_file, output_file);
/// @function fast_file_crypt
/// @param0 input_file
/// @param1 output_file
function fast_file_crypt(argument0, argument1) {

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

	This is a very simple file encoding script which can encode/decode any file by shifting each byte value by 128 bits. 

	Same script is used to Encode and Decode files.

	You can use same filename as input and output parameters.

	*********************************************************************
	EXAMPLES:

	* Encoding to different file:
	fast_file_crypt("game_level_01.ini", "game_level_01.lev");
	* Decrypting to a different file
	fast_file_crypt("game_level_01.lev", "game_level_01.ini");

	* Encoding to the same file:
	fast_file_crypt("user_progress.dat", "user_progress.dat");
	* Decoding to the same file:
	fast_file_crypt("user_progress.dat", "user_progress.dat");

	*********************************************************************
	*/

	var data, filename_in, filename_out, pos, len;

	filename_in = argument0; // File name of the input file to read data
	filename_out = argument1; // File name of the output processed file to save data. Can be the same as input file or different new file.
	pos = 0; // Initial 'seek' position in the buffer

	var file_buffer = buffer_load(filename_in); // Reading input file into the buffer
	len = buffer_get_size(file_buffer);  // Getting lenght of the buffer (file size)
	buffer_seek(file_buffer, buffer_seek_start, pos); // Setting 'seek' at the initial position

	while(pos != len) // Processing each byte in the buffer step by step until the end of the buffer
	{
		data = (buffer_read(file_buffer, buffer_u8) + 128) mod 256; // Reading current byte and encoding it

		buffer_seek(file_buffer, buffer_seek_start, pos); // Setting current 'seek' position in the buffer
		buffer_write(file_buffer, buffer_u8, data); // Writing processed byte to the buffer

		pos = buffer_tell(file_buffer);	// Getting current 'seek' position in the buffer

		//show_debug_message(string(pos/len * 100) +"%");
	}

	buffer_save(file_buffer, filename_out); // Saving processed buffer into the output file
	buffer_delete(file_buffer); // Removing buffer from memory

	//show_debug_message("Fast File Encryption Completed");
	return 1;


}
