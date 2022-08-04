function get_att(_obj, _att) {
	//get_att(object, attribute)
	/*
	    Get an object Attribute
	        -> GetAttribute object(name or id) x    output: object.x


	*/
	//To Define Attributes go to script  -> Core/GetReturn  

	

	var Obj, Attribute;
	if ConsoleReal(_obj){
	    Obj = _obj;
	}else{
	    Obj = asset_get_index(_obj);
	}
	Attribute   = string(_att);
	
	
	if (variable_instance_exists(Obj, Attribute)) {
		return string(variable_instance_get(Obj, Attribute));	
	}



}
