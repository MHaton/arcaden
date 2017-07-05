depth = -y;

shake -= 1;

switch (state) {
    case "begin path":
        //zoom zoom
        path_start(movementPath, moveSpeed, 0, true);
        state = "moving";
        break;
    case "begin attack":
        //TODO: pre-attack animations and effects
        attackTimer -= 1;
        if (attackTimer <= 0) {
            state = "attack"
        }
        break;
    case "attack":
        //attack roll
        attackRoll = /*irandom_range(1, 20);*/ 20;
        //determine outcome
        if (attackRoll = 20) {
            attackStatus = "crit";
        } else {
            if (attackRoll + hitBonus >= attackTarget.armourClass) {
                attackStatus = "hit";
            } else {
                attackStatus = "miss";
            }
        }
        damage = 0;
        //damage roll
        if (attackStatus != "miss") {
            damage = irandom_range(1, damageDice) + damageBonus;
            if (attackStatus == "crit") {
                damage += irandom_range(1, damageDice);
            }
        }
        switch (attackType) {
            case "ranged":
                attackDir = point_direction(x + 16, y, attackTarget.x + 16, attackTarget.y);

                beginX = x + 16 + lengthdir_x(30, attackDir);
                beginY = y + lengthdir_y(30, attackDir);

                with(instance_create_layer(beginX, beginY, "effects", obj_arrow)) {
                    attackTarget = other.attackTarget;
                    attackStatus = other.attackStatus;
                    damage = other.damage;
                    damageType = other.damageType;

                    path_add_point(movementPath, other.beginX, other.beginY, 100);

                    if (attackStatus != "miss") {
                        path_add_point(movementPath, attackTarget.x + 16, attackTarget.y, 100);
                    } else {
                        path_add_point(movementPath, attackTarget.x + (irandom_range(30, 60) * choose(-1, 1)), attackTarget.y + (irandom_range(30, 50) * choose(-1, 1)), 100);
                    }
                    path_start(movementPath, speed, true, true);
                }

                state = "end attack";
                attackTimer = 60;
                break;
            case "melee":
                if (attackStatus != "miss") {
                    attackTarget.hitPoints -= damage;
                }		
				scr_hitEffect();		
                break;
        }
        state = "end attack";
        attackTimer = 10;
        break;
    case "end attack":
        attackTimer -= 1;

        if (attackTimer <= 0) {
            if (actions > 0) {
                obj_cursor.selectedActor = id;

                scr_movementRange(map[gridX, gridY], move, actions);
            } else {
                obj_controller.currentActor = noone;
            }
            state = "idle";

        }
        break;

}