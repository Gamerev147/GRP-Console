function scr_chromium_get_modifiers() {
	var modifier = 0;
	modifier |= keyboard_get_numlock() ? 0x100: 0x000;
	//modifier |= keyboard_get_capslock() ? 0x001: 0x000; // no caps lock supported
	modifier |= keyboard_check(vk_shift) ? 0x002: 0x000;
	modifier |= keyboard_check(vk_control) ? 0x004: 0x000;
	modifier |= keyboard_check(vk_alt) ? 0x008: 0x000;
	return modifier;


}
