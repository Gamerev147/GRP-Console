/// @description create_prog(x, y, obj)
/// @param x
/// @param y
/// @param Object
function create_obj(_x, _y, _obj, _var) {
	/*
	    Create a new object
	        -> CreateObject x y object(name or id)  output: instance_create(x,y,newobject)
	*/
	
	var user_variable = string(_var);

	if ConsoleReal(_x) {
	    if ConsoleReal(_y) {
	        var Obj = asset_get_index(_obj);
		
	        if (Obj != -1) {
	            var inst = instance_create(real(_x), real(_y), Obj);
				ds_map_add(VARMAP, user_variable, inst);
				show_debug_message("\n** Object created with custom variable **");
	        } else {
	            ConsoleLog("[c_red]Instance Not Found", 0, obj_RunnerConsole);
	        }   
		
	    } else {
	        ConsoleLog("[c_red]Data Type Error", 0, obj_RunnerConsole);
	    }
	} else {
	    ConsoleLog("[c_red]Data Type Error", 0, obj_RunnerConsole);
	}

	ConsoleLog(" ", 0, obj_RunnerConsole);

}
