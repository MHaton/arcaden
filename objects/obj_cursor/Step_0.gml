x = mouse_x;
y = mouse_y;

gridX = floor(x/GRID_SIZE);
gridY = floor(y/GRID_SIZE);

if(gridX < 0 || gridY < 0 || gridX >= room_width/GRID_SIZE || gridY >= room_height/GRID_SIZE){
	hoverNode = noone;
}
else { 
hoverNode = map[gridX,gridY];
}



if (mouse_check_button_pressed(mb_right)){
	if (selectedActor != noone && hoverNode.moveNode){
	current = hoverNode;
	//convert path to queue
	path = ds_priority_create();
	ds_priority_add(path, current, current.G);
	
	// step through each node, parent to parent until done
	while (current.parent != noone){
		//add parent not to queue, priority equal to parent's G score
		ds_priority_add(path, current.parent, current.parent.G);
		//set current equal to current's parent, ready to go again
		current = current.parent;
	}
	do {
		//delete lowest priority node (lowest G, closest), store ID
		current = ds_priority_delete_min(path);
		//add current node's sprite coordinates to selectedActor's path
		//TODO: maybe make this correspond to the cost of terrain
		path_add_point(selectedActor.movementPath, current.x, current.y, 100);	
	}
	until (ds_priority_empty(path));
	//clean up, clean up, everybody everywhere
	ds_priority_destroy(path);
	
	//clear the node
	map[selectedActor.gridX,selectedActor.gridY].occupant = noone;
	//update coords
	selectedActor.gridX = gridX;
	selectedActor.gridY = gridY;
	//update selectedActor's future node
	hoverNode.occupant = selectedActor;
	
	//gooooo
	selectedActor.state = "begin path";
	
	//take actions, wipe
	if (hoverNode.G > selectedActor.move){
		selectedActor.actions -= 2;
		scr_wipeNodes();
	}else{
		selectedActor.actions -=1;
		scr_wipeNodes();
	}
	selectedActor = noone;
	
}
}