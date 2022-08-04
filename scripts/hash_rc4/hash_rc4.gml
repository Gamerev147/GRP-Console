function hash_rc4(_str, _key) {

	/*
	** RC4 - encrypt / decrypt a string with the given password
	**
	** Usage:
	** str = rc4(str,key); // en- or decrypt the string
	**
	** Game Maker Studio compatible!
	** Code by DAG
	**
	** Notes:
	** RC4 is a trademark owned by RSA Data Security, Inc.
	** ARC4 and ARCFOUR are generic names for the algorithm.
	*/
	
	var str, key, str_len, key_len, out, s, k, i, j, pos, temp;

	str = string(_str);
	key = string(_key);
	out = "";

	str_len = string_byte_length(str);
	key_len = string_byte_length(key);

	for (i = 0; i < 256; i++) {
		s[i] = i;
		k[i] = string_byte_at(key, i mod key_len);
	}

	j = 0;
	for (i = 0; i < 256; i++) {
		j = (j + s[i] + k[i]) mod 256;
		temp = s[i];
		s[i] = s[j];
		s[j] = temp;
	}

	i = 0;
	j = 0;

	for (pos = 0; pos < str_len; pos++) {
		i = (i + 1) mod 256;
		j = (j + s[i]) mod 256;
		temp = s[i];
		s[i] = s[j];
		s[j] = temp;
		t = (s[i] + s[j]) mod 256;
		out += ansi_char(string_byte_at(str, pos+1) ^ s[t]);
	}
	
	return out;

}
