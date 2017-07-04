///clear the path
path_clear_points(movementPath);
state = "idle";

if (actions > 0){
	obj_cursor.selectedActor = id;
	scr_movementRange(map[gridX,gridY], move, actions);
}else{
	obj_controller.currentActor = noone;
}