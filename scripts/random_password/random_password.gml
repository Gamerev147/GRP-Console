
function random_password(_length) {
	randomize();
	var i, result;
	result = "";
	for (i = 0; i < _length; i++) {
		if (i mod 2) result += string_char_at("a1e2i3o4u5", ceil(random(10)));
		else result += string_char_at("6b7c8d9f0ghjklmnprstwyz", ceil(random(23)));
	}
	return result;
}
