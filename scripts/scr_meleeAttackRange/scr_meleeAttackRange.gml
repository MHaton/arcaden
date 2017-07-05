//argument0 = Actor we're doing this for

actor = argument0;

range = actor.move;
actions = actor.actions;

with (par_char){
	if (army != other.actor.army){
		tempX = abs(gridX - other.actor.gridX);
		tempY = abs(gridY - other.actor.gridY);
		
		if (tempX <= 1 && tempY <= 1){
			map[gridX, gridY].attackNode = true;
			map[gridX, gridY].colour = c_red;
		}else{
			if (other.actions >1){
				node = map[gridX,gridY];
				for (ii = 0; ii < ds_list_size(node.neighbours); ii +=1){
					neighbour = ds_list_find_value(node.neighbours, ii);
					if (neighbour.G > 0 && neighbour.G <= other.range){
						map[gridX,gridY].attackNode = true;
						map[gridX,gridY].colour = c_red;
					}
				}
			
			}
		
		
		}
	}

}