//Create the text files for "related" pane

function ConsoleBoot_Commands() {
	
	if (!directory_exists("__Commands__")) {
		
		directory_create("__Commands__");
		
		var dir_str = "dir_t \ndir_cr \ndir_dl \ndir_rn";
		file_text_write_all("__Commands__/dir_commands.txt", dir_str);
		
		var file_str = "file_cr \nfile_ch \nfile_wr \nfile_dl \nfile_op \nfile_rn \nfile_cp \nfile_mv \nfile_en \nfile_de \nfile_pa \nfile_pd";
		file_text_write_all("__Commands__/file_commands.txt", file_str);
		
		var net_str = "netchk \nneturl \nn_cr_server \nn_cn_server \nn_send \nn_dn_server \nn_dis_all";
		file_text_write_all("__Commands__/net_commands.txt", net_str);
		
		var sys_str = "sysdir_cr \nsysdir_ch \nsysdir_ld \nsysdir_sv \nsysdir_fls \nsysdir \nsyspath";
		file_text_write_all("__Commands__/sys_commands.txt", sys_str);
		
		var user_str = "u_cr \nu_li \nu_dl \nu_lo \nu_cu \nu_pa_cg";
		file_text_write_all("__Commands__/user_commands.txt", user_str);
		
	} else {
		exit;	
	}

}
