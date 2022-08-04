///@description

image_index = 0;
image_speed = 0;

x = room_width/2;
y = room_height/2 + 52;
closing = false;

input = "";
limit = 20;
cursor = "|";
delay = 15;
alarm[1] = delay;

ATTEMPTS = 0;
user_file = string("users/" + global.USER + ".user");

fast_file_encrypt(string(user_file), string(user_file), false);

ini_open(string(user_file));
user_pass = ini_read_string("data", "Password", "");

if (ini_key_exists("data", "Phrase")) {
	user_phrase = ini_read_string("data", "Phrase", "");	
} else {
	user_phrase = "";	
}

ini_close();

fast_file_encrypt(string(user_file), string(user_file), true);
