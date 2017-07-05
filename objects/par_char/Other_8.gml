///clear the path
path_clear_points(movementPath);


if (endPath == "ready") {
    state = "idle";

    if (actions > 0) {
        obj_cursor.selectedActor = id;
        scr_movementRange(map[gridX, gridY], move, actions);
        if (canAct) {
            switch (attackType) {
                case "ranged":
                    scr_rangedAttackRange(id);
                    break;
                case "melee":
                    scr_meleeAttackRange(id);
                    break;
            }

        }
    } else {
        obj_controller.currentActor = noone;
    }
} else {
    state = endPath;

}