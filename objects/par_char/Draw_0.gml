// if cursor is hovering over a different node to the actor
if (obj_cursor.selectedActor = id){
	if(obj_cursor.hoverNode != noone){
		tempNode = obj_cursor.hoverNode;
		if (tempNode.moveNode){
		current = tempNode;
		//step through every node in the chain, parent to parent until we reach the actor's node
		while (current.parent != noone){
			draw_line_width_colour(current.x + 16, current.y + 16, current.parent.x + 16, current.parent.y + 16, 4, c_lime, c_lime);
			current = current.parent;
			}		
		}
		if (tempNode.attackNode){
			switch (attackType){
				case "ranged":
					draw_line_width_colour(x + 16, y, tempNode.x + 16, tempNode.y, 4, c_purple, c_purple);
					break;
				case "melee":
					tempX = abs(tempNode.gridX - gridX);
					tempY = abs(tempNode.gridY - gridY);
					
					if (tempX <= 1 && tempY <=1){
						draw_line_width_colour(x + 16, y, tempNode.x + 16, tempNode.y, 4, c_purple, c_purple);
					}else{
						current = noone;
						tempG = 100;
						
						for (ii = 0; ii <ds_list_size(tempNode.neighbours); ii += 1){
							neighbour = ds_list_find_value(tempNode.neighbours, ii);
							
							if(neighbour.occupant == noone && neighbour.G > 0 && neighbour.G < tempG){
								tempG = neighbour.G;
								current = neighbour;							
							}
						}
						draw_line_width_colour(x + 16, y, tempNode.x + 16, tempNode.y, 4, c_red, c_red);
						while (current.parent != noone){
							draw_line_width_colour(x + 16, y, tempNode.x + 16, tempNode.y, 4, c_red, c_red);
							
							current = current.parent;
						}
					}					
					break;
			}
		}
	}
}

if (shake > 0){
	draw_sprite_ext(sprite_index, -1, x + irandom_range(-shakeMag, shakeMag), y + irandom_range(-shakeMag, shakeMag), 1, 1, 0, c_white, 1);
}else{
	draw_self();
}