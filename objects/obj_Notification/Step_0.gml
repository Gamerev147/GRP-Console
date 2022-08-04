/// @description 
alph -= 0.002;

if (alph <= 0) {
	ds_list_delete(nots, ds_list_find_index(nots, id));
	instance_destroy();	
}
