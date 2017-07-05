//status of attack: "miss", "hit", "crit"

attackStatus = "miss";

//damage and type
damage = 0;
damageType = "piercing";

//targeting
attackTarget = noone;

//who made the attack?
owner = noone;

//path information
movementPath = path_add();
path_set_closed(movementPath, false);
path_set_kind(movementPath, 2);