// if cursor is hovering over a different node to the actor
if(obj_cursor.hoverNode != noone && obj_cursor.hoverNode != map[gridX, gridY]){
	current = obj_cursor.hoverNode;
	//step through every node in the chain, parent to parent until we reach the actor's node
	while (current.parent != noone){
		draw_line_width_colour(current.x + 16, current.y + 16, current.parent.x + 16, current.parent.y + 16, 4, c_lime, c_lime);
		current = current.parent;		
	}
}

draw_self();