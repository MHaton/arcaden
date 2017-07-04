state = "initialising";

randomize();

turnOrder = ds_list_create();

turnCounter = -1;

turnMax = 0;

currentActor = noone;

roundCounter = 0;

globalvar map;

mapWidth = room_width/GRID_SIZE;
mapHeight = room_height/GRID_SIZE;

//create the grid
for(xx = 0; xx < mapWidth; xx += 1){
	for(yy = 0; yy < mapHeight; yy += 1){
		map[xx,yy] = instance_create_layer(xx * GRID_SIZE, yy * GRID_SIZE,"grid", obj_node);
		map[xx,yy].gridX = xx;
		map[xx,yy].gridY = yy;
	}
}

//populate neighbour lists

for (xx = 0; xx < mapWidth; xx += 1){
	for (yy = 0; yy < mapHeight; yy += 1){
		node = map[xx,yy];
		//add left neighbour
		if (xx > 0){
			ds_list_add(node.neighbours, map[xx - 1, yy]);
		}
		//add right neighbour
		if (xx < mapWidth - 1){
			ds_list_add(node.neighbours, map[xx + 1, yy]);
		}
		//add top neighbour
		if (yy > 0){
			ds_list_add(node.neighbours, map[xx, yy - 1]);
		}
		//add bottom neighbour
		if (yy < mapHeight - 1){
			ds_list_add(node.neighbours, map[xx, yy + 1]);
		}
		//top left neighbour
		if (xx > 0 && yy > 0){
			ds_list_add(node.neighbours, map[xx - 1, yy - 1]);
		}
		//top right neighbour
		if (xx < mapWidth -1 && yy > 0){
			ds_list_add(node.neighbours, map[xx + 1, yy - 1]);
		}
		//bottom left neighbour
		if (xx > 0 && yy < mapHeight - 1){
			ds_list_add(node.neighbours, map[xx - 1, yy + 1]);
		}
		//bottom right neighbour
		if (xx < mapWidth -1 && yy < mapHeight - 1){
			ds_list_add(node.neighbours, map[xx + 1, yy + 1]);
		}
	}
}

// make the cursor
instance_create_layer(x,y,"cursor",obj_cursor);