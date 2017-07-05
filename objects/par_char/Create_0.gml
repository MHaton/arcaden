state = "idle";
army = BLUE_ARMY;

gridX = 0;
gridY = 0;

name = "Error!";

class = "Peasant";
race = "Human";

// character statistics
level = 1;
profMod = 2 + floor(level/5);

//base stats
strMod = 0;
dexMod = 0;
conMod = 0;
intMod = 0;
wisMod = 0;
chaMod = 0;

//health variables
maxHitPoints = 4 + conMod + ((level - 1)*(3 + conMod));
hitPoints = maxHitPoints;

//attack variables
hitBonus = profMod + strMod;
attackType = "melee";
attackTarget = noone;
attackTimer = 0;

//damage variables
damageDice = 4;
damageBonus = strMod;
damageType = "piercing";

//defence variables
armourClass = 10 + dexMod;

//move and actions variables
move = 6;
actions = 2;
canAct = false;

initiative = dexMod;
initRoll = 0;


// variables related to pathing-----------------------------
movementPath = path_add();
path_set_kind(movementPath, 2);
path_set_closed(movementPath, false);

endPath = "idle";

moveSpeed = 8;

// variables related to effects -------------------------------

shake = 0;
shakeMag = 0;