///@description Cursor

if (RUN_ACTIVE == noone) && (global.CAN_TYPE == true) {
	if (lCursor == "|") {
		lCursor = " ";	
	} else {
		lCursor = "|";	
	}
} else {
	lCursor = "";	
}

alarm[2] = lDelay;
