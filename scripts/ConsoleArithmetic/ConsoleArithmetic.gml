function ConsoleArithmetic(argument0, argument1, argument2) {
	switch argument1 {
	
	    case "+":
	        return argument0 + argument2;
	    break;
	
	    case "-":
	        return argument0 - argument2;
	    break;
	
	    case "*":
	        return argument0 * argument2;
	    break;
	
	    case "/":
	        return argument0 / argument2;
	    break;
	
	    case "%":
	        return argument0 mod argument2;
	    break;
		
		case "log":
			return logn(argument0, argument2);
		break;
	
	    default:
	        return false;
	    break;
	
	}


}
