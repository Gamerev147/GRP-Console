function tween_easy_cubic(_input, _outmin, _outmax, _inputmax) {
	return _outmax * power(_input/_inputmax, 3) + _outmin;
}
