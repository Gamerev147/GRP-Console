//response database for AI
function ConsoleAI() {
	
	globalvar AIRESP;
	AIRESP = ds_map_create();
	
	//Greetings
	ds_map_add(AIRESP, "greeting", ["Hi " + string(global.USER) + "!", "Hello " + string(global.USER) + "!", "Hello, how are you " + global.USER + "?"]);
	ds_map_add(AIRESP, "q_greeting", ["I'm good!", "I'm always the same.", "Great, how are you "+global.USER+"?"]);
	
	//Farewells
	ds_map_add(AIRESP, "farewell", ["Bye " + string(global.USER) + "", "Goodbye " + string(global.USER) + ""]);
	
	//Yes
	ds_map_add(AIRESP, "yes", ["Sure!", "Of course!", "Yes"]);
	
	//No
	ds_map_add(AIRESP, "no", ["I can't do that.", "Nope!", "No, sorry."]);
	
	//Good
	ds_map_add(AIRESP, "good_desc", ["Great!", "Awesome!", "That's good to hear " + global.USER + "!"]);
	
	//Bad
	ds_map_add(AIRESP, "bad_desc", ["I'm sorry.", "That's too bad.", "Is there something I could do to help?"]);
	
	
	
	//Initialize AI Dictionary
	globalvar AIDIC;
	AIDIC = ds_map_create();
	
	//[string, meaning]
	
	//Greetings
	ds_map_add(AIDIC, "hello", "greeting");
	ds_map_add(AIDIC, "hey",   "greeting");
	ds_map_add(AIDIC, "howdy", "greeting");
	ds_map_add(AIDIC, "sup",   "greeting");
	ds_map_add(AIDIC, "hi",    "greeting");
	ds_map_add(AIDIC, "how are you", "q_greeting");
	
	//Farewells
	ds_map_add(AIDIC, "later", "farewell");
	ds_map_add(AIDIC, "goodbye", "farewell");
	ds_map_add(AIDIC, "bye", "farewell");
	ds_map_add(AIDIC, "leave", "farewell");
	
	//Yes
	ds_map_add(AIDIC, "yes", "yes");
	ds_map_add(AIDIC, "yea", "yes");
	ds_map_add(AIDIC, "sure", "yes");
	ds_map_add(AIDIC, "ya", "yes");
	ds_map_add(AIDIC, "correct", "yes");
	
	//No
	ds_map_add(AIDIC, "no", "no");
	ds_map_add(AIDIC, "nope", "no");
	ds_map_add(AIDIC, "nah", "no");
	ds_map_add(AIDIC, "na", "no");
	
	//Names
	ds_map_add(AIDIC, "who", "name_request");
	
	ds_map_add(AIDIC, string(global.USER),	"user");
	ds_map_add(AIDIC, "ali",				"self");
	
	ds_map_add(AIDIC, "me", "user");
	ds_map_add(AIDIC, "you", "self");
	ds_map_add(AIDIC, "him", "present_name");
	ds_map_add(AIDIC, "her", "present_name");
	
	//Console Actions
	ds_map_add(AIDIC, "create", "console_action");
	ds_map_add(AIDIC, "clear", "console_action");
	ds_map_add(AIDIC, "copy", "console_action");
	ds_map_add(AIDIC, "delete", "console_action");
	ds_map_add(AIDIC, "rename", "console_action");
	ds_map_add(AIDIC, "run", "console_action");
	ds_map_add(AIDIC, "open", "console_action");
	ds_map_add(AIDIC, "log", "console_action");
	ds_map_add(AIDIC, "help", "console_action");
	
	//Actions
	ds_map_add(AIDIC, "how", "action");
	ds_map_add(AIDIC, "answer", "action");
	ds_map_add(AIDIC, "show", "action");
	ds_map_add(AIDIC, "tell", "action");
	ds_map_add(AIDIC, "talk", "action");
	ds_map_add(AIDIC, "remind", "action");
	ds_map_add(AIDIC, "remember", "action");
	ds_map_add(AIDIC, "please", "action");
	ds_map_add(AIDIC, "learn", "action");
	ds_map_add(AIDIC, "forget", "action");
	ds_map_add(AIDIC, "perform", "action");
	
	//Linking Actions
	ds_map_add(AIDIC, "am", "link_action");
	ds_map_add(AIDIC, "can", "link_action");
	ds_map_add(AIDIC, "add", "link_action");
	ds_map_add(AIDIC, "and", "link_action");
	ds_map_add(AIDIC, "to", "link_action");
	ds_map_add(AIDIC, "with", "link_action");
	ds_map_add(AIDIC, "without", "link_action");
	
	//Descriptions
	ds_map_add(AIDIC, "good", "good_desc");
	ds_map_add(AIDIC, "bad", "bad_desc");
	
	//Locations
	ds_map_add(AIDIC, "where", "location_request");
	ds_map_add(AIDIC, "united-states", "location");
	ds_map_add(AIDIC, "alabama", "location");
	ds_map_add(AIDIC, "alaska", "location");
	ds_map_add(AIDIC, "arizona", "location");
	ds_map_add(AIDIC, "arkansas", "location");
	ds_map_add(AIDIC, "california", "location");
	ds_map_add(AIDIC, "colorado", "location");
	ds_map_add(AIDIC, "connecticut", "location");
	ds_map_add(AIDIC, "delaware", "location");
	ds_map_add(AIDIC, "florida", "location");
	ds_map_add(AIDIC, "georgia", "location");
	ds_map_add(AIDIC, "hawaii", "location");
	ds_map_add(AIDIC, "idaho", "location");
	ds_map_add(AIDIC, "illinois", "location");
	ds_map_add(AIDIC, "indiana", "location");
	ds_map_add(AIDIC, "iowa", "location");
	ds_map_add(AIDIC, "kansas", "location");
	ds_map_add(AIDIC, "kentucky", "location");
	ds_map_add(AIDIC, "louisiana", "location");
	ds_map_add(AIDIC, "maine", "location");
	ds_map_add(AIDIC, "maryland", "location");
	ds_map_add(AIDIC, "massachusetts", "location");
	ds_map_add(AIDIC, "michigan", "location");
	ds_map_add(AIDIC, "minnesota", "location");
	ds_map_add(AIDIC, "mississippi", "location");
	ds_map_add(AIDIC, "missouri", "location");
	ds_map_add(AIDIC, "montana", "location");
	ds_map_add(AIDIC, "nebraska", "location");
	ds_map_add(AIDIC, "nevada", "location");
	ds_map_add(AIDIC, "new-hampshire", "location");
	ds_map_add(AIDIC, "new-jersey", "location");
	ds_map_add(AIDIC, "new-mexico", "location");
	ds_map_add(AIDIC, "new-york", "location");
	ds_map_add(AIDIC, "north-dakota", "location");
	ds_map_add(AIDIC, "north-carolina", "location");
	ds_map_add(AIDIC, "ohio", "location");
	ds_map_add(AIDIC, "oklahoma", "location");
	ds_map_add(AIDIC, "oregon", "location");
	ds_map_add(AIDIC, "pennsylvania", "location");
	ds_map_add(AIDIC, "rhode-island", "location");
	ds_map_add(AIDIC, "south-carolina", "location");
	ds_map_add(AIDIC, "south-dakota", "location");
	ds_map_add(AIDIC, "tennessee", "location");
	ds_map_add(AIDIC, "texas", "location");
	ds_map_add(AIDIC, "utah", "location");
	ds_map_add(AIDIC, "vermont", "location");
	ds_map_add(AIDIC, "virginia", "location");
	ds_map_add(AIDIC, "washington", "location");
	ds_map_add(AIDIC, "west-virgina", "location");
	ds_map_add(AIDIC, "wisconsin", "location");
	ds_map_add(AIDIC, "wyoming", "location");

}
