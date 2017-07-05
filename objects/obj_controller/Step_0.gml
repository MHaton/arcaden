switch (state) {
    case "initialising":
        with(obj_node) {
            //WHAT AM I?!
            if (instance_position(x + 16, y + 16, par_terrain)) {
                tempTerrain = instance_position(x + 16, y + 16, par_terrain);
                switch (tempTerrain.type) {
                    case "wall":
                        type = "wall";
                        instance_change(obj_wall,true);
                        passable = false;
                        break;
                    case "difficult":
                        type = "difficult";
                        instance_change(obj_rubble,true);
                        cost = 2;
                        break;
                }
                with(tempTerrain) {
                    instance_destroy();
                }

            }
            if (instance_position(x + 16, y + 16, par_char)) {
                occupant = instance_position(x + 16, y + 16, par_char);
                occupant.gridX = gridX;
                occupant.gridY = gridY;
            }
        }
        state = "roll init";
        break;
    case "roll init":
        tempInit = ds_priority_create();
        with(par_char) {
            initRoll = irandom_range(1, 20) + initiative;
            ds_priority_add(other.tempInit, id, initRoll);
        }
        while (ds_priority_size(tempInit) > 0) {
            ds_list_add(turnOrder, ds_priority_delete_max(tempInit));
        }
        turnMax = ds_list_size(turnOrder);
        //no more DS
        ds_priority_destroy(tempInit);
        state = "ready";
        break;
    case "ready":
		if (currentActor == noone){
			turnCounter += 1;
			if (turnCounter >= turnMax){
			 turnCounter = 0;
			 roundCounter += 1;
			}
			currentActor = ds_list_find_value(turnOrder, turnCounter);
			currentActor.actions = 2;
			currentActor.canAct = 2;
			//only give control if the character is a friendly
			//otherwise, flash and alarm
			if (currentActor.army = BLUE_ARMY){
				obj_cursor.selectedActor = currentActor;
			}else{
			currentActor.flash = true;
			currentActor.alarm[0] = 60;
			}
			scr_movementRange(map[currentActor.gridX, currentActor.gridY], currentActor.move, currentActor.actions);
			
			switch (currentActor.attackType){
				case "ranged":
					scr_rangedAttackRange(currentActor);
				break;
				case "melee":
					scr_meleeAttackRange(currentActor);
				break;
			
			}
		}
        break;
}