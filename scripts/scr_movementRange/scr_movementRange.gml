// argument0 - original node
// argument1 - unit's movement range
// argument2 - unit's remaining actions

// reset all node data
scr_wipeNodes();

// hold data structures
var open, closed;
// hold instance ID's
var start, current, neighbour;
// hold the other variables
var tempG, range, costMod;

//declare relevant vars from arguments
start = argument0;
range = argument1 * argument2;

//create data structures
open = ds_priority_create();
closed = ds_list_create();

//add starting node to the open list
ds_priority_add(open, start, start.G);

//while open queue is not empty...
//repeat the following until all nodes have been looked at
while(ds_priority_size(open) > 0){
	//remove node with the lowest G score from open
	current = ds_priority_delete_min(open);
	//add that node to the closed list
	ds_list_add(closed,current);
	
	//step through all of current's neighbours
	for (ii = 0; ii < ds_list_size(current.neighbours); ii += 1){
		//store current neighbour in neighbour variable
		neighbour = ds_list_find_value(current.neighbours, ii);
		
		//add neighbour to open list if it qualifies
			//neighbour qualifies if passable, 
			//has no occupant, 
			//projected G score is less than movement range
			//and isn't already on the closed list
		if (ds_list_find_index(closed,neighbour) < 0 && neighbour.passable && neighbour.occupant == noone && neighbour.cost + current.G <= range){
			//only calculate a new G score for neighbour if it hasn't already been calc'd
			if (ds_priority_find_priority(open,neighbour) == 0 || ds_priority_find_priority(open,neighbour) == undefined){
				costMod = 1;
				//give neighbour the appropriate parent
				neighbour.parent = current;
				//if node is diagonal, make it cost more
				if (neighbour.gridX != current.gridX && neighbour.gridY != current.gridY){
					costMod = 1.5;
				}
				//calculate G score of neighbour with cost mod
				neighbour.G = current.G + (neighbour.cost * costMod);
				//add it to the open list so it can be checked out
				ds_priority_add(open,neighbour, neighbour.G);
			}
			//else if neighbours score has already been calculated for the open list
			else{
				//would the neighbour's score be lower if found from the current node?
				costMod = 1;
				//if node is diagonal, make it cost more
				if (neighbour.gridX != current.gridX && neighbour.gridY != current.gridY){
					costMod = 1.5;
				}
				tempG = current.G + (neighbour.cost * costMod);
				//check if G score would be lower
				if (tempG < neighbour.G) {
					neighbour.parent = current;
					neighbour.G = tempG;
					ds_priority_change_priority(open,neighbour,neighbour.G);	
				}	
			}		
		}	
	}
}

// round down all G scores for movement calculations

with (obj_node){
	G = floor(G);
}

//destroy open, don't break the computer pls
ds_priority_destroy(open);

//colour the node and destroy the closed list, also to not splode the computer pls
for (ii = 0; ii < ds_list_size(closed); ii += 1){
	current = ds_list_find_value(closed, ii);
	current.moveNode = true;
	scr_colourMoveNode(current, argument1, argument2);
}
start.moveNode = false;
start.colour = c_white;

// kill it kill it kill it kill it kill it kill it
ds_list_destroy(closed);