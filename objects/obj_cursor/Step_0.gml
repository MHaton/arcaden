x = mouse_x;
y = mouse_y;

gridX = floor(x / GRID_SIZE);
gridY = floor(y / GRID_SIZE);

if (gridX < 0 || gridY < 0 || gridX >= room_width / GRID_SIZE || gridY >= room_height / GRID_SIZE) {
    hoverNode = noone;
} else {
    hoverNode = map[gridX, gridY];
}



if (mouse_check_button_pressed(mb_right)) {
    if (selectedActor != noone && hoverNode.moveNode) {
        current = hoverNode;
        scr_createPath(selectedActor, current);
        //clear the node
        map[selectedActor.gridX, selectedActor.gridY].occupant = noone;
        //update coords
        selectedActor.gridX = gridX;
        selectedActor.gridY = gridY;
        //update selectedActor's future node
        hoverNode.occupant = selectedActor;

        //gooooo
        selectedActor.state = "begin path";
		selectedActor.endPath = "ready";

        //take actions, wipe
        if (hoverNode.G > selectedActor.move) {
            selectedActor.actions -= 2;
            scr_wipeNodes();
        } else {
            selectedActor.actions -= 1;
            scr_wipeNodes();
        }
        selectedActor = noone;

    }
	if (selectedActor != noone && hoverNode.attackNode){
		switch (selectedActor.attackType){
			case "ranged":
			selectedActor.canAct = false;
			selectedActor.actions -= 1;
			selectedActor.attackTarget = hoverNode.occupant;
			selectedActor.state = "begin attack";
			selectedActor.attackTimer = 10;
		
			selectedActor = noone;
			scr_wipeNodes();
			break;
			case "melee":
			selectedActor.canAct = false;
			selectedActor.attackTarget = hoverNode.occupant;
			
			tempX = abs(hoverNode.gridX - selectedActor.gridX);
			tempY = abs(hoverNode.gridY - selectedActor.gridY);
			
			if (tempX <= 1 && tempY <= 1){
				selectedActor.actions -= 1;
				selectedActor.state = "begin attack";
				selectedActor.attackTimer = 10;
				
				selectedActor = noone;
				scr_wipeNodes();
			}else{
				tempG = 100;
				current = noone;
				
				for (ii = 0; ii < ds_list_size(hoverNode.neighbours); ii += 1;){
					tempNode = ds_list_find_value(hoverNode.neighbours, ii);
					if (tempNode.occupant == noone && tempNode.G < tempG){
						tempG = tempNode.G;
						current = tempNode;
					}
				
				}
				targetNode = current;
				
				scr_createPath(selectedActor, targetNode);
				//clear the node
		        map[selectedActor.gridX, selectedActor.gridY].occupant = noone;
		        //update coords
		        selectedActor.gridX = gridX;
		        selectedActor.gridY = gridY;
		        //update selectedActor's future node
		        hoverNode.occupant = selectedActor;

		        //gooooo
		        selectedActor.state = "begin path";
				selectedActor.endPath = "begin attack";
				selectedActor.attackTarget = hoverNode.occupant;
				selectedActor.actions -= 2;
				selectedActor.canAct = false;
				
				selectedActor = noone;
				scr_wipeNodes();
			}
			break;
		}
		
	}
}