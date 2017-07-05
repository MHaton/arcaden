//argument0 - actor performing the attack

actor = argument0;

with (par_char){
	tempActor = other.actor;
	//check it's an enemy
	if (army != tempActor.army){
		//check range
		if (point_distance(x+16, y+16, tempActor.x + 16, tempActor.y + 16) <= tempActor.attackRange){
			//make sure there's no walls in the way
			//TODO: Make it other objects too
			if (!collision_line(x+16, y+16, tempActor.x + 16, tempActor.y + 16, obj_wall, false, false)){
				map[gridX, gridY].attackNode = true;
				map[gridX, gridY].colour = c_red;	
			}
			
		}
	}
}