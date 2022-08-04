function pt(in1, oper, in2) {
	/*
	    make arithmetic operation ( +, -, *, /, %)
	        -> print 5 + 4              output: 9
	    print a string
	        -> print Hola como estas    output: Hola como estas 

	*/
	
	
	var solution;
	var num1 = string(in1);
	var num2 = string(in2);
	var operation = string(oper);
	
	if (string_is_real(num1)) {
		if (string_is_real(num2)) {
			solution = ConsoleArithmetic(real(num1), operation, real(num2));	
		}
	} else {
		if (operation == "" || operation == "undefined" || operation == undefined) {
			if (num2 == "" || num2 == "undefined" || num2 == undefined) {
				solution = string(num1);	
			}
		} else {
			if (num2 != "" && num2 != "undefined" && num2 != undefined) {
				solution = string(num1) + string(operation) + string(num2);	
			} else {
				solution = string(num1) + string(operation);	
			}
		}
	}
	
	ConsoleLog(" ", 0, RUN_ACTIVE);
	ConsoleLog(" = " + string(solution), 0, RUN_ACTIVE);
	ConsoleLog(" ", 0, RUN_ACTIVE);
	
	return solution;
	

}


