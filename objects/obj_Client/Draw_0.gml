///@description Draw Text to Console

for (var i = 0; i < ds_list_size(senders); i ++) {
	
	var NAME = ds_list_find_value(senders, i);
	var MESSAGE = ds_list_find_value(messages, i);
	
	NetLog(string(NAME) + ": " + string(MESSAGE));
	NetLog(" ");
	
}

ds_list_clear(senders);
ds_list_clear(messages);
