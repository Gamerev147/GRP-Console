///@description help(section)

function help(_section) {

	//Display a few helpful commands (with the given section)

	var sec = "";
	sec += string(_section) + "";
	
	switch (sec) {
			
		case "file":
			ConsoleLog("[c_green]--- FILE RELATED COMMANDS", 0);
			ConsoleLog("- System Directory", 0);
			ConsoleLog("sysdir         Logs a list of all the files in the current directory.", 0);
			ConsoleLog("syspath        Logs the current working system path.", 0);
			ConsoleLog(" ", 0);
			ConsoleLog("- Folder Directories", 0);
			ConsoleLog("dir_t([w][p][t][g])     Logs different directory paths.", 0);
			ConsoleLog("dir_cr(name)            Creates a folder (directory).", 0);
			ConsoleLog("dir_dl(name)            Deletes a given directory.", 0);
			ConsoleLog("dir_rn(name, newname)   Renames the given directory.", 0);
			ConsoleLog(" ", 0);
			ConsoleLog("- File Handling", 0);
			ConsoleLog("del(name)                 Deletes the given file.", 0);
			ConsoleLog("ren(name, new)	          Renames the given file.", 0);
			ConsoleLog("file_cr(name, att)        Creates a file. [h] hidden adds the file to hidden directory.", 0);
			ConsoleLog("file_ch(name)             Checks if the given file exists.", 0);
			ConsoleLog("file_wr(name, pass)       Opens a file for writing.", 0);
			ConsoleLog("contents(name, pass)      Logs the contents of a file.", 0);
			ConsoleLog("file_cp(name, new, pass)  Copies a file to another location.", 0);
			ConsoleLog("file_mv(path, new, pass)  Moves a file to another location.", 0);
			ConsoleLog("encrypt(name)             Encrypts the given file.", 0);
			ConsoleLog("decrypt(name)             Decrypts the given file.", 0);
			ConsoleLog("file_pass(name, pass)     Adds a password lock to the given file.", 0);
			ConsoleLog("file_passdl(name, pass)   Deletes a file password lock.", 0);
			ConsoleLog(" ", 0);
		break;
			
		case "com":
			ConsoleLog("[c_green]-- SYSTEM COMMANDS", 0);
			ConsoleLog("clear                   Clears all loggings in the console.", 0);
			ConsoleLog("refresh                 Restarts the command console.", 0);
			ConsoleLog("close                   Exit the command console.", 0);
			ConsoleLog("color(0-3)              Changes console color scheme.", 0);
			ConsoleLog("full(exit)              Enter or [exit] fullscreen mode.", 0);
			ConsoleLog(" ", 0);				     
			ConsoleLog("cc					    Passes command handling to the core.", 0);
			ConsoleLog("download(url, name)     Downloads the file contained in URL and saves to name.", 0);
			ConsoleLog("execute(file)           Executes a Windows Runtime EXE.", 0);
			ConsoleLog("open(file)              Opens the given file (*jpg, png, gif, txt, ini, dat, grp, user, ogg, etc).", 0);
			ConsoleLog("run(file, mode, line)   Runs a GRP only file as a program.", 0);
			ConsoleLog("runner                  Creates a new runner window.", 0);
			ConsoleLog(" ", 0);				    
			ConsoleLog("update                  Checks for a GRPC system update.", 0);
		break;
			
		case "net":
			ConsoleLog("[c_green]-- NETWORING COMMANDS", 0);
			ConsoleLog("netchk              Logs current network connection.", 0);
			ConsoleLog("neturl(url)         Opens the given url.", 0);
			ConsoleLog("netstring(url)      Returns string from url.", 0);
			ConsoleLog("n_cr_server         Creates a networking server open for connection.", 0);
			ConsoleLog("n_cn_server         Connects to an open server as a client.", 0);
			ConsoleLog("n_send              Sends a string broadcast message across the network.", 0);
			ConsoleLog("n_dn_server         Disconnects the current user from the connected server.", 0);
			ConsoleLog("n_dis_all           Disconnects all clients from the server. Can only be used by host.", 0);
			ConsoleLog(" ", 0);
		break;
			
		case "user":
			ConsoleLog("[c_green]-- USER COMMANDS", 0);
			ConsoleLog("u_cr(name, pass)             Creates a new user.", 0);
			ConsoleLog("u_li(name, pass)             Logs into the given user account.", 0);
			ConsoleLog("u_dl(name, pass)             Deletes a user account.", 0);
			ConsoleLog("u_lo()                       Logs out of the currently signed in account.", 0);
			ConsoleLog("u_cu()                       Displays the user currently logged in.", 0);
			ConsoleLog("u_pa_cg(user, pass, new)     Changes password of the given user.", 0);
			ConsoleLog(" ", 0);
		break;
			
		case "":
			ConsoleLog("Please enter the help command followed by one of the following:", 0);
			ConsoleLog("(file), (com), (net), or (user) -- [slant]parenthases not included.[/slant]", 0);
			ConsoleLog(" ", 0);
		break;
			
	}



}
