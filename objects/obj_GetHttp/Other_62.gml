///@description Return the String

if (ds_map_find_value(async_load, "id") == IP_url) {
	
	if (ds_map_find_value(async_load, "status") == 0) {
		
		ip_str = ds_map_find_value(async_load, "result");
		ConsoleLog(string(ip_str), 0);
		
	} else {
		
		ip_str = "null";
		ConsoleLog("No string to be found or webpage is invalid.", 0);
	  
	}
	
}

instance_destroy();
