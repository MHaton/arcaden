depth = -y;

switch(state){
	case "begin path":
	//zoom zoom
	path_start(movementPath, moveSpeed, 0, true);
	state = "moving";
	break;

}