event_inherited();

name = "Little Weed";

class = "Rogue";
race = "Elf";

// character statistics
level = 1;
profMod = 2 + floor(level/5);

//base stats
strMod = 0;
dexMod = 3;
conMod = 2;
intMod = 0;
wisMod = 1;
chaMod = 0;

//health variables
maxHitPoints = 8 + conMod + ((level - 1)*(5 + conMod));
hitPoints = maxHitPoints;

//attack variables
hitBonus = profMod + strMod;
attackType = "ranged";
attackRange = 15 * GRID_SIZE;
attackTarget = noone;
attackTimer = 0;

//damage variables
damageDice = 8;
damageBonus = dexMod;
damageType = "piercing";

//defence variables
armourClass = 10 + dexMod;

//move and actions variables
move = 7;
actions = 2;

//initiative
initiative = dexMod;
initRoll = 0;