/// @description fast_file_key_crypt(input_file, output_file, is_encrypted, encryption_key_string);
/// @function fast_file_key_crypt
/// @param0 input_file
/// @param1 output_file
/// @param2 is_encrypted
/// @param3 encryption_key_string
function fast_file_key_crypt(argument0, argument1, argument2, argument3) {

	// Script by Andrius Valkiunas http://www.existical.com/
	// Part of the "Fast Crypt" bundle at https://marketplace.yoyogames.com/assets/6057/fast-crypt
	// Version 1.3
	// 2nd September 2018

	/*
	This is secure and fast file encryption script which can encrypt/decrypt any file using provided secret key.

	Same script is used to Encrypt and Decrypt files, but you must use different parameter 'is_encrypted' when encrypting and decrypting.
	Please note: If you use 'true' as 'is_encrypted' parameter when encrypting file, then you must use 'false' when decrypting or vice versa.

	You can use same filename as input and output params.

	*********************************************************************
	EXAMPLES:

	* Encrypting to a different file:
	fast_file_key_crypt("game_level_01.ini", "game_level_01.lev", true, "SomeSecretKey");
	* Decrypting to a different file
	fast_file_key_crypt("game_level_01.lev", "game_level_01.ini", false, "SomeSecretKey");

	* Encrypting to the same file:
	fast_file_key_crypt("user_progress.dat", "user_progress.dat", true, "SomeSecretKey");
	* Decrypting to the same file:
	fast_file_key_crypt("user_progress.dat", "user_progress.dat", false, "SomeSecretKey");

	*********************************************************************
	*/

	var data, filename_in, filename_out, pos, len, is_encrypted, xor_shift, bit_shift, shift_direction, enc_key, key_hash, key_hash2, key_pos, key_len;

	filename_in = argument0; // File name of the input file to read data
	filename_out = argument1; // File name of the output processed file to save data. Can be the same as input file or different new file.
	key_pos = 0; // Current position of encryptor key byte
	pos = 0; // Initial 'seek' position in the buffer
	bit_shift = 128; // Initial bit shift value
	xor_shift = 1; // Initial xor shift value

	enc_key = argument3;

	key_hash = md5_string_unicode(enc_key)+sha1_string_unicode(enc_key)+md5_string_utf8(enc_key)+sha1_string_utf8(enc_key); // Getting first 72 byte (576 bit) long multi-hash string to use as encryption key
	key_hash2 = md5_string_unicode(key_hash)+sha1_string_unicode(key_hash)+md5_string_utf8(key_hash)+sha1_string_utf8(key_hash); // Getting additional 72 byte (576 bit) long multi-hash string based on previous hash string
	key_hash = key_hash + key_hash2; // Creating united unique 144 byte (1152 bit) hash key for encrypting data
	key_len = string_length(key_hash) div 2; // Key length in bytes

	// Setting bit shift direction (increments or decrements)
	if (argument2 == true) { shift_direction = 1; }
	else { shift_direction = -1; }

	// Creating an array for each hash key byte {{{
	var key_arr;
	for (var i=0; i<key_len; i++)
	{
	    key_arr[i] = hex_to_dec_fast(string_copy(key_hash, (i*2)+1, 2)); // Converting hexadecimal parts of hash key into decimal numbers which are stored in array
	}
	// Creating an array for each hash key byte }}}

	xor_shift = xor_shift mod 10; // Initial xor_shift value will depend on the key hash sum module of 10

	var file_buffer = buffer_load(filename_in); // Reading input file into the buffer
	len = buffer_get_size(file_buffer); // Getting lenght of the buffer (file size)
	buffer_seek(file_buffer, buffer_seek_start, pos); // Setting 'seek' at the initial position

	while(pos != len) // Processing each byte in the buffer step by step until the end of the buffer
	{

		switch (shift_direction) // This depends of 'is_encrypted' argument
		{
		case 1: // When 'is_encrypted' is true
			data = ((((buffer_read(file_buffer, buffer_u8) + bit_shift + key_arr[key_pos]) mod 256) ^ xor_shift) ^ key_arr[key_pos]); // Reading current byte and encrypting it	
			break;
		case -1: // When 'is_encrypted' is false (for encrypting in opposite direction from above)
			data = (((buffer_read(file_buffer, buffer_u8)  ^ xor_shift) ^ key_arr[key_pos]) + bit_shift - key_arr[key_pos]) mod 256; // Reading current byte and encrypting it	
			break;
	   }
	
		// Xor shift calculations {{{
		xor_shift += 1;
	
		// Every 5000 bytes encryption key is changed
		if (xor_shift > 5000)
		{ 
			xor_shift = 1;
		
			// Modifying encryption key	{{{
			key_hash = md5_string_unicode(key_hash2)+sha1_string_unicode(key_hash2)+md5_string_utf8(key_hash2)+sha1_string_utf8(key_hash2); // Getting first 72 byte (576 bit) long multi-hash string to use as encryption key
			key_hash2 = md5_string_unicode(key_hash)+sha1_string_unicode(key_hash)+md5_string_utf8(key_hash)+sha1_string_utf8(key_hash); // Getting additional 72 byte (576 bit) long multi-hash string based on previous hash string
			key_hash = key_hash + key_hash2; // Creating united unique 144 byte (1152 bit) hash key for encrypting data
		
			for (var i=0; i<key_len; i++)
			{
				key_arr[i] = hex_to_dec_fast(string_copy(key_hash, (i*2)+1, 2)); // Converting hexadecimal parts of hash key into decimal numbers which are stored in array
			}
			// Modifying encryption key	}}}
		}
	    // Xor shift calculations }}}
	
		// Bit shift calculations {{{
		bit_shift += shift_direction * (key_arr[(key_len-1)-key_pos] mod 2);
		if (bit_shift > 255) { bit_shift = 1;}
		else if (bit_shift < 1) { bit_shift = 255;}
	    // Bit shift calculations }}}
	
		// Current Encryption Key byte position {{{
		key_pos += 1;
		if (key_pos > (key_len-1)) {key_pos = 0; }
		// Current Encryption Key byte position }}}
	
		buffer_seek(file_buffer, buffer_seek_start, pos); // Setting current 'seek' position in the buffer
		buffer_write(file_buffer, buffer_u8, data); // Writing processed byte to the buffer
		pos = buffer_tell(file_buffer); // Getting current 'seek' position in the buffer
	
		//show_debug_message(string(pos/len * 100) +"%");
	}

	buffer_save(file_buffer, filename_out); // Saving processed buffer into the output file
	buffer_delete(file_buffer); // Removing buffer from memory

	//show_debug_message(string(filename_out));
	return 1;


}
