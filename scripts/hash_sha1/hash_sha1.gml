function hash_sha1(key, mess) {
	
	// Instantiation
	var strCrypto, strTarget, boolHashed, realABS, strRef, buff1stPass, buff2ndPass, i, retVal, str1stPass;
	// Argumentation
	strCrypto = key;
	strTarget = mess;
	// Definition
	boolHashed = false;				// Logic control
	realABS = 64;					// Algorithm Block Size
	strRef = "0123456789abcdef";	// Hexadecimal look-up

	// If the key is longer than SHA1 algorithm block size, hash the key.
	if(string_length(strCrypto) > realABS) {
		strCrypto = sha1_string_utf8(strCrypto);
		boolHashed = true;
	}

	// Create buffer of algorithm block size bytes of padding and then space for the message being authenticated.
	buff1stPass = buffer_create(realABS + string_length(strTarget), buffer_fixed, 1);
	// Create buffer of algorithm block size bytes of padding and then space for the 20 bytes of SHA1 hash sum from first pass.
	buff2ndPass = buffer_create(realABS+20, buffer_fixed, 1);

	// Write contents of strCrypto (plain or hashed) to buffers while performing bitwise xor.
	for(i = 1; i <= 64; i++) {
		if(boolHashed) {
			retVal = string_pos(string_char_at(strCrypto, i*2), strRef) + (string_pos(string_char_at(strCrypto, (i*2)-1), strRef)*16)-17*(i<=20);
		}
		else {
			retVal = ord(string_char_at(strCrypto, i));
		}
		buffer_write(buff1stPass, buffer_u8, retVal ^ $36);
		buffer_write(buff2ndPass, buffer_u8, retVal ^ $5C);
	}

	//Append the message to authenticate, then perform first pass of SHA1.
	buffer_write(buff1stPass, buffer_text, strTarget);
	str1stPass = buffer_sha1(buff1stPass, 0, buffer_tell(buff1stPass));

	// Convert hex string to u8 and write to 2nd pass buffer.
	for(i = 1; i <= 20; i++) {
		retVal = string_pos(string_char_at(str1stPass, i*2), strRef) + (string_pos(string_char_at(str1stPass, (i*2)-1), strRef)*16)-17;
		buffer_write(buff2ndPass, buffer_u8, retVal);
	}

	// Perform 2nd pass of SHA1.
	retVal = buffer_sha1(buff2ndPass, 0, buffer_tell(buff2ndPass));

	// Free memory.
	buffer_delete(buff1stPass);
	buffer_delete(buff2ndPass);

	return retVal;


}