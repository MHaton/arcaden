event_inherited();

name = "Slowcoach";

class = "Wizard";
race = "Gnome";

// character statistics
level = 1;
profMod = 2 + floor(level/5);

//base stats
strMod = 0;
dexMod = 0;
conMod = 2;
intMod = 3;
wisMod = 1;
chaMod = 0;

//health variables
maxHitPoints = 6 + conMod + ((level - 1)*(4 + conMod));
hitPoints = maxHitPoints;

//attack variables
hitBonus = profMod + intMod;
attackType = "ranged";
attackRange = 15 * GRID_SIZE
attackTarget = noone;
attackTimer = 0;

//damage variables
damageDice = 10;
damageBonus = 0;
damageType = "fire";

//defence variables
armourClass = 13 + dexMod;

//move and actions variables
move = 6;
actions = 2;

//initiative
initiative = dexMod;
initRoll = 0;