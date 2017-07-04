if (hoverNode != noone){
	draw_sprite(spr_selected, -1, gridX * GRID_SIZE, gridY * GRID_SIZE);
}

draw_self();


if (hoverNode != noone){
	tempText = string(gridX) + " / " + string(gridY) + " = ";
	if(hoverNode.occupant != noone){
		tempText += hoverNode.occupant.name;
	}else{
		tempText += "noone";
	}
	draw_set_color(c_black);
	draw_rectangle(0,0,string_width(tempText),string_height(tempText),false);
	draw_set_color(c_white);
	draw_text(0,0,tempText);
	
	tempText = hoverNode.type;
	if (hoverNode.passable){
		tempText += " passable = true" + " cost " + string(hoverNode.cost);		
	}
	draw_set_color(c_black);
	draw_rectangle(0,20,string_width(tempText), 20 + string_height(tempText),false);
	draw_set_color(c_white);
	draw_text(0,20,tempText);
}

if (selectedActor != noone){
	tempText = selectedActor.name;
	draw_set_color(c_black);
	draw_rectangle(0,room_height,string_width(tempText), room_height - string_height(tempText),false)
	draw_set_color(c_white);
	draw_text(0,room_height - string_height(tempText),tempText);
}