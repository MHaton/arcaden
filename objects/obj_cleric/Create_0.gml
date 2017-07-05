event_inherited();

name = "Ben";

class = "Cleric";
race = "Human";

// character statistics
level = 1;
profMod = 2 + floor(level/5);

//base stats
strMod = 1;
dexMod = 0;
conMod = 2;
intMod = 0;
wisMod = 3;
chaMod = 0;

//health variables
maxHitPoints = 8 + conMod + ((level - 1)*(5 + conMod));
hitPoints = maxHitPoints;

//attack variables
hitBonus = profMod + strMod;
attackType = "melee";
attackTarget = noone;
attackTimer = 0;

//damage variables
damageDice = 6;
damageBonus = strMod;
damageType = "bludgeoning";

//defence variables
armourClass = 16;

//move and actions variables
move = 6;
actions = 2;

//initiative
initiative = dexMod;
initRoll = 0;