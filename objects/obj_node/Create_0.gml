//grab all the IDs of all the squares around it
neighbours = ds_list_create();

colour = c_white;

occupant = noone;
passable = true;

gridX = 0;
gridY = 0;

type = "node";

//pathfinding variables ----------------------------

parent = noone;

// distance from the source node
G = 0;

// this isn't where we're going, or attacking
moveNode = false;
attackNode = false;


cost = 1;